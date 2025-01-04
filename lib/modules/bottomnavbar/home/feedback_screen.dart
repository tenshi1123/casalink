import 'package:casalink/utils/constants/styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
//import 'package:flutter_screenutil/flutter_screenutil.dart';

class FeedBackScreen extends StatefulWidget {
  const FeedBackScreen({super.key});

  @override
  State<FeedBackScreen> createState() => _FeedBackScreenState();
}

class _FeedBackScreenState extends State<FeedBackScreen>
    with TickerProviderStateMixin {
  late TabController _tabController;
  int activeTabIndex = 1;
  @override
  @override
  void initState() {
    super.initState();
    _tabController = TabController(
      length: 2,
      vsync: this,
      initialIndex: 1,
    );
    _tabController.addListener(() {
      setState(() {
        activeTabIndex = _tabController.index;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: const Color(0xff273D8C),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios_new, color: Colors.white),
          onPressed: () {
            Navigator.of(context).pop(false);
          },
        ),
        title: Text(
          'Kiểm tra đánh giá và nhận xét',
          style: defaultText18B.copyWith(
            color: Colors.white,
          ),
        ),
      ),
      body: Container(
        width: 375.w,
        height: 812.h,
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage("assets/images/feedback_background.png"),
            fit: BoxFit.fitWidth,
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            TabBar.secondary(
              controller: _tabController,
              indicator: BoxDecoration(
                borderRadius: BorderRadius.circular(
                  8.r,
                ),
                //color: const Color(0xff273D8C),
              ),
              isScrollable: false,
              automaticIndicatorColorAdjustment: false,
              dividerColor: Colors.white,
              labelStyle: defaultText14M,
              labelColor: Colors.white,
              unselectedLabelColor: const Color(0xff273D8C),
              tabs: [
                Tab(
                  child: Container(
                    height: 34.h,
                    width: 108.w,
                    decoration: BoxDecoration(
                        color: activeTabIndex == 0
                            ? const Color(0xFF273D8C)
                            : const Color(0xFFEFF1F7),
                        borderRadius: BorderRadius.all(Radius.circular(8.r))),
                    child: const Align(
                      alignment: Alignment.center,
                      child: Text("Hằng ngày"),
                    ),
                  ),
                ),
                Tab(
                  child: Container(
                    height: 34.h,
                    width: 108.w,
                    decoration: BoxDecoration(
                        color: activeTabIndex == 1
                            ? const Color(0xFF273D8C)
                            : const Color(0xFFEFF1F7),
                        borderRadius: BorderRadius.all(Radius.circular(8.r))),
                    child: const Align(
                      alignment: Alignment.center,
                      child: Text("Định kì"),
                    ),
                  ),
                ),
              ],
            ),
            Expanded(
              child: TabBarView(
                controller: _tabController,
                children: <Widget>[
                  Container(
                    height: 367.h,
                    width: 343.w,
                    margin: EdgeInsets.symmetric(
                      horizontal: 16.w,
                      vertical: 16.h,
                    ),
                    padding: EdgeInsets.symmetric(
                      vertical: 16.h,
                      horizontal: 16.w,
                    ),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(16.r),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey.withAlpha(50),
                          spreadRadius: 0,
                          blurRadius: 10,
                          offset: const Offset(0, 6),
                        ),
                      ],
                      color: Colors.white,
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            Image(
                              image: const AssetImage(
                                  'assets/images/icon_file.png'),
                              height: 48.h,
                              width: 48.w,
                            ),
                            SizedBox(
                              width: 16.w,
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'Tenbaitap.PDF',
                                  style: defaultText16B,
                                ),
                                Text(
                                  'chọn bài tập bạn muốn xem',
                                  style: defaultText14Re.copyWith(
                                    color: Colors.black.withAlpha(60),
                                  ),
                                ),
                              ],
                            )
                          ],
                        ),
                        const Divider(thickness: 1),
                        Text(
                          'Hạn nộp bài: 26 tháng 1,2025',
                          style: defaultText14B,
                        ),
                        SizedBox(
                          height: 10.h,
                        ),
                        Stack(
                          children: [
                            Container(
                              width: 120.w,
                              height: 80.h,
                              decoration: BoxDecoration(
                                color: Colors.blue.shade100,
                                image: const DecorationImage(
                                  fit: BoxFit.cover,
                                  image: AssetImage('assets/images/image.png')
                                      as ImageProvider,
                                ),
                                gradient: LinearGradient(
                                    begin: FractionalOffset.topCenter,
                                    end: FractionalOffset.bottomCenter,
                                    colors: [
                                      Colors.grey.withOpacity(0.0),
                                      Colors.black,
                                    ],
                                    stops: const [
                                      0.0,
                                      1.0,
                                    ]),
                              ),
                            ),
                            Container(
                              width: 120.w,
                              height: 80.h,
                              decoration: BoxDecoration(
                                gradient: LinearGradient(
                                    begin: FractionalOffset.topCenter,
                                    end: FractionalOffset.bottomCenter,
                                    colors: [
                                      Colors.white,
                                      Colors.black.withAlpha(40),
                                    ],
                                    stops: const [
                                      0.0,
                                      1.0,
                                    ]),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  //Tai lieu
                  Column(
                    children: [
                      SizedBox(
                        width: 343.w,
                        height: 80.h,
                        child: Row(
                          children: [
                            Text('Không có tài liệu', style: defaultText16M)
                          ],
                        ),
                      )
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
