import 'dart:async';

import 'package:casalink/models/checkin_model.dart';
import 'package:casalink/repo/follow_class_repo.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:shorebird_code_push/shorebird_code_push.dart';
import 'package:upgrader/upgrader.dart';

//import '../bottomnavbar/bottom_nav_bar.dart';
import '../../main.dart';
import '../../models/info_model.dart';
import '../../repo/category_repo.dart';
import '../../repo/info_repo.dart';
import '../../router/app_pages.dart';
import '../../router/app_router.dart';
import 'onboarding.dart';

class Splshscreen extends StatefulWidget {
  const Splshscreen({super.key});

  @override
  State<Splshscreen> createState() => _SplshscreenState();
}

class _SplshscreenState extends State<Splshscreen> {
  bool checked = false;
  final updater = ShorebirdUpdater();
  @override
  void initState() {
    super.initState();
    _checkForUpdates();
    databaseInitialized();
    Timer(const Duration(seconds: 0), () async {
      final SharedPreferences prefs = await SharedPreferences.getInstance();
      final String? token = prefs.getString('token');
      checked = (token != null && token != '');
      if (checked) {
        InfoModel? infoModel = await InfoRepo().getInfo();
        // troi oi buon ngu qua
        if (infoModel == null) {
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(
              builder: (context) => const Onbonding(),
            ),
          );
        } else {
          // CheckinModel infoClassModel =
          //     await FollowClassRepo().getListCheckin();
          InfoHomeModel infoClassModel = await InfoRepo().getInfoClass();

          AppRouter.toPage(context, AppPages.BottomNavBarPage, arguments: {
            'infoModel': infoModel,
            'infoClassModel': infoClassModel
          });
        }
      } else {
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(
            builder: (context) => const Onbonding(),
          ),
        );
      }
    });
  }

  Future<void> _checkForUpdates() async {
    updater.readCurrentPatch().then((currentPatch) {
      print('The current patch number is: ${currentPatch?.number}');
    });
    // Check whether a new update is available.
    final status = await updater.checkForUpdate();
    if (status == UpdateStatus.outdated) {
      try {
        // Perform the update
        await updater.update();
      } on UpdateException {
        // Handle any errors that occur while updating.
      }
    }
  }

  Future<void> databaseInitialized() async {
    listCategori = await CategoryRepo().getCategories();
    listPostCate = await CategoryRepo().getPostCaties();
  }

  @override
  Widget build(BuildContext context) {
    return UpgradeAlert(
      dialogStyle: UpgradeDialogStyle.cupertino,
      showLater: true,
      upgrader: Upgrader(
        languageCode: "vi",
        durationUntilAlertAgain: const Duration(minutes: 5),
      ),
      child: Scaffold(
        backgroundColor: Colors.white,
        body: Image.asset(
          "assets/images/splash.png",
          height: 844.h,
          width: 390.w,
          fit: BoxFit.fill,
        ),
      ),
    );
  }
}
