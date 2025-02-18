import 'package:casalink/utils/constants/styles.dart';
import 'package:casalink/utils/widget/webview_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:persistent_bottom_nav_bar_v2/persistent_bottom_nav_bar_v2.dart';

import '../../../models/schedule_model.dart';
import '../../../utils/widget/fullscreen_image.dart';

class ExcerciseScreen extends StatefulWidget {
  const ExcerciseScreen({super.key, required this.listExcercise});
  final List<DataHomeWorkModel> listExcercise;
  @override
  State<ExcerciseScreen> createState() => _ExcerciseScreenState();
}

class _ExcerciseScreenState extends State<ExcerciseScreen> {
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
        backgroundColor: Colors.white,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios_new, color: Color(0xff3C3C3C)),
          onPressed: () {
            Navigator.of(context).pop(false);
          },
        ),
        title: Text(
          '        Bài tập về nhà',
          style: defaultText18B.copyWith(
            color: const Color(0xff3C3C3C),
          ),
        ),
      ),
      body: widget.listExcercise.isEmpty
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
                    'Học sinh chưa có lớp học',
                    style: defaultText16B,
                  ),
                ],
              ),
            )
          : ListView.builder(
              shrinkWrap: true,
              physics: const ScrollPhysics(),
              itemCount: widget.listExcercise.length,
              itemBuilder: (context, index) {
                return ListExcerciseItem(
                  excercise: widget.listExcercise[index],
                );
              },
            ),
    );
  }
}

class ListExcerciseItem extends StatelessWidget {
  const ListExcerciseItem({super.key, required this.excercise});
  final DataHomeWorkModel excercise;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
            height: 60.h,
            width: 375.w,
            padding: EdgeInsets.symmetric(horizontal: 16.w),
            decoration: const BoxDecoration(
              color: Color(0xff273D8C),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                RichText(
                  text: TextSpan(
                    text: 'Lớp ${excercise.name}',
                    style: defaultText20B.copyWith(color: Colors.white),
                    children: <TextSpan>[
                      TextSpan(
                        text: '',
                        style: defaultText16M.copyWith(color: Colors.white),
                      ),
                    ],
                  ),
                ),
              ],
            )),
        ListView.builder(
          shrinkWrap: true,
          physics: const ScrollPhysics(),
          itemCount: excercise.listHomeWorks.length,
          itemBuilder: (context, index) {
            return ExcerciseItem(
              excercise: excercise.listHomeWorks[index],
            );
          },
        ),
      ],
    );
  }
}

class ExcerciseItem extends StatelessWidget {
  const ExcerciseItem({super.key, required this.excercise});
  final ListBTModel excercise;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        pushWithoutNavBar(
          context,
          MaterialPageRoute(
            builder: ((context) => WebViewScreen(
                  link: excercise.linkExercise,
                  title: 'Chi tiết bài tập',
                )),
          ),
        );

        // Navigator.push(
        //   context,
        //   PageRouteBuilder(
        //     opaque: false,
        //     barrierColor: Colors.black,
        //     pageBuilder: (BuildContext context, _, __) {
        //       return FullScreenPage(
        //         dark: true,
        //         child: Image.network(
        //           excercise.listHomeWorks[0].linkExercise,
        //           width: 100.w,
        //           height: 90.h,
        //         ),
        //       );
        //     },
        //   ),
        // );
      },
      child: Container(
        margin: EdgeInsets.only(
          top: 16.h,
          left: 16.w,
          right: 16.w,
        ),
        height: 310.h,
        width: 343.w,
        padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 16.h),
        decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(16.r),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withValues(alpha: 0.2),
                spreadRadius: 0,
                blurRadius: 12,
                offset: const Offset(0, 2),
              ),
            ]),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            SizedBox(
              height: 168.h,
              width: 333.w,
              child: Row(
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Tên:',
                        style: defaultText14M,
                      ),
                      Text(
                        'Hạn nộp:',
                        style: defaultText14M,
                      ),
                      Text(
                        'Trạng thái:',
                        style: defaultText14M,
                      ),
                      Text(
                        'Điểm:',
                        style: defaultText14M,
                      ),
                      Text(
                        'Loại lớp học',
                        style: defaultText14M,
                      ),
                    ],
                  ),
                  const Spacer(),
                  SizedBox(
                    height: 168.h,
                    width: 215.w,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          excercise.nameExercise,
                          style: defaultText14B,
                          overflow: TextOverflow.fade,
                          maxLines: 1,
                          softWrap: false,
                        ),
                        Text(
                          excercise.timeDeadline,
                          style: defaultText14B,
                        ),
                        (excercise.status == '0')
                            ? Container(
                                padding: EdgeInsets.symmetric(
                                    horizontal: 8.w, vertical: 4.h),
                                decoration: BoxDecoration(
                                  color: const Color(0xffED1C24),
                                  borderRadius: BorderRadius.circular(8.r),
                                ),
                                child: Text(
                                  'Chưa hoàn thành',
                                  style: defaultText12B.copyWith(
                                      color: Colors.white),
                                ),
                              )
                            : Container(
                                padding: EdgeInsets.symmetric(
                                    horizontal: 8.w, vertical: 4.h),
                                decoration: BoxDecoration(
                                  color: const Color(0xff28B4E9),
                                  borderRadius: BorderRadius.circular(8.r),
                                ),
                                child: Text(
                                  'Đã hoàn thành',
                                  style: defaultText12B.copyWith(
                                      color: Colors.white),
                                ),
                              ),
                        Text(
                          excercise.score,
                          style: defaultText14B,
                        ),
                        Text(
                          excercise.typeLearn,
                          style: defaultText14B,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            Container(
              height: 100.h,
              width: 310.w,
              padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 8.h),
              decoration: BoxDecoration(
                color: const Color(0xffF6F6F6),
                borderRadius: BorderRadius.circular(12.r),
              ),
              child: Text(
                'Nhận xét: ${excercise.noteTeacher}',
                style: defaultText14M.copyWith(
                  color: const Color(0xff273D8C),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
