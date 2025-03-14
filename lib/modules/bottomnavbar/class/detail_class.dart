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
        backgroundColor: Colors.white,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios_new, color: Color(0xff3C3C3C)),
          onPressed: () {
            Navigator.of(context).pop(false);
          },
        ),
        title: Center(
          child: Text(
            'Chi tiết khoá học',
            style: defaultText18B,
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
                          Row(
                            children: [
                              SizedBox(
                                width: 100.w,
                                child: Text(
                                  'Số tiền tái phí',
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
                                width: 200.w,
                                child: Text(
                                  '${NumberFormat("#,###", "vi_VN").format(int.parse(widget.infoModel[index].moneyTaiPhi))} VND',
                                  style: defaultText14M.copyWith(
                                      color: const Color(0xff273D8C)),
                                  //textAlign: TextAlign.right,
                                ),
                              ),
                            ],
                          ),
                          SizedBox(
                            height: 6.h,
                          ),
                          Row(
                            children: [
                              SizedBox(
                                width: 100.w,
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
                              Text(
                                widget.infoModel[index].soBuoiHoc,
                                style: defaultText14M.copyWith(
                                    color: const Color(0xff273D8C)),
                              ),
                            ],
                          ),
                          SizedBox(
                            height: 6.h,
                          ),
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              SizedBox(
                                width: 100.w,
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
                                width: 200.w,
                                child: Text(
                                  widget.infoModel[index].note,
                                  style: defaultText14M.copyWith(
                                      color: const Color(0xff273D8C)),
                                ),
                              ),
                            ],
                          ),
                          SizedBox(
                            height: 6.h,
                          ),
                          Row(
                            children: [
                              SizedBox(
                                width: 100.w,
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
                              Text(
                                widget.infoModel[index].createdDate,
                                style: defaultText14M.copyWith(
                                    color: const Color(0xff273D8C)),
                              ),
                            ],
                          ),
                          SizedBox(
                            height: 6.h,
                          ),
                          Row(
                            children: [
                              SizedBox(
                                width: 100.w,
                                child: Text(
                                  'Hạn',
                                  style: defaultText14M.copyWith(
                                      color: const Color(0xff273D8C)),
                                ),
                              ),
                              Text(
                                ': ',
                                style: defaultText14M.copyWith(
                                    color: const Color(0xff273D8C)),
                              ),
                              Text(
                                widget.infoModel[index].expiryDate,
                                style: defaultText14M.copyWith(
                                    color: const Color(0xff273D8C)),
                              ),
                            ],
                          ),
                          SizedBox(
                            height: 6.h,
                          ),
                        ],
                      ));
                }),
          ],
        ),
      ),
    );
  }
}
