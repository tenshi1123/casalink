import 'package:casalink/utils/constants/styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ClassScreen extends StatelessWidget {
  const ClassScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: const Color(0xff273D8C),
        // leading: IconButton(
        //   icon: const Icon(Icons.arrow_back_ios_new, color: Colors.white),
        //   onPressed: () {},
        // ),
        title: Center(
          child: Text(
            'Lớp học',
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
              width: 226.w,
              margin: EdgeInsets.only(top: 16.h, left: 16.w),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8.r),
                color: const Color(0xff28B4E9),
              ),
              child: Center(
                child: Text(
                  'Học trực tiếp tại trung tâm',
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
            ListView.builder(
                physics: const NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                padding: EdgeInsets.symmetric(horizontal: 16.w),
                itemCount: 5,
                itemBuilder: (BuildContext context, int index) {
                  return Container(
                      height: 158.h,
                      width: 343.w,
                      margin: EdgeInsets.only(top: 20.h),
                      padding: EdgeInsets.symmetric(
                          vertical: 16.h, horizontal: 16.w),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(16.r),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey.withOpacity(0.5),
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
                            'P.101 - Mỹ Đình (26/06/2024)',
                            style: defaultText14M.copyWith(
                                color: const Color(0xff273D8C)),
                          ),
                          Text(
                            'Buổi ${1 + index} - Week 1 Reading practice ',
                            style: defaultText16B.copyWith(
                                color: const Color(0xff273D8C)),
                          ),
                          Text(
                            'Nội dung buổi học: Consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.',
                            style: defaultText14M.copyWith(
                                color: const Color(0xff273D8C)),
                          ),
                        ],
                      ));
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
