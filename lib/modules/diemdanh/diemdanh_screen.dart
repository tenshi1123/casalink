import 'package:casalink/models/checkin_model.dart';
import 'package:casalink/utils/constants/styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../repo/follow_class_repo.dart';
import 'list_lesson.dart';

class RollCallScreen extends StatefulWidget {
  const RollCallScreen({super.key, required this.model});
  final CheckinModel model;
  @override
  State<RollCallScreen> createState() => _RollCallScreenState();
}

class _RollCallScreenState extends State<RollCallScreen> {
  CheckinModel get model => widget.model;
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
          '        Điểm danh',
          style: defaultText18B.copyWith(
            color: const Color(0xff3C3C3C),
          ),
        ),
      ),
      body: model.checkInOffModel.isEmpty
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
          : SingleChildScrollView(
              child: Column(
                children: [
                  Container(
                      height: 80.h,
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
                              text:
                                  '${model.checkInOffModel[0].className} ${model.checkInOffModel[0].classNote}',
                              style:
                                  defaultText20B.copyWith(color: Colors.white),
                              children: <TextSpan>[
                                TextSpan(
                                  text:
                                      '\n${model.checkInOffModel[0].cosoName}',
                                  style: defaultText16M.copyWith(
                                      color: Colors.white),
                                ),
                              ],
                            ),
                          ),
                        ],
                      )),
                  //qua luoi de lam gridview nen thoi dung row nhe
                  //thời lượng + đã học
                  SizedBox(
                    height: 16.h,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      GestureDetector(
                        onTap: () {
                          FollowClassRepo()
                              .getDetailCheckin(
                                  type: model.checkInOffModel[0].type,
                                  status: '-2',
                                  id: model.checkInOffModel[0].id)
                              .then((value) {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: ((context) => ListLessonScreen(
                                      title: 'Toàn bộ buổi học',
                                      listDetails: value,
                                    )),
                              ),
                            );
                          });
                        },
                        child: _item(
                            numLesson: model.checkInOffModel[0].thoiluong,
                            image: 'assets/images/time.png',
                            title: 'Thời lượng'),
                      ),
                      GestureDetector(
                          onTap: () {
                            FollowClassRepo()
                                .getDetailCheckin(
                                    type: model.checkInOffModel[0].type,
                                    status: '3',
                                    id: model.checkInOffModel[0].id)
                                .then((value) {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: ((context) => ListLessonScreen(
                                        title: 'Buổi học đúng giờ',
                                        listDetails: value,
                                      )),
                                ),
                              );
                            });
                          },
                          child: _item(
                            numLesson: model.checkInOffModel[0].dungGio,
                            image: 'assets/images/done.png',
                            title: 'Đúng giờ',
                          ))
                    ],
                  ),
                  SizedBox(
                    height: 16.h,
                  ),
                  //Chưa học + Học bù
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      GestureDetector(
                          onTap: () {
                            FollowClassRepo()
                                .getDetailCheckin(
                                    type: model.checkInOffModel[0].type,
                                    status: '-1',
                                    id: model.checkInOffModel[0].id)
                                .then((value) {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: ((context) => ListLessonScreen(
                                        title: 'Buổi học chưa học',
                                        listDetails: value,
                                      )),
                                ),
                              );
                            });
                          },
                          child: _item(
                            numLesson: model.checkInOffModel[0].chuaHoc,
                            image: 'assets/images/not_learn.png',
                            title: 'chưa học',
                          )),
                      GestureDetector(
                        onTap: () {
                          FollowClassRepo()
                              .getDetailCheckin(
                                  type: model.checkInOffModel[0].type,
                                  status: '2',
                                  id: model.checkInOffModel[0].id)
                              .then((value) {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: ((context) => ListLessonScreen(
                                      title: 'Buổi học đi muộn',
                                      listDetails: value,
                                    )),
                              ),
                            );
                          });
                        },
                        child: _item(
                            numLesson: model.checkInOffModel[0].diMuon,
                            image: 'assets/images/hoc_bu.png',
                            title: 'Đi muộn'),
                      )
                    ],
                  ),
                  SizedBox(
                    height: 16.h,
                  ),
                  //Vắng mặt + Nghỉ có phép
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      GestureDetector(
                        onTap: () {
                          FollowClassRepo()
                              .getDetailCheckin(
                                  type: model.checkInOffModel[0].type,
                                  status: '0',
                                  id: model.checkInOffModel[0].id)
                              .then((value) {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: ((context) => ListLessonScreen(
                                      title: 'Buổi học vắng mặt',
                                      listDetails: value,
                                    )),
                              ),
                            );
                          });
                        },
                        child: _item(
                            numLesson: model.checkInOffModel[0].vangMat,
                            image: 'assets/images/miss.png',
                            title: 'Vắng mặt'),
                      ),
                      GestureDetector(
                        onTap: () {
                          FollowClassRepo()
                              .getDetailCheckin(
                                  type: model.checkInOffModel[0].type,
                                  status: '1',
                                  id: model.checkInOffModel[0].id)
                              .then((value) {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: ((context) => ListLessonScreen(
                                      title: 'Buổi học nghỉ có phép',
                                      listDetails: value,
                                    )),
                              ),
                            );
                          });
                        },
                        child: _item(
                            numLesson: model.checkInOffModel[0].xinNghi,
                            image: 'assets/images/co_phep.png',
                            title: 'Nghỉ có phép'),
                      )
                    ],
                  ),
                ],
              ),
            ),
    );
  }
}

Widget _item({
  required String numLesson,
  required String image,
  required String title,
}) {
  return Container(
    height: 60.h,
    width: 164.w,
    padding: EdgeInsets.symmetric(
      vertical: 10.h,
    ),
    decoration: BoxDecoration(
      borderRadius: BorderRadius.all(
        Radius.circular(16.r),
      ),
      color: const Color(0xffF2F2F2),
    ),
    child: Row(
      children: [
        SizedBox(
          width: 16.w,
        ),
        Image(
          image: AssetImage(image),
          height: 24.h,
          width: 24.w,
        ),
        SizedBox(
          width: 10.w,
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Text(
              '$numLesson buổi',
              style: defaultText16B,
            ),
            Text(
              title,
              style: defaultText14Re.copyWith(
                color: const Color(0xff8A8A8A),
              ),
            ),
          ],
        )
      ],
    ),
  );
}
