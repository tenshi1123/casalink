import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shared_preferences/shared_preferences.dart';

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
  @override
  void initState() {
    super.initState();
    databaseInitialized();
    Timer(const Duration(seconds: 0), () async {
      final SharedPreferences prefs = await SharedPreferences.getInstance();
      final String? token = prefs.getString('token');
      checked = (token != null && token != '');
      if (checked) {
        InfoModel infoModel = await InfoRepo().getInfo();
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

  Future<void> databaseInitialized() async {
    listCategori = await CategoryRepo().getCategories();
    listPostCate = await CategoryRepo().getPostCaties();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Image.asset(
        "assets/images/splash.png",
        height: 844.h,
        width: 390.w,
        fit: BoxFit.fill,
      ),
    );
  }
}
