// ignore_for_file: library_private_types_in_public_api

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../utils/constants/mediaqury.dart';
import '../../../utils/constants/vn_languegua.dart';
import '../../login/login_screen.dart';
import '../../utils/constants/styles.dart';

class Onbonding extends StatefulWidget {
  const Onbonding({super.key});

  @override
  _OnbondingState createState() => _OnbondingState();
}

class _OnbondingState extends State<Onbonding> {
  final int _numPages = 3;

  final PageController _pageController = PageController(initialPage: 0);
  int _currentPage = 0;

  List<Widget> _buildPageIndicator() {
    List<Widget> list = [];
    for (int i = 0; i < _numPages; i++) {
      list.add(i == _currentPage ? _indicator(true) : _indicator(false));
    }
    return list;
  }

  late bool isLoading;

  @override
  void initState() {
    isLoading = true;
    Future.delayed(const Duration(seconds: 2), () {
      setState(() {
        isLoading = false;
      });
    });
    super.initState();
  }

  Widget _indicator(bool isActive) {
    return AnimatedContainer(
      duration: const Duration(microseconds: 150),
      margin: const EdgeInsets.symmetric(horizontal: 3.0),
      height: 8.h,
      width: isActive ? 20.w : 8.h,
      decoration: BoxDecoration(
        color: isActive ? const Color(0xff28B4E9) : Colors.white,
        borderRadius: BorderRadius.all(
          Radius.circular(100.r),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    height = MediaQuery.of(context).size.height;
    width = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: Colors.white,
      body: AnnotatedRegion<SystemUiOverlayStyle>(
        value: SystemUiOverlayStyle.light,
        child: Stack(
          children: [
            Container(
              decoration: const BoxDecoration(
                color: Colors.white,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: <Widget>[
                  Container(
                    color: Colors.white,
                    height: height,
                    child: PageView(
                      physics: const ClampingScrollPhysics(),
                      controller: _pageController,
                      onPageChanged: (int page) {
                        setState(() {
                          _currentPage = page;
                        });
                      },
                      children: [
                        Stack(
                          children: [
                            Image.asset(
                              "assets/images/onboard1.png",
                              width: 375.w,
                              height: 815.h,
                              fit: BoxFit.fill,
                            ),
                            SingleChildScrollView(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Center(
                                    child: Column(
                                      children: [
                                        SizedBox(height: 500.h),
                                        Padding(
                                          padding: EdgeInsets.symmetric(
                                              horizontal: 18.w),
                                          child: Text(
                                            'Đồng hành cùng con mọi lúc, mọi nơi',
                                            style: TextStyle(
                                              color: Colors.white,
                                              fontSize: 18.sp,
                                              fontWeight: FontWeight.bold,
                                            ),
                                          ),
                                        ),
                                        SizedBox(height: height / 40),
                                        Padding(
                                          padding: EdgeInsets.symmetric(
                                              horizontal: 20.w),
                                          child: Text(
                                            VnString.itisrecommended,
                                            textAlign: TextAlign.center,
                                            style: defaultText16Re.copyWith(
                                              color: Colors.white
                                                  .withOpacity(0.59),
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  )
                                ],
                              ),
                            ),
                          ],
                        ),
                        Stack(
                          children: [
                            Image.asset(
                              "assets/images/onboard2.png",
                              width: 375.w,
                              height: 815.h,
                              fit: BoxFit.fill,
                            ),
                            SingleChildScrollView(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Center(
                                    child: Column(
                                      children: [
                                        SizedBox(height: 500.h),
                                        Padding(
                                          padding: EdgeInsets.symmetric(
                                              horizontal: 18.w),
                                          child: Text(
                                            'Đồng hành cùng con mọi lúc, mọi nơi',
                                            style: TextStyle(
                                              color: Colors.white,
                                              fontSize: 18.sp,
                                              fontWeight: FontWeight.bold,
                                            ),
                                          ),
                                        ),
                                        SizedBox(height: height / 40),
                                        Padding(
                                          padding: EdgeInsets.symmetric(
                                              horizontal: 20.w),
                                          child: Text(
                                            VnString.itisrecommended,
                                            textAlign: TextAlign.center,
                                            style: defaultText16Re.copyWith(
                                              color: Colors.white
                                                  .withOpacity(0.59),
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  )
                                ],
                              ),
                            ),
                          ],
                        ),
                        Stack(
                          children: [
                            Image.asset(
                              "assets/images/onboard3.png",
                              width: 375.w,
                              height: 815.h,
                              fit: BoxFit.fill,
                            ),
                            SingleChildScrollView(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Center(
                                    child: Column(
                                      children: [
                                        SizedBox(height: 500.h),
                                        Padding(
                                          padding: EdgeInsets.symmetric(
                                              horizontal: 18.w),
                                          child: Text(
                                            'Đồng hành cùng con mọi lúc, mọi nơi',
                                            style: TextStyle(
                                              color: Colors.white,
                                              fontSize: 18.sp,
                                              fontWeight: FontWeight.bold,
                                            ),
                                          ),
                                        ),
                                        SizedBox(height: height / 40),
                                        Padding(
                                          padding: EdgeInsets.symmetric(
                                              horizontal: 20.w),
                                          child: Text(
                                            VnString.itisrecommended,
                                            textAlign: TextAlign.center,
                                            style: defaultText16Re.copyWith(
                                              color: Colors.white
                                                  .withOpacity(0.59),
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  )
                                ],
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            // _currentPage != _numPages - 1
            //     ? Column(
            //         children: [
            //           SizedBox(height: height / 1.12),
            //           Container(
            //             color: Colors.transparent,
            //             height: height / 11,
            //             child: Align(
            //               child: Padding(
            //                 padding: EdgeInsets.symmetric(horizontal: 22.w),
            //                 child: Row(
            //                   mainAxisAlignment: MainAxisAlignment.spaceBetween,
            //                   children: <Widget>[

            //                     Container(
            //                       color: Colors.transparent,
            //                       child: Row(
            //                         mainAxisAlignment: MainAxisAlignment.center,
            //                         children: _buildPageIndicator(),
            //                       ),
            //                     ),
            //                     GestureDetector(
            //                       onTap: () {
            //                         _pageController.nextPage(
            //                             duration:
            //                                 const Duration(microseconds: 300),
            //                             curve: Curves.easeIn);
            //                       },
            //                       child: Container(
            //                           height: 42.h,
            //                           width: 42.w,
            //                           decoration: BoxDecoration(
            //                               color: sub1Color,
            //                               borderRadius: BorderRadius.all(
            //                                   Radius.circular(16.r))),
            //                           child: Center(
            //                             child: Icon(
            //                               Icons.keyboard_arrow_right,
            //                               size: 30.h,
            //                               color: wihitecolor,
            //                             ),
            //                           )),
            //                     ),
            //                   ],
            //                 ),
            //               ),
            //             ),
            //           ),
            //         ],
            //       )
            //     :
            Column(
              children: [
                SizedBox(
                  height: 68.h,
                ),
                Row(
                  children: [
                    const Spacer(),
                    GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: ((context) => const LoginScreen()),
                          ),
                        );
                      },
                      child: Text(
                        "Bỏ qua",
                        style: defaultText16M.copyWith(color: Colors.white),
                      ),
                    ),
                    SizedBox(
                      width: width / 20,
                    ),
                  ],
                ),
                const Spacer(),
                Container(
                  color: Colors.transparent,
                  height: height / 4,
                  child: Align(
                    child: Padding(
                      padding: EdgeInsets.symmetric(horizontal: 22.w),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: <Widget>[
                          Container(
                            color: Colors.transparent,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: _buildPageIndicator(),
                            ),
                          ),
                          GestureDetector(
                            onTap: () {
                              _currentPage != _numPages - 1
                                  ? _pageController.nextPage(
                                      duration:
                                          const Duration(microseconds: 300),
                                      curve: Curves.easeIn)
                                  : Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: ((context) =>
                                            const LoginScreen()),
                                      ),
                                    );
                            },
                            child: Container(
                              height: 52.h,
                              width: 434.w,
                              decoration: BoxDecoration(
                                  color: const Color(0xff28B4E9),
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(32.r))),
                              child: Center(
                                  child: Text(
                                _currentPage != _numPages - 1
                                    ? 'Tiếp tục'
                                    : 'Trải nghiệm ngay',
                                style: defaultText16B.copyWith(
                                  color: Colors.white,
                                ),
                              )),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
