import 'package:casalink/models/info_class_model.dart';
import 'package:casalink/utils/constants/styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl/intl.dart';

class DetailClass extends StatefulWidget {
  const DetailClass({super.key, required this.infoModel});
  final List<RefeeModel> infoModel;
  @override
  State<DetailClass> createState() => _DetailClassState();
}

class _DetailClassState extends State<DetailClass> {
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
            'Danh sách tái phí       ',
            style: defaultText18B.copyWith(
              color: Colors.white,
            ),
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(
              height: 16.h,
            ),
            ListView.builder(
                physics: const NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                padding: EdgeInsets.symmetric(horizontal: 16.w),
                itemCount: widget.infoModel.length,
                itemBuilder: (BuildContext context, int index) {
                  return Container(
                      width: 343.w,
                      margin: EdgeInsets.only(top: 16.h),
                      padding: EdgeInsets.symmetric(
                          vertical: 16.h, horizontal: 16.w),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(16.r),
                        boxShadow: [
                          BoxShadow(
                            color: const Color(0xff273D8C).withAlpha(80),
                            spreadRadius: 0,
                            blurRadius: 8,
                            offset: const Offset(
                                0, 4), // changes position of shadow
                          ),
                        ],
                        color: Colors.white,
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          //chuong trinh hoc
                          Row(
                            children: [
                              SizedBox(
                                width: 120.w,
                                child: Text(
                                  'Chương trình học',
                                  style: defaultText14M.copyWith(
                                      color: const Color(0xff273D8C)),
                                ),
                              ),
                              Text(
                                ': ',
                                style: defaultText14M.copyWith(
                                    color: const Color(0xff273D8C)),
                              ),
                              SizedBox(
                                width: 180.w,
                                child: Text(
                                  widget.infoModel[index].nameCourse,
                                  style: defaultText14M.copyWith(
                                      color: const Color(0xff273D8C)),
                                  //textAlign: TextAlign.right,
                                ),
                              ),
                            ],
                          ),
                          SizedBox(
                            height: 10.h,
                          ),
                          //lop hoc
                          Row(
                            children: [
                              SizedBox(
                                width: 120.w,
                                child: Text(
                                  'Lớp học',
                                  style: defaultText14M.copyWith(
                                      color: const Color(0xff273D8C)),
                                ),
                              ),
                              Text(
                                ': ',
                                style: defaultText14M.copyWith(
                                    color: const Color(0xff273D8C)),
                              ),
                              SizedBox(
                                width: 180.w,
                                child: Text(
                                  '${widget.infoModel[index].courseScheduleName}( ${widget.infoModel[index].courseScheduleAlias})',
                                  style: defaultText14M.copyWith(
                                      color: const Color(0xff273D8C)),
                                ),
                              ),
                            ],
                          ),
                          Row(
                            children: [
                              SizedBox(
                                width: 120.w,
                                child: Text(
                                  'Gói phí',
                                  style: defaultText14M.copyWith(
                                      color: const Color(0xff273D8C)),
                                ),
                              ),
                              Text(
                                ': ',
                                style: defaultText14M.copyWith(
                                    color: const Color(0xff273D8C)),
                              ),
                              SizedBox(
                                width: 180.w,
                                child: Text(
                                  widget.infoModel[index].goiPhi,
                                  style: defaultText14M.copyWith(
                                      color: const Color(0xff273D8C)),
                                ),
                              ),
                            ],
                          ),
                          SizedBox(
                            height: 10.h,
                          ),
                          //hoc phi goc
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              SizedBox(
                                width: 120.w,
                                child: Text(
                                  'Học phí gốc',
                                  style: defaultText14M.copyWith(
                                      color: const Color(0xff273D8C)),
                                ),
                              ),
                              Text(
                                ': ',
                                style: defaultText14M.copyWith(
                                    color: const Color(0xff273D8C)),
                              ),
                              SizedBox(
                                width: 180.w,
                                child: Text(
                                  widget.infoModel[index].feeOriginal == 0
                                      ? ''
                                      : '${NumberFormat("#,###", "vi_VN").format((widget.infoModel[index].feeOriginal))} VND',
                                  style: defaultText14M.copyWith(
                                      color: const Color(0xff273D8C)),
                                ),
                              ),
                            ],
                          ),
                          SizedBox(
                            height: 10.h,
                          ),
                          //hoc phi sau uu dai
                          Row(
                            children: [
                              SizedBox(
                                width: 120.w,
                                child: Text(
                                  'Học phí sau  ưu đãi',
                                  style: defaultText14M.copyWith(
                                      color: const Color(0xff273D8C)),
                                ),
                              ),
                              Text(
                                ': ',
                                style: defaultText14M.copyWith(
                                    color: const Color(0xff273D8C)),
                              ),
                              SizedBox(
                                width: 180.w,
                                child: Text(
                                  widget.infoModel[index].feeAfterDiscount == 0
                                      ? ''
                                      : '${NumberFormat("#,###", "vi_VN").format(widget.infoModel[index].feeAfterDiscount)} VND',
                                  style: defaultText14M.copyWith(
                                      color: const Color(0xff273D8C)),
                                ),
                              ),
                            ],
                          ),
                          SizedBox(
                            height: 10.h,
                          ),
                          //so buoi hoc
                          Row(
                            children: [
                              SizedBox(
                                width: 120.w,
                                child: Text(
                                  'Số buổi học',
                                  style: defaultText14M.copyWith(
                                      color: const Color(0xff273D8C)),
                                ),
                              ),
                              Text(
                                ': ',
                                style: defaultText14M.copyWith(
                                    color: const Color(0xff273D8C)),
                              ),
                              SizedBox(
                                width: 180.w,
                                child: Text(
                                  widget.infoModel[index].soBuoiHoc.toString(),
                                  style: defaultText14M.copyWith(
                                      color: const Color(0xff273D8C)),
                                ),
                              ),
                            ],
                          ),
                          SizedBox(
                            height: 10.h,
                          ),
                          //ghi chu
                          Row(
                            children: [
                              SizedBox(
                                width: 120.w,
                                child: Text(
                                  'Ghi chú',
                                  style: defaultText14M.copyWith(
                                      color: const Color(0xff273D8C)),
                                ),
                              ),
                              Text(
                                ': ',
                                style: defaultText14M.copyWith(
                                    color: const Color(0xff273D8C)),
                              ),
                              SizedBox(
                                width: 180.w,
                                child: Text(
                                  widget.infoModel[index].note,
                                  style: defaultText14M.copyWith(
                                      color: const Color(0xff273D8C)),
                                ),
                              ),
                            ],
                          ),
                          SizedBox(
                            height: 10.h,
                          ),
                          //ngay tao
                          Row(
                            children: [
                              SizedBox(
                                width: 120.w,
                                child: Text(
                                  'Ngày tạo',
                                  style: defaultText14M.copyWith(
                                      color: const Color(0xff273D8C)),
                                ),
                              ),
                              Text(
                                ': ',
                                style: defaultText14M.copyWith(
                                    color: const Color(0xff273D8C)),
                              ),
                              SizedBox(
                                width: 180.w,
                                child: Text(
                                  widget.infoModel[index].createdAt,
                                  style: defaultText14M.copyWith(
                                      color: const Color(0xff273D8C)),
                                ),
                              ),
                            ],
                          ),
                          SizedBox(
                            height: 10.h,
                          ),
                          //ngay het han
                          Row(
                            children: [
                              SizedBox(
                                width: 120.w,
                                child: Text(
                                  'Ngày hết hạn',
                                  style: defaultText14M.copyWith(
                                      color: const Color(0xff273D8C)),
                                ),
                              ),
                              Text(
                                ': ',
                                style: defaultText14M.copyWith(
                                    color: const Color(0xff273D8C)),
                              ),
                              SizedBox(
                                width: 180.w,
                                child: Text(
                                  widget.infoModel[index].expiryDate,
                                  style: defaultText14M.copyWith(
                                      color: const Color(0xff273D8C)),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ));
                }),
            SizedBox(
              height: 20.h,
            ),
            Row(
              children: [
                SizedBox(
                  width: 16.w,
                ),
                Container(
                  padding:
                      EdgeInsets.symmetric(vertical: 4.h, horizontal: 16.w),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(16.r),
                    color: const Color(0xff6A4C93),
                  ),
                  child: Text(
                    'Tổng học phí gốc : ',
                    style: defaultText14M.copyWith(color: Colors.white),
                  ),
                ),
                const Spacer(),
                Container(
                  padding:
                      EdgeInsets.symmetric(vertical: 4.h, horizontal: 16.w),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(16.r),
                    color: const Color(0xff6A4C93),
                  ),
                  child: Text(
                    '${NumberFormat("#,###", "vi_VN").format((widget.infoModel.fold(0, (sum, p) => sum + p.feeOriginal)))} VND',
                    style:
                        defaultText14M.copyWith(color: const Color(0xffffffff)),
                    //textAlign: TextAlign.right,
                  ),
                ),
                SizedBox(
                  width: 16.w,
                ),
              ],
            ),
            SizedBox(
              height: 10.h,
            ),
            Row(
              children: [
                SizedBox(
                  width: 16.w,
                ),
                Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(16.r),
                    color: const Color(0xff8AC926),
                  ),
                  padding: EdgeInsets.symmetric(vertical: 4.h, horizontal: 8.w),
                  child: Text(
                    'Tổng học phí sau ưu đãi : ',
                    style:
                        defaultText14M.copyWith(color: const Color(0xffffffff)),
                  ),
                ),
                const Spacer(),
                Container(
                  padding:
                      EdgeInsets.symmetric(vertical: 4.h, horizontal: 16.w),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(16.r),
                    color: const Color(0xff8AC926),
                  ),
                  child: Text(
                    '${NumberFormat("#,###", "vi_VN").format(widget.infoModel.fold(0, (sum, p) => sum + p.feeAfterDiscount))} VND',
                    style:
                        defaultText14M.copyWith(color: const Color(0xffffffff)),
                    //textAlign: TextAlign.right,
                  ),
                ),
                SizedBox(
                  width: 16.w,
                ),
              ],
            ),
            SizedBox(
              height: 10.h,
            ),
            Row(
              children: [
                SizedBox(
                  width: 16.w,
                ),
                Container(
                  padding:
                      EdgeInsets.symmetric(vertical: 4.h, horizontal: 16.w),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(16.r),
                    color: const Color(0xff1982C4),
                  ),
                  child: Text(
                    'Tổng số buổi học : ',
                    style:
                        defaultText14M.copyWith(color: const Color(0xffffffff)),
                  ),
                ),
                const Spacer(),
                Container(
                  padding:
                      EdgeInsets.symmetric(vertical: 4.h, horizontal: 16.w),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(16.r),
                    color: const Color(0xff1982C4),
                  ),
                  child: Text(
                    '${widget.infoModel.fold(0, (sum, p) => sum + p.soBuoiHoc)} buổi',
                    style:
                        defaultText14M.copyWith(color: const Color(0xffffffff)),
                    //textAlign: TextAlign.right,
                  ),
                ),
                SizedBox(
                  width: 16.w,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
