import 'package:casalink/models/schedule_model.dart';
import 'package:casalink/repo/schedule_repo.dart';
import 'package:casalink/utils/constants/styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../models/checkin_model.dart';
import 'detail_screen.dart';

class ListLessonScreen extends StatefulWidget {
  const ListLessonScreen(
      {super.key, required this.title, required this.listDetails});
  final String title;
  final List<DetailCheckinModel> listDetails;
  @override
  State<ListLessonScreen> createState() => _ListLessonScreenState();
}

class _ListLessonScreenState extends State<ListLessonScreen> {
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
      backgroundColor: const Color(0xffFAFAFA),
      appBar: AppBar(
        backgroundColor: Colors.white,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios_new, color: Color(0xff3C3C3C)),
          onPressed: () {
            Navigator.of(context).pop(false);
          },
        ),
        title: Text(
          widget.title,
          style: defaultText18B.copyWith(
            color: const Color(0xff3C3C3C),
          ),
        ),
      ),
      body: widget.listDetails.isEmpty
          ? Center(
              child: Column(
                children: [
                  SizedBox(
                    height: 20.h,
                  ),
                  Image.asset(
                    'assets/images/empty.png',
                    height: 200.h,
                    width: 200.w,
                  ),
                  Text(
                    'Không có buổi học nào',
                    style: defaultText16B,
                  ),
                ],
              ),
            )
          : ListView.builder(
              padding: EdgeInsets.symmetric(horizontal: 16.w),
              itemCount: widget.listDetails.length,
              itemBuilder: (BuildContext context, int index) {
                return GestureDetector(
                  onTap: () async {
                    DetaiLessonModel listExcercise =
                        await ScheduleRepo().getDetailSchedule(
                      checkinOffId: widget.listDetails[index].checkinOffId,
                      typeLearn: widget.listDetails[index].typeLearn,
                      meetingId: widget.listDetails[index].meetingId,
                    );
                    if (context.mounted) {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: ((context) => DetailScreen(
                                detailLesson: listExcercise,
                              )),
                        ),
                      );
                    }
                  },
                  child: Container(
                      width: 343.w,
                      margin: EdgeInsets.only(top: 20.h),
                      padding: EdgeInsets.symmetric(
                          vertical: 16.h, horizontal: 16.w),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(16.r),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey.withAlpha(50),
                            spreadRadius: 1,
                            blurRadius: 5,
                            offset: const Offset(
                                0, 3), // changes position of shadow
                          ),
                        ],
                        color: Colors.white,
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            '${widget.listDetails[index].createdDate} - ${widget.listDetails[index].cosoName}',
                            style: defaultText14M.copyWith(
                                color: const Color(0xff273D8C)),
                          ),
                          SizedBox(
                            height: 12.h,
                          ),
                          Text(
                            'Tên buổi học : ${widget.listDetails[index].name}',
                            style: defaultText16B.copyWith(
                                color: const Color(0xff273D8C)),
                          ),
                          SizedBox(
                            height: 12.h,
                          ),
                          Text(
                            'Nội dung buổi học : ${widget.listDetails[index].topic}',
                            style: defaultText14M.copyWith(
                                color: const Color(0xff273D8C)),
                          ),
                        ],
                      )),
                );
              }),
    );
  }
}
