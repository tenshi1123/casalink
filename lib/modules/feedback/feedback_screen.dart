import 'package:casalink/modules/bottomnavbar/screen/class_screen.dart';
import 'package:casalink/utils/constants/styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../../models/schedule_model.dart';
import '../../repo/follow_class_repo.dart';
import 'detail_daily_feedback.dart';
import 'detail_periodic_feedback.dart';

class FeedBackScreen extends StatefulWidget {
  final ListFeedBackModel listFeedBack;
  const FeedBackScreen({super.key, required this.listFeedBack});

  @override
  State<FeedBackScreen> createState() => _FeedBackScreenState();
}

class _FeedBackScreenState extends State<FeedBackScreen>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;
  int activeTabIndex = 0;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(
      length: 2,
      vsync: this,
      initialIndex: 0,
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
            // TabBar.secondary(
            //   controller: _tabController,
            //   indicator: BoxDecoration(
            //     borderRadius: BorderRadius.circular(
            //       8.r,
            //     ),
            //     //color: const Color(0xff273D8C),
            //   ),
            //   isScrollable: false,
            //   automaticIndicatorColorAdjustment: false,
            //   dividerColor: Colors.white,
            //   labelStyle: defaultText14M,
            //   labelColor: Colors.white,
            //   unselectedLabelColor: const Color(0xff273D8C),
            //   tabs: [
            //     Tab(
            //       child: Container(
            //         height: 34.h,
            //         width: 108.w,
            //         decoration: BoxDecoration(
            //             color: activeTabIndex == 0
            //                 ? const Color(0xFF273D8C)
            //                 : const Color(0xFFEFF1F7),
            //             borderRadius: BorderRadius.all(Radius.circular(8.r))),
            //         child: const Align(
            //           alignment: Alignment.center,
            //           child: Text("Hằng ngày"),
            //         ),
            //       ),
            //     ),
            //     Tab(
            //       child: Container(
            //         height: 34.h,
            //         width: 108.w,
            //         decoration: BoxDecoration(
            //             color: activeTabIndex == 1
            //                 ? const Color(0xFF273D8C)
            //                 : const Color(0xFFEFF1F7),
            //             borderRadius: BorderRadius.all(Radius.circular(8.r))),
            //         child: const Align(
            //           alignment: Alignment.center,
            //           child: Text("Định kì"),
            //         ),
            //       ),
            //     ),
            //   ],
            // ),
            Container(
              height: kToolbarHeight,
              margin: EdgeInsets.only(
                top: 16.0,
                right: 16.w,
                left: 16.w,
              ),
              decoration: const BoxDecoration(
                color: Color(0xffEFEFEF),
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(20),
                    topRight: Radius.circular(20)),
              ),
              child: TabBar.secondary(
                padding: EdgeInsets.zero,
                controller: _tabController,
                indicator: BoxDecoration(
                    borderRadius: const BorderRadius.only(
                        topLeft: Radius.circular(20),
                        topRight: Radius.circular(20)),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withAlpha(50),
                        blurRadius: 4,
                        offset: const Offset(0, 4), // Shadow position
                      ),
                    ],
                    color: Colors.white),
                labelColor: Colors.black,
                unselectedLabelColor: const Color(0xff292929).withAlpha(84),
                tabs: const [
                  Tab(
                    text: "Hằng ngày",
                  ),
                  Tab(
                    text: "Định kì",
                    // child: Container(
                    //   color: activeTabIndex == 1
                    //       ? const Color(0xFF273D8C)
                    //       : const Color(0xFFEFF1F7),
                    //   child: const Align(
                    //     alignment: Alignment.center,
                    //     child: Text("Định kì"),
                    //   ),
                    // ),
                  ),
                ],
              ),
            ),

            Flexible(
              child: TabBarView(
                controller: _tabController,
                children: <Widget>[
                  //Hang ngay
                  Container(
                    width: 343.w,
                    margin: EdgeInsets.symmetric(
                      horizontal: 16.w,
                    ),
                    padding: EdgeInsets.symmetric(
                      horizontal: 16.w,
                    ),
                    decoration: BoxDecoration(
                      borderRadius: const BorderRadius.only(
                          bottomLeft: Radius.circular(20),
                          bottomRight: Radius.circular(20)),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withAlpha(50),
                          spreadRadius: 0,
                          blurRadius: 4,
                          offset: const Offset(0, 4),
                        ),
                      ],
                      color: Colors.white,
                    ),
                    child: ListView.builder(
                        shrinkWrap: true,
                        physics: const ClampingScrollPhysics(),
                        itemCount: widget.listFeedBack.listFbDaily.length,
                        itemBuilder: (BuildContext context, int index) {
                          return InkWell(
                            onTap: () async {
                              String detailFeedBack =
                                  await FollowClassRepo().getDetailFeedback(
                                widget.listFeedBack.listFbDaily[0]
                                    .listFeedback[index].id,
                                widget.listFeedBack.listFbDaily[0]
                                    .listFeedback[index].typelearn,
                                widget.listFeedBack.listFbDaily[0]
                                    .listFeedback[index].meetingId,
                              );
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: ((context) => DailyFeedback(
                                        feedback: detailFeedBack,
                                        feedbackModel: widget.listFeedBack
                                            .listFbDaily[0].listFeedback[index],
                                      )),
                                ),
                              );
                            },
                            child: LessonItem(
                              title: title[index],
                              model: widget.listFeedBack.listFbDaily[0]
                                  .listFeedback[index],
                            ),
                          );
                        }),
                  ),
                  //Dinh ki
                  Container(
                    width: 343.w,
                    margin: EdgeInsets.symmetric(
                      horizontal: 16.w,
                    ),
                    padding: EdgeInsets.symmetric(
                      horizontal: 16.w,
                    ),
                    decoration: BoxDecoration(
                      borderRadius: const BorderRadius.only(
                          bottomLeft: Radius.circular(20),
                          bottomRight: Radius.circular(20)),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withAlpha(50),
                          spreadRadius: 0,
                          blurRadius: 4,
                          offset: const Offset(0, 4),
                        ),
                      ],
                      color: Colors.white,
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        ListView.builder(
                            shrinkWrap: true,
                            physics: const ClampingScrollPhysics(),
                            itemCount: widget.listFeedBack.listFbDaily.length,
                            itemBuilder: (BuildContext context, int index) {
                              return InkWell(
                                onTap: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: ((context) =>
                                          const PeriodicFeedback()),
                                    ),
                                  );
                                },
                                child: LessonItem(
                                  title: _title123[index],
                                  model: widget.listFeedBack.listFbDinhKy[0]
                                      .listFeedback[index],
                                ),
                              );
                            }),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            //Dinh Ki
          ],
        ),
      ),
    );
  }
}

class LessonItem extends StatefulWidget {
  const LessonItem({super.key, required this.title, required this.model});
  final String title;
  final FeedbackModel model;
  @override
  State<LessonItem> createState() => _LessonItemState();
}

class _LessonItemState extends State<LessonItem> {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        SizedBox(
          height: 12.h,
        ),
        Row(
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  widget.model.createdAt,
                  style: defaultText14M.copyWith(
                    fontWeight: FontWeight.w500,
                    color: const Color(0xff3C3C3C).withValues(alpha: 0.6),
                  ),
                ),
                Text(
                  widget.model.tenBuoi,
                  style: defaultText16M.copyWith(
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ],
            ),
            const Spacer(),
            SvgPicture.asset(
              'assets/icons/arrow_right.svg',
            ),
            SizedBox(
              width: 16.w,
            ),
          ],
        ),
        Divider(
          color: const Color(0xff292929).withAlpha(20),
        ),
      ],
    );
  }
}

List<String> _title123 = [
  'Đánh giá giữa khoá - tháng 6',
  'Đánh giá giữa khoá - tháng 7',
  'Đánh giá giữa khoá - tháng 8',
  'Đánh giá giữa khoá - tháng 9',
  'Đánh giá giữa khoá - tháng 10',
  'Đánh giá giữa khoá - tháng 11',
];
