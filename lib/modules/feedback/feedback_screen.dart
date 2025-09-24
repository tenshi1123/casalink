import 'package:casalink/utils/constants/styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:intl/intl.dart';
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
      length: 3,
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
                tabs: [
                  Tab(
                    text: "Hằng ngày",
                  ),
                  Tab(
                    text: "Giữa tháng",
                  ),
                  Tab(
                    text: "Cuối tháng",
                  ),
                ],
              ),
            ),
            Flexible(
              child: TabBarView(
                controller: _tabController,
                children: <Widget>[
                  Container(
                    width: 343.w,
                    margin: EdgeInsets.only(
                      left: 16.w,
                      right: 16.w,
                      bottom: 16.h,
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
                    child: widget.listFeedBack.listFbDaily.isEmpty
                        ? Image.asset('assets/images/empty2.png')
                        : ListView.builder(
                            shrinkWrap: true,
                            physics: const ClampingScrollPhysics(),
                            itemCount: widget.listFeedBack.listFbDaily.length,
                            itemBuilder: (BuildContext context, int index) {
                              return ListFbDaily(
                                model: widget.listFeedBack.listFbDaily[index],
                              );
                            }),
                  ),
                  Container(
                    width: 343.w,
                    margin: EdgeInsets.only(
                      left: 16.w,
                      right: 16.w,
                      bottom: 16.h,
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
                    child: widget.listFeedBack.listMidMonth.isEmpty
                        ? Image.asset('assets/images/empty2.png')
                        : ListView.builder(
                            shrinkWrap: true,
                            physics: const ClampingScrollPhysics(),
                            itemCount: widget.listFeedBack.listMidMonth.length,
                            itemBuilder: (BuildContext context, int index) {
                              return ListFbDinhKy(
                                model: widget.listFeedBack.listMidMonth[index],
                                type: 1,
                              );
                            }),
                  ),
                  Container(
                    width: 343.w,
                    margin: EdgeInsets.only(
                      left: 16.w,
                      right: 16.w,
                      bottom: 16.h,
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
                    child: widget.listFeedBack.listEndMonth.isEmpty
                        ? Image.asset('assets/images/empty2.png')
                        : ListView.builder(
                            shrinkWrap: true,
                            physics: const ClampingScrollPhysics(),
                            itemCount: widget.listFeedBack.listEndMonth.length,
                            itemBuilder: (BuildContext context, int index) {
                              return ListFbDinhKy(
                                model: widget.listFeedBack.listEndMonth[index],
                                type: 2,
                              );
                            }),
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

class ListFbDaily extends StatelessWidget {
  const ListFbDaily({super.key, required this.model});
  final FeedbackHangNgayModel model;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: EdgeInsets.only(
            top: 16.h,
            bottom: 12.h,
          ),
          child: Align(
            alignment: Alignment.centerLeft,
            child: Text(
              'Lớp ${model.name}',
              style: defaultText20B.copyWith(
                color: const Color(0xff273D8C),
              ),
            ),
          ),
        ),
        ListView.builder(
            shrinkWrap: true,
            physics: const ClampingScrollPhysics(),
            itemCount: model.listFeedback.length,
            itemBuilder: (BuildContext context, int index) {
              final reversedIndex = model.listFeedback.length - 1 - index;
              return InkWell(
                onTap: () async {
                  String detailFeedBack =
                      await FollowClassRepo().getDetailFeedback(
                    model.listFeedback[reversedIndex].id,
                    model.listFeedback[reversedIndex].typelearn,
                    model.listFeedback[reversedIndex].meetingId,
                  );
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: ((context) => DailyFeedback(
                            feedback: detailFeedBack,
                            feedbackModel: model.listFeedback[reversedIndex],
                          )),
                    ),
                  );
                },
                child: LessonItem(
                  model: model.listFeedback[reversedIndex],
                  type: 0,
                ),
              );
            }),
      ],
    );
  }
}

class ListFbDinhKy extends StatelessWidget {
  const ListFbDinhKy({super.key, required this.model, required this.type});
  final FeedbackDinhKyModel model;
  final int type;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: EdgeInsets.only(
            top: 16.h,
            bottom: 12.h,
          ),
          child: Align(
            alignment: Alignment.centerLeft,
            child: Text(
              'Lớp ${model.name}',
              style: defaultText20B.copyWith(
                color: const Color(0xff273D8C),
              ),
            ),
          ),
        ),
        ListView.builder(
            shrinkWrap: true,
            physics: const ClampingScrollPhysics(),
            itemCount: model.listFeedback.length,
            itemBuilder: (BuildContext context, int index) {
              final reversedIndex = model.listFeedback.length - 1 - index;
              return InkWell(
                onTap: () async {
                  String detailFeedBack =
                      await FollowClassRepo().getDetailFeedback(
                    model.listFeedback[reversedIndex].id,
                    model.listFeedback[reversedIndex].typelearn,
                    model.listFeedback[reversedIndex].meetingId,
                  );
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: ((context) => PeriodicFeedback(
                            feedback: detailFeedBack,
                            feedbackModel: model.listFeedback[reversedIndex],
                          )),
                    ),
                  );
                },
                child: LessonItem(
                  model: model.listFeedback[reversedIndex],
                  type: type,
                ),
              );
            }),
      ],
    );
  }
}

class LessonItem extends StatefulWidget {
  const LessonItem({super.key, required this.model, required this.type});
  final FeedbackModel model;
  final int type;
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
                  widget.type == 0
                      ? widget.model.tenBuoi
                      : widget.type == 1
                          ? 'Đánh giá giữa tháng ${DateFormat("dd-MM-yyyy").parse(widget.model.createdAt).month}'
                          : 'Đánh giá cuối tháng ${DateFormat("dd-MM-yyyy").parse(widget.model.createdAt).month}',
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
