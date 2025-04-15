import 'package:casalink/models/checkin_model.dart';
import 'package:casalink/utils/constants/styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

//import 'package:flutter_screenutil/flutter_screenutil.dart';

class HistoryScreen extends StatefulWidget {
  const HistoryScreen({
    super.key,
    required this.model,
  });
  final List<LeaveModel> model;
  @override
  State<HistoryScreen> createState() => _HistoryScreenState();
}

class _HistoryScreenState extends State<HistoryScreen> {
  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
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
          'Lịch sử xin nghỉ',
          style: defaultText18B.copyWith(
            color: Colors.white,
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 16.h),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Expanded(
              //   child: NestedTabBar(
              //     detailLesson: widget.detailLesson,
              //   ),
              // )
              SizedBox(
                height: 700.h,
                width: 343.w,
                child: NestedTabBar(
                  model: widget.model,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class NestedTabBar extends StatefulWidget {
  const NestedTabBar({
    super.key,
    required this.model,
  });
  final List<LeaveModel> model;
  @override
  State<NestedTabBar> createState() => _NestedTabBarState();
}

class _NestedTabBarState extends State<NestedTabBar>
    with TickerProviderStateMixin {
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
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return widget.model.isEmpty
        ? Center(
            child: Column(
              children: [
                SizedBox(
                  height: 10.h,
                ),
                Image.asset(
                  'assets/images/empty.png',
                  height: 200.h,
                  width: 200.w,
                ),
                Text(
                  'Không có lịch sử xin nghỉ',
                  style: defaultText16B,
                ),
                SizedBox(
                  height: 20.h,
                ),
              ],
            ),
          )
        : ListView.builder(
            shrinkWrap: true,
            physics: const ScrollPhysics(),
            itemCount: widget.model.length,
            itemBuilder: (context, index) {
              return Container(
                //height: 110.h,
                constraints: BoxConstraints(minHeight: 120.h, maxHeight: 200.h),
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
                      color: Colors.grey.withAlpha(90),
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
                    Text(
                      'Buổi học : ${widget.model[index].buoiHoc}',
                      style: defaultText14M,
                      overflow: TextOverflow.ellipsis,
                    ),
                    SizedBox(
                      height: 5.h,
                    ),
                    Text(
                      'Lớp học : ${widget.model[index].lopHoc}',
                      style: defaultText14M,
                      overflow: TextOverflow.ellipsis,
                    ),
                    SizedBox(
                      height: 5.h,
                    ),
                    Text(
                      'Thời gian nộp đơn : ${widget.model[index].createdAt}',
                      style: defaultText14M,
                      overflow: TextOverflow.ellipsis,
                    ),
                    SizedBox(
                      height: 5.h,
                    ),
                    Expanded(
                      child: Text(
                        'Lý do : ${widget.model[index].reason}',
                        style: defaultText14M,
                        overflow: TextOverflow.ellipsis,
                        maxLines: 20,
                      ),
                    ),
                  ],
                ),
              );
            },
          );

    // Column(
    //   children: <Widget>[
    //     TabBar.secondary(
    //       controller: _tabController,
    //       indicator: BoxDecoration(
    //         borderRadius: BorderRadius.circular(
    //           8.r,
    //         ),
    //         //color: const Color(0xff273D8C),
    //       ),
    //       isScrollable: false,
    //       automaticIndicatorColorAdjustment: false,
    //       dividerColor: Colors.white,
    //       labelStyle: defaultText14M,
    //       labelColor: Colors.white,
    //       unselectedLabelColor: const Color(0xff273D8C),
    //       tabs: [
    //         Tab(
    //           child: Container(
    //             height: 34.h,
    //             width: 108.w,
    //             decoration: BoxDecoration(
    //                 color: activeTabIndex == 0
    //                     ? const Color(0xffED1C24)
    //                     : const Color(0xffED1C24).withAlpha(40),
    //                 borderRadius: BorderRadius.all(Radius.circular(8.r))),
    //             child: const Align(
    //               alignment: Alignment.center,
    //               child: Text("Xin Nghỉ"),
    //             ),
    //           ),
    //         ),
    //         Tab(
    //           child: Container(
    //             height: 34.h,
    //             width: 108.w,
    //             decoration: BoxDecoration(
    //                 color: activeTabIndex == 1
    //                     ? const Color(0xff28B4E9)
    //                     : const Color(0xff28B4E9).withAlpha(40),
    //                 borderRadius: BorderRadius.all(Radius.circular(8.r))),
    //             child: const Align(
    //               alignment: Alignment.center,
    //               child: Text("Xin đi muộn"),
    //             ),
    //           ),
    //         ),
    //         // Tab(
    //         //   child: Container(
    //         //     height: 34.h,
    //         //     width: 108.w,
    //         //     decoration: BoxDecoration(
    //         //         color: activeTabIndex == 2
    //         //             ? const Color(0xff273D8C)
    //         //             : const Color(0xff273D8C).withAlpha(40),
    //         //         borderRadius: BorderRadius.all(Radius.circular(8.r))),
    //         //     child: const Align(
    //         //       alignment: Alignment.center,
    //         //       child: Text("Feedback"),
    //         //     ),
    //         //   ),
    //         // ),
    //       ],
    //     ),
    //     Expanded(
    //       child: TabBarView(
    //         controller: _tabController,
    //         children: <Widget>[
    //           ListView.builder(
    //             shrinkWrap: true,
    //             physics: const ScrollPhysics(),
    //             itemCount: widget.model.length,
    //             itemBuilder: (context, index) {
    //               return Container(
    //                 //height: 110.h,
    //                 constraints:
    //                     BoxConstraints(minHeight: 120.h, maxHeight: 200.h),
    //                 width: 343.w,
    //                 margin: EdgeInsets.symmetric(
    //                   horizontal: 16.w,
    //                   vertical: 16.h,
    //                 ),
    //                 padding: EdgeInsets.symmetric(
    //                   vertical: 16.h,
    //                   horizontal: 16.w,
    //                 ),
    //                 decoration: BoxDecoration(
    //                   borderRadius: BorderRadius.circular(16.r),
    //                   boxShadow: [
    //                     BoxShadow(
    //                       color: Colors.grey.withAlpha(90),
    //                       spreadRadius: 0,
    //                       blurRadius: 10,
    //                       offset: const Offset(0, 6),
    //                     ),
    //                   ],
    //                   color: Colors.white,
    //                 ),
    //                 child: Column(
    //                   crossAxisAlignment: CrossAxisAlignment.start,
    //                   children: [
    //                     Text(
    //                       'Buổi học : ${widget.model[index].buoiHoc}',
    //                       style: defaultText14M,
    //                       overflow: TextOverflow.ellipsis,
    //                     ),
    //                     SizedBox(
    //                       height: 5.h,
    //                     ),
    //                     Text(
    //                       'Lớp học : ${widget.model[index].lopHoc}',
    //                       style: defaultText14M,
    //                       overflow: TextOverflow.ellipsis,
    //                     ),
    //                     SizedBox(
    //                       height: 5.h,
    //                     ),
    //                     Text(
    //                       'Thời gian nộp đơn : ${widget.model[index].createdAt}',
    //                       style: defaultText14M,
    //                       overflow: TextOverflow.ellipsis,
    //                     ),
    //                     SizedBox(
    //                       height: 5.h,
    //                     ),
    //                     Expanded(
    //                       child: Text(
    //                         'Lý do : ${widget.model[index].reason}',
    //                         style: defaultText14M,
    //                         overflow: TextOverflow.ellipsis,
    //                         maxLines: 20,
    //                       ),
    //                     ),
    //                   ],
    //                 ),
    //               );
    //             },
    //           ),

    //           ListView.builder(
    //             shrinkWrap: true,
    //             physics: const ScrollPhysics(),
    //             itemCount: 1,
    //             itemBuilder: (context, index) {
    //               return Container(
    //                 height: 110.h,
    //                 width: 343.w,
    //                 margin: EdgeInsets.symmetric(
    //                   horizontal: 16.w,
    //                   vertical: 16.h,
    //                 ),
    //                 padding: EdgeInsets.symmetric(
    //                   vertical: 16.h,
    //                   horizontal: 16.w,
    //                 ),
    //                 decoration: BoxDecoration(
    //                   borderRadius: BorderRadius.circular(16.r),
    //                   boxShadow: [
    //                     BoxShadow(
    //                       color: Colors.grey.withAlpha(90),
    //                       spreadRadius: 0,
    //                       blurRadius: 10,
    //                       offset: const Offset(0, 6),
    //                     ),
    //                   ],
    //                   color: Colors.white,
    //                 ),
    //                 child: Column(
    //                   crossAxisAlignment: CrossAxisAlignment.start,
    //                   children: [
    //                     Text(
    //                       'Ngày xin đi muộn : 12/3/2024',
    //                       style: defaultText14B,
    //                     ),
    //                     SizedBox(
    //                       height: 10.h,
    //                     ),
    //                     Expanded(
    //                       child: Text(
    //                         'Lý do : Cháu bị hỏng xe, mất điện',
    //                         style: defaultText14M,
    //                         overflow: TextOverflow.ellipsis,
    //                         maxLines: 20,
    //                       ),
    //                     ),
    //                   ],
    //                 ),
    //               );
    //             },
    //           ),
    //           // ListView.builder(
    //           //   shrinkWrap: true,
    //           //   physics: const ScrollPhysics(),
    //           //   itemCount: 1,
    //           //   itemBuilder: (context, index) {
    //           //     return Container(
    //           //       height: 110.h,
    //           //       width: 343.w,
    //           //       margin: EdgeInsets.symmetric(
    //           //         horizontal: 16.w,
    //           //         vertical: 16.h,
    //           //       ),
    //           //       padding: EdgeInsets.symmetric(
    //           //         vertical: 16.h,
    //           //         horizontal: 16.w,
    //           //       ),
    //           //       decoration: BoxDecoration(
    //           //         borderRadius: BorderRadius.circular(16.r),
    //           //         boxShadow: [
    //           //           BoxShadow(
    //           //             color: Colors.grey.withAlpha(90),
    //           //             spreadRadius: 0,
    //           //             blurRadius: 10,
    //           //             offset: const Offset(0, 6),
    //           //           ),
    //           //         ],
    //           //         color: Colors.white,
    //           //       ),
    //           //       child: Column(
    //           //         crossAxisAlignment: CrossAxisAlignment.start,
    //           //         children: [
    //           //           Text(
    //           //             'Feedback về : Giáo viên',
    //           //             style: defaultText14B,
    //           //           ),
    //           //           SizedBox(
    //           //             height: 10.h,
    //           //           ),
    //           //           Expanded(
    //           //             child: Text(
    //           //               'Phản hồi của bạn : Giảng viên X giảng bài hơi chậm, nhàm chán',
    //           //               style: defaultText14M,
    //           //               overflow: TextOverflow.ellipsis,
    //           //               maxLines: 20,
    //           //             ),
    //           //           ),
    //           //         ],
    //           //       ),
    //           //     );
    //           //   },
    //           // ),
    //         ],
    //       ),
    //     ),
    //   ],
    // );
  }
}
