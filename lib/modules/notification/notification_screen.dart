import 'package:casalink/models/notification_model.dart';
import 'package:casalink/utils/constants/styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'detail_noti_screen.dart';

class NotificationScreen extends StatefulWidget {
  const NotificationScreen({super.key, required this.listNoti});
  final List<NotificationModel> listNoti;
  @override
  State<NotificationScreen> createState() => _NotificationScreenState();
}

class _NotificationScreenState extends State<NotificationScreen>
    with SingleTickerProviderStateMixin {
  int activeTabIndex = 0;

  @override
  void initState() {
    super.initState();
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
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Text(
            //   'Hôm qua',
            //   style: defaultText16B,
            // ),
            SizedBox(
              height: 12.h,
            ),
            Expanded(
              child: ListView.builder(
                physics: const BouncingScrollPhysics(),
                itemCount: widget.listNoti.length,
                itemBuilder: (context, index) {
                  return _NotificationItem(
                    title1: '',
                    title2: widget.listNoti[index].title,
                    title3: widget.listNoti[index].content,
                    title4: widget.listNoti[index].createdAt,
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _NotificationItem extends StatelessWidget {
  const _NotificationItem({
    required this.title1,
    required this.title2,
    required this.title3,
    required this.title4,
  });
  final String title1;
  final String title2;
  final String title3;
  final String title4;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: ((context) => const DetailNotiScreen()),
          ),
        );
      },
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Image(
                image: const AssetImage('assets/images/logo_icon.png'),
                height: 32.h,
                width: 32.w,
                fit: BoxFit.fill,
              ),
              SizedBox(
                width: 10.w,
              ),
              SizedBox(
                width: 299.w,
                //height: 90.h,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      title2,
                      style: defaultText14B,
                    ),
                    SizedBox(
                      height: 4.h,
                    ),
                    Text(
                      title3,
                      style: defaultText14Re.copyWith(
                        color: const Color(0xff292929).withValues(alpha: 0.8),
                      ),
                    ),
                    SizedBox(
                      height: 8.h,
                    ),
                    Text(
                      title4,
                      style: defaultText14Re.copyWith(
                          color:
                              const Color(0xff292929).withValues(alpha: 0.4)),
                    ),
                  ],
                ),
              ),
            ],
          ),
          Divider(
            color: const Color(0xff292929).withValues(alpha: 0.2),
          ),
        ],
      ),
    );
  }
}
