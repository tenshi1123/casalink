import 'package:casalink/modules/bottomnavbar/screen/class_screen.dart';
import 'package:casalink/utils/constants/styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

class NotificationScreen extends StatefulWidget {
  const NotificationScreen({super.key});

  @override
  State<NotificationScreen> createState() => _NotificationScreenState();
}

class _NotificationScreenState extends State<NotificationScreen>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;
  int activeTabIndex = 0;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(
      length: 2,
      vsync: this,
      initialIndex: 0,
    );
    _tabController.addListener(() {
      setState(() {
        activeTabIndex = _tabController.index;
      });
    });
  }

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
        title: Text(
          'Thông báo',
          style: defaultText18B.copyWith(
            color: Colors.white,
          ),
        ),
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 16.h),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Thứ hai - 27/10/2022',
              style: defaultText16B,
            ),
          ],
        ),
      ),
    );
  }
}

class LessonItem extends StatefulWidget {
  const LessonItem({super.key, required this.title});
  final String title;

  @override
  State<LessonItem> createState() => _LessonItemState();
}

class _LessonItemState extends State<LessonItem> {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        SizedBox(
          height: 12.h,
        ),
        Row(
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  '26/12/2024',
                  style: defaultText14M.copyWith(
                    fontWeight: FontWeight.w500,
                    color: const Color(0xff3C3C3C).withValues(alpha: 0.6),
                  ),
                ),
                Text(
                  widget.title,
                  style: defaultText16M.copyWith(
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ],
            ),
            const Spacer(),
            SvgPicture.asset(
              'assets/icons/arrow_right.svg',
            ),
            SizedBox(
              width: 16.w,
            ),
          ],
        ),
        Divider(
          color: const Color(0xff292929).withAlpha(20),
        ),
      ],
    );
  }
}

List<String> _title123 = [
  'Đánh giá giữa khoá - tháng 6',
  'Đánh giá giữa khoá - tháng 7',
  'Đánh giá giữa khoá - tháng 8',
  'Đánh giá giữa khoá - tháng 9',
  'Đánh giá giữa khoá - tháng 10',
  'Đánh giá giữa khoá - tháng 11',
];
