import 'package:casalink/modules/bottomnavbar/screen/class_screen.dart';
import 'package:casalink/repo/follow_class_repo.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:persistent_bottom_nav_bar_v2/persistent_bottom_nav_bar_v2.dart';
import '../../../models/info_class_model.dart';
import '../../../utils/constants/styles.dart';

class ListClassScreen extends StatelessWidget {
  const ListClassScreen({super.key});

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
            'Danh sách lớp học',
            style: defaultText18B.copyWith(
              color: Colors.white,
            ),
          ),
        ),
      ),
      body: FutureBuilder(
        future: FollowClassRepo().getListClass(), // Hàm gọi API
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const CircularProgressIndicator();
          } else if (snapshot.hasError) {
            return Text(
              'Vui lòng kiểm tra lại kết nối internet',
              style: defaultText14M,
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
                    children: List.generate(listLichHoc.length, (index) {
                      return _ClassItem(
                        index: index,
                        model: listLichHoc[index],
                      );
                    })

                    //  ListView.builder(
                    //     shrinkWrap: true,

                    //     physics: const ClampingScrollPhysics(),
                    //     itemCount: listLichHoc.length,
                    //     itemBuilder: (BuildContext context, int index) {
                    //       return _ClassItem(
                    //         index: index,
                    //         model: listLichHoc[index],
                    //       );
                    //     }),
                    );
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

class _ClassItem extends StatefulWidget {
  const _ClassItem({required this.index, required this.model});
  final int index;
  final InfoClassModel model;
  @override
  State<_ClassItem> createState() => __ClassItemState();
}

class __ClassItemState extends State<_ClassItem> {
  @override
  Widget build(BuildContext context) {
    return InkWell(
        onTap: () async {
          if (widget.model.scheduleId == '') {
            showDialog(
              context: context,
              builder: (BuildContext context) {
                return CupertinoAlertDialog(
                  title: const Text(
                      'Đã có lỗi xảy ra, lớp học đã bị xóa lỗi mạngmạng'),
                  actions: <Widget>[
                    CupertinoDialogAction(
                      isDefaultAction: true,
                      child: Text(
                        'ok',
                        style: defaultText20B,
                      ),
                      onPressed: () {
                        Navigator.pop(context);
                      },
                    )
                  ],
                );
              },
            );
          } else {
            ClassDetailModel detailClassModel =
                await FollowClassRepo().getListLesson(
              typeId: widget.model.typeId,
              scheduleId: widget.model.scheduleId,
            );
            pushWithoutNavBar(
              context,
              MaterialPageRoute(
                builder: ((context) => ClassScreen(
                      detailClassModel: detailClassModel,
                    )),
              ),
            );
          }
        },
        child: Container(
          margin: EdgeInsets.only(top: 16.h, left: 16.w),
          width: 164.w,
          height: 310.h,
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
                //height: 32.h,
                width: 164.w,
                //margin: EdgeInsets.only(top: 16.h, left: 16.w),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8.r),
                  color: const Color(0xff28B4E9),
                ),
                constraints: BoxConstraints(minHeight: 32.h),
                child: Center(
                  child: Text(
                    widget.model.typeName,
                    style: defaultText12M.copyWith(
                      color: Colors.white,
                    ),
                    maxLines: 2,
                  ),
                ),
              ),
              const Spacer(),
              Text(
                widget.model.courseName,
                style: defaultText12B.copyWith(
                  color: const Color(0xff273D8C),
                ),
              ),
            ],
          ),
        )
        // Row(
        //   children: [
        //     SizedBox(
        //       width: 16.w,
        //     ),
        //     Container(
        //       height: 34.h,
        //       width: 34.w,
        //       decoration: BoxDecoration(
        //         shape: BoxShape.circle,
        //         border: Border.all(
        //           color: const Color(0xff2F9CD3),
        //         ),
        //         color: Colors.white,
        //       ),
        //       child: Center(
        //         child: Text(
        //           '${widget.index + 1}',
        //           style: defaultText14M.copyWith(
        //             color: const Color(0xff2F9CD3),
        //             fontWeight: FontWeight.w600,
        //           ),
        //         ),
        //       ),
        //     ),
        //     SizedBox(
        //       width: 16.w,
        //     ),
        //     Column(
        //       crossAxisAlignment: CrossAxisAlignment.start,
        //       children: [
        //         Text(
        //           widget.model.courseName,
        //           style: defaultText16M.copyWith(
        //             fontWeight: FontWeight.w600,
        //           ),
        //         ),
        //         Text(
        //           widget.model.typeName,
        //           style: defaultText12M.copyWith(
        //             fontWeight: FontWeight.w500,
        //             color: const Color(0xff3C3C3C).withValues(alpha: 0.6),
        //           ),
        //         ),
        //       ],
        //     ),
        //   ],
        // ),
        );
  }
}
