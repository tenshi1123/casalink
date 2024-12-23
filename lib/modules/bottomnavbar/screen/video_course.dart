import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../utils/constants/styles.dart';

class VideoCourse extends StatelessWidget {
  const VideoCourse({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: const Color(0xff273D8C),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios_new, color: Colors.white),
          onPressed: () {},
        ),
        title: Center(
          child: Text(
            'Lớp học              ',
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
              width: 343.w,
              height: 218.h,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(16.r)),
                color: Colors.white,
                image: const DecorationImage(
                  image: AssetImage('assets/images/class_banner.png'),
                  fit: BoxFit.fill,
                ),
              ),
            ),
            Container(
              height: 32.h,
              width: 142.w,
              margin: EdgeInsets.only(top: 16.h, left: 16.w),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8.r),
                color: const Color(0xff28B4E9),
              ),
              child: Center(
                child: Text(
                  'Khoá học video',
                  style: defaultText16M.copyWith(
                    color: Colors.white,
                  ),
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(top: 10.h, left: 16.w),
              child: Text(
                'Grammar & Writing',
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
                      width: (296 * 26 / 100).w,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(24.r),
                        color: const Color(0xff28B4E9),
                      ),
                    ),
                  ],
                ),
                Text(
                  '26%',
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
              padding: EdgeInsets.only(top: 10.h, left: 16.w, bottom: 10.h),
              child: Text(
                'Nội dung',
                style: defaultText16B,
              ),
            ),
            ListView.builder(
                shrinkWrap: true,
                physics: const ClampingScrollPhysics(),
                itemCount: 4,
                itemBuilder: (BuildContext context, int index) {
                  return LessonItem(
                    title: index,
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

class LessonItem extends StatelessWidget {
  const LessonItem({super.key, required this.title});
  final int title;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {},
      child: SizedBox(
        width: 375.w,
        height: 60.h,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
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
                      '${title + 1}',
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
                    Text(
                      'There are many variations',
                      style: defaultText16M.copyWith(
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    Text(
                      '5 bài giảng / 6 bài tập',
                      style: defaultText12M.copyWith(
                        fontWeight: FontWeight.w500,
                        color: const Color(0xff3C3C3C).withValues(alpha: 0.6),
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  width: 60.w,
                ),
                const Icon(Icons.keyboard_arrow_right_outlined),
              ],
            ),
            const Divider(),
          ],
        ),
      ),
    );
  }
}
