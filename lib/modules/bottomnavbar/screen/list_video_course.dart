import 'package:casalink/repo/video_repo.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:persistent_bottom_nav_bar_v2/persistent_bottom_nav_bar_v2.dart';
import '../../../models/info_class_model.dart';
import '../../../utils/constants/styles.dart';
import 'video_course.dart';

class ListVideoCourse extends StatelessWidget {
  const ListVideoCourse({super.key});

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
            'Danh sách Khóa video',
            style: defaultText18B.copyWith(
              color: Colors.white,
            ),
          ),
        ),
      ),
      body: FutureBuilder(
        future: VideoRepository().getListClass(), // Hàm gọi API
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const CircularProgressIndicator();
          } else if (snapshot.hasError) {
            return Center(
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
                    'Vui lòng kiểm tra lại kết nối internet',
                    style: defaultText16B,
                  ),
                ],
              ),
            );
          } else if (snapshot.hasData) {
            final listLichHoc = snapshot.data as List<InfoClassModel>;
            return listLichHoc.isEmpty
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
                : GridView.count(
                    crossAxisCount: 2,
                    childAspectRatio: (188 / 230),
                    children: List.generate(listLichHoc.length, (index) {
                      return _VideoCourseItem(
                        index: index,
                        model: listLichHoc[index],
                      );
                    }));
          } else {
            return Text(
              'Vui lòng kiểm tra lại kết nối internet',
              style: defaultText14M,
            );
          }
        },
      ),
    );
  }
}

class _VideoCourseItem extends StatefulWidget {
  const _VideoCourseItem({required this.index, required this.model});
  final int index;
  final InfoClassModel model;
  @override
  State<_VideoCourseItem> createState() => __VideoCourseItemState();
}

class __VideoCourseItemState extends State<_VideoCourseItem> {
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () async {
        CourseVideoModel detailClassModel =
            await VideoRepository().getListTopical(
          typeId: widget.model.typeId,
          scheduleId: widget.model.scheduleId,
          courseId: widget.model.courseId,
        );
        pushWithoutNavBar(
          context,
          MaterialPageRoute(
            builder: ((context) => VideoCourse(
                  courseVideoModel: detailClassModel,
                )),
          ),
        );
      },
      child: Container(
        margin: EdgeInsets.only(top: 16.h, left: 16.w),
        width: 164.w,
        //height: 250.h,
        child: Column(
          children: [
            Container(
              //margin: EdgeInsets.only(top: 16.h, left: 16.w, right: 16.w),
              width: 164.w,
              height: 104.h,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(16.r)),
                color: Colors.white,
              ),
              child: Image.network(
                widget.model.courseImg,
                width: 164.w,
                height: 104.h,
                fit: BoxFit.fitWidth,
              ),
            ),
            SizedBox(
              height: 12.h,
            ),
            Container(
              height: 32.h,
              width: 164.w,
              //margin: EdgeInsets.only(top: 16.h, left: 16.w),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8.r),
                color: const Color(0xff28B4E9),
              ),
              child: Center(
                child: Text(
                  widget.model.typeName,
                  style: defaultText12M.copyWith(
                    color: Colors.white,
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 12.h,
            ),
            Expanded(
              child: Text(
                widget.model.courseName,
                style: defaultText12B.copyWith(
                  color: const Color(0xff273D8C),
                ),
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
