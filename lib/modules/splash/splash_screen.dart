import 'dart:async';

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

    // Get the current patch number and print it to the console.
    // It will be `null` if no patches are installed.
    _checkForUpdates();
    databaseInitialized();
    Timer(const Duration(seconds: 0), () async {
      final SharedPreferences prefs = await SharedPreferences.getInstance();
      final String? token = prefs.getString('token');
      checked = (token != null && token != '');
      if (checked) {
        InfoModel infoModel = await InfoRepo().getInfo();
        //CheckinModel infoClassModel = await FollowClassRepo().getListCheckin();
        InfoHomeModel infoClassModel = await InfoRepo().getInfoClass();
        AppRouter.toPage(context, AppPages.BottomNavBarPage,
            // blocValue: _authBloc,
            arguments: {
              'infoModel': infoModel,
              'infoClassModel': infoClassModel
            });
      } else {
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(
            builder: (context) => const Onbonding(),
            // quá mệt mỏi rồi, ngày hôm nay cô ấy chẳng quan tâm gì mấy chỉ một người để yêu thương lúc này ngày hôm ấy cố muốn đi để mua một đóa hoa trang trí nơi đẹp nhất trong nhà cô ấy hay buồn lúc mưa thích nghe câu ca ngày xưa, Những lúc khi trời đông nhớ vòng tay ấm nồng và ôm cô ấy thật lâu người ấy vì thương tôi chờ đợi tôi cũng lâu rồi
            //builder: (context) => const BottomNavBar(),
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
