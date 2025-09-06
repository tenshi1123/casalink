import 'package:casalink/utils/constants/styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_widget_from_html/flutter_widget_from_html.dart';

import '../../models/schedule_model.dart';

class DailyFeedback extends StatefulWidget {
  const DailyFeedback(
      {super.key, required this.feedback, required this.feedbackModel});
  final String feedback;
  final FeedbackModel feedbackModel;
  @override
  State<DailyFeedback> createState() => _DailyFeedbackState();
}

class _DailyFeedbackState extends State<DailyFeedback> {
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
          'Nhận xét hằng ngày',
          style: defaultText18B.copyWith(
            color: const Color(0xff3C3C3C),
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
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
                    Text(
                      widget.feedbackModel.tenBuoi,
                      style: defaultText16B.copyWith(color: Colors.white),
                    ),
                    SizedBox(
                      height: 4.h,
                    ),
                    Text(
                      'Ngày: ${widget.feedbackModel.createdAt}',
                      style: defaultText16M.copyWith(color: Colors.white),
                    ),
                  ],
                )),
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: HtmlWidget(
                widget.feedback,
                textStyle: defaultText14B,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
