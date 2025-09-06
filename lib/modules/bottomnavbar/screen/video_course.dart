import 'package:casalink/repo/video_repo.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:url_launcher/url_launcher.dart';
import '../../../models/info_class_model.dart';
import '../../../utils/constants/styles.dart';

class VideoCourse extends StatelessWidget {
  const VideoCourse({super.key, required this.courseVideoModel});
  final CourseVideoModel courseVideoModel;
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
        title: Center(
          child: Text(
            'Khoá học video        ',
            style: defaultText18B.copyWith(
              color: Colors.white,
            ),
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              margin: EdgeInsets.only(top: 16.h, left: 16.w, right: 16.w),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(16.r)),
                color: Colors.white,
              ),
              child: Image.network(
                courseVideoModel.detailClassModel.courseImg,
                width: 343.w,
                //height: 160.h,
                fit: BoxFit.fitWidth,
              ),
            ),
            Container(
              height: 32.h,
              //width: 142.w,
              margin: EdgeInsets.only(top: 16.h, left: 16.w),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8.r),
                color: const Color(0xff28B4E9),
              ),
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  courseVideoModel.detailClassModel.settingCourseTypeName,
                  style: defaultText16M.copyWith(
                    color: Colors.white,
                  ),
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(top: 10.h, left: 16.w),
              child: Text(
                courseVideoModel.detailClassModel.name,
                style: defaultText20B.copyWith(
                  color: const Color(0xff273D8C),
                ),
              ),
            ),
            Row(
              children: [
                Stack(
                  children: [
                    Container(
                      margin: EdgeInsets.symmetric(
                          vertical: 10.h, horizontal: 16.w),
                      height: 8.h,
                      width: 296.w,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(24.r),
                        color: const Color(0xffEDEDED),
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.symmetric(
                          vertical: 10.h, horizontal: 16.w),
                      height: 8.h,
                      width: (296 *
                              courseVideoModel
                                  .detailClassModel.percentLearning /
                              100)
                          .w,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(24.r),
                        color: const Color(0xff28B4E9),
                      ),
                    ),
                  ],
                ),
                Text(
                  '${courseVideoModel.detailClassModel.percentLearning}%',
                  style: defaultText16B.copyWith(
                    color: const Color(0xff28B4E9),
                  ),
                ),
              ],
            ),
            Divider(
              color: const Color(0xffEDEDED),
              thickness: 8.h,
            ),
            Padding(
              padding: EdgeInsets.only(top: 10.h, left: 16.w),
              child: Text(
                'Nội dung',
                style: defaultText16B,
              ),
            ),
            ListView.builder(
                shrinkWrap: true,
                physics: const ClampingScrollPhysics(),
                itemCount: courseVideoModel.listTopical.length,
                itemBuilder: (BuildContext context, int index) {
                  return LessonItem(
                    index: index,
                    topicModel: courseVideoModel.listTopical[index],
                  );
                }),
            SizedBox(
              height: 80.h,
            ),
          ],
        ),
      ),
    );
  }
}

class LessonItem extends StatefulWidget {
  const LessonItem({super.key, required this.index, required this.topicModel});
  final int index;
  final TopicalModel topicModel;
  @override
  State<LessonItem> createState() => _LessonItemState();
}

class _LessonItemState extends State<LessonItem> {
  bool isExpanded = false;
  List<LessonVideoModel> listLessonVideoModels = [];
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        SizedBox(
          height: 12.h,
        ),
        InkWell(
          onTap: () async {
            listLessonVideoModels = await VideoRepository().getlistLessonVideo(
              topicalId: widget.topicModel.topicalId,
              settingCoureTypeId: widget.topicModel.settingCourseTypeId,
            );
            setState(() {
              isExpanded = !isExpanded;
            });
          },
          child: Row(
            children: [
              SizedBox(
                width: 16.w,
              ),
              Container(
                height: 34.h,
                width: 34.w,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  border: Border.all(
                    color: const Color(0xff2F9CD3),
                  ),
                  color: Colors.white,
                ),
                child: Center(
                  child: Text(
                    '${widget.index + 1}',
                    style: defaultText14M.copyWith(
                      color: const Color(0xff2F9CD3),
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
              ),
              SizedBox(
                width: 16.w,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    width: 260.w,
                    child: Text(
                      widget.topicModel.nameTopical,
                      style: defaultText16M.copyWith(
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                  Text(
                    '${widget.topicModel.numLLessson} bài',
                    style: defaultText12M.copyWith(
                      fontWeight: FontWeight.w500,
                      color: const Color(0xff3C3C3C).withValues(alpha: 0.6),
                    ),
                  ),
                ],
              ),
              const Spacer(),
              const Icon(Icons.keyboard_arrow_right_outlined),
              SizedBox(
                width: 16.w,
              ),
            ],
          ),
        ),
        const Divider(),
        if (isExpanded)
          Column(
            children: listLessonVideoModels
                .map((e) => GestureDetector(
                      // onTap: () async {
                      //   String link = await VideoRepository().getLinkVideo(
                      //       lessonId: e.lessonsId,
                      //       settingCoureTypeId: e.settingCourseTypeId,
                      //       lessonType: e.lessonType);
                      //   pushWithoutNavBar(
                      //     context,
                      //     MaterialPageRoute(
                      //       builder: ((context) => WebViewScreen(
                      //                 link: link,
                      //                 title: e.name,
                      //               )
                      //           // AnimationPlayer(
                      //           //       link: link,
                      //           //     )
                      //           ),
                      //     ),
                      //   );
                      // },
                      onTap: () async {
                        String link = await VideoRepository().getLinkVideo(
                            lessonId: e.lessonsId,
                            settingCoureTypeId: e.settingCourseTypeId,
                            lessonType: e.lessonType);
                        if (!await launchUrl(Uri.parse(link))) {
                          throw Exception('Could not launch ');
                        }
                      },
                      child: DetailItem(
                        title: e.name,
                        index: listLessonVideoModels.indexOf(e),
                      ),
                    ))
                .toList(),
          ),
      ],
    );
  }
}

class DetailItem extends StatelessWidget {
  const DetailItem({super.key, required this.title, required this.index});
  final String title;
  final int index;
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        SizedBox(
          width: 16.w,
        ),
        Column(
          children: [
            SvgPicture.asset(
              'assets/icons/green_tick.svg',
              height: 12.h,
              width: 12.w,
            ),
            Container(
              height: 32.h,
              width: 1.w,
              margin: EdgeInsets.symmetric(vertical: 8.h),
              decoration: const BoxDecoration(
                color: Colors.green,
              ),
            ),
          ],
        ),
        SizedBox(
          width: 16.w,
        ),
        Image.asset(
          'assets/images/video.png',
          height: 24.h,
          width: 24.w,
          fit: BoxFit.fill,
        ),
        SizedBox(
          width: 16.w,
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              width: 267.w,
              child: Text(
                title,
                style: defaultText14M,
              ),
            ),
            SizedBox(
              width: 267.w,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Bài giảng',
                    style: defaultText12M.copyWith(
                      fontWeight: FontWeight.w500,
                      color: const Color(0xff3C3C3C).withValues(alpha: 0.6),
                    ),
                  ),
                  Text(
                    '10 Phút',
                    style: defaultText12M.copyWith(
                      fontWeight: FontWeight.w500,
                      color: const Color(0xff3C3C3C).withValues(alpha: 0.6),
                    ),
                  ),
                ],
              ),
            ),
            Container(
              height: 1.h,
              width: 267.w,
              margin: EdgeInsets.symmetric(vertical: 4.h),
              decoration: const BoxDecoration(
                color: Color(0xffEDEDED),
              ),
            )
          ],
        ),
      ],
    );
  }
}
