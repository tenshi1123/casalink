import 'package:casalink/utils/constants/styles.dart';
import 'package:casalink/utils/widget/webview_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:flutter_widget_from_html/flutter_widget_from_html.dart';
import 'package:persistent_bottom_nav_bar_v2/persistent_bottom_nav_bar_v2.dart';
import 'package:url_launcher/url_launcher.dart';
import '../../models/category_model.dart';
import '../../modules/chat/screen/chat_screen.dart';
import '../constants/color.dart';

Widget homeTab(
    {required String title,
    bool isSeprator = true,
    bool hasNumber = true,
    int count = 0}) {
  return Tab(
    child: Container(
      //width: 70.w,
      height: 50.h,
      decoration: isSeprator
          ? const BoxDecoration(
              border: Border(
                left: BorderSide(
                  color: Colors.grey,
                  width: 1,
                  style: BorderStyle.solid,
                ),
              ),
            )
          : null,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          SizedBox(
            width: 3.w,
          ),
          SizedBox(
            width: 77.w,
            child: Center(
              child: Text(
                title,
              ),
            ),
          ),
          hasNumber
              ? Container(
                  decoration: BoxDecoration(
                    color: keyBlack,
                    borderRadius: BorderRadius.all(Radius.circular(10.r)),
                  ),
                  height: 20.h,
                  padding: EdgeInsets.symmetric(horizontal: 4.h),
                  child: Center(
                    child: Text(
                      '10',
                      style: defaultText12B.copyWith(color: Colors.white),
                    ),
                  ),
                )
              : SizedBox(
                  width: 10.w,
                ),
        ],
      ),
    ),
  );
}

class ConversationItem extends StatelessWidget {
  const ConversationItem(
      {super.key,
      required this.title1,
      required this.title2,
      required this.title3,
      required this.title4});

  final String title1;
  final String title2;
  final String title3;
  final String title4;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => ChatScreen(
              title: title1,
              avatar: title3,
            ),
          ),
        );
      },
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Image(
            image: AssetImage(title3),
            height: 48.h,
            width: 48.w,
          ),
          SizedBox(
            width: 220.w,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title1,
                  style: defaultText16B,
                ),
                Text(
                  title2,
                  style: defaultText14M.copyWith(
                    color: const Color(0xff292929).withValues(alpha: 0.6),
                  ),
                ),
              ],
            ),
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                '09:03',
                style: defaultText12Re,
              ),
              SizedBox(
                height: 8.h,
              ),
              SvgPicture.asset(
                'assets/icons/seen.svg',
                height: 17.h,
                width: 14.w,
                fit: BoxFit.scaleDown,
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class DocumentItem extends StatelessWidget {
  const DocumentItem({
    super.key,
    required this.model,
  });
  final LibraryModel model;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () async {
        pushWithoutNavBar(
          context,
          MaterialPageRoute(
            builder: ((context) => WebViewScreen(
                  link: model.linkDetail,
                  title: 'Thư viện tài liệu',
                )),
          ),
        );
      },
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Image.network(
            model.img,
            width: 240.w,
            height: 160.h,
            fit: BoxFit.fill,
          ),
          // Text(
          //   model.id,
          //   style: defaultText14B,
          // ),
        ],
      ),
    );
  }
}

class PostItem extends StatelessWidget {
  const PostItem({
    super.key,
    required this.model,
  });
  final PostModel model;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () async {
        pushWithoutNavBar(
          context,
          MaterialPageRoute(
            builder: ((context) => WebViewScreen(
                  link: model.link,
                  title: model.postTitle,
                )),
          ),
        );
      },
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Image.network(
            model.thumbnailUrl,
            width: 240.w,
            height: 160.h,
            fit: BoxFit.fill,
          ),
          Expanded(
            child: Text(
              model.postTitle,
              style: defaultText14B,
              maxLines: 2,
            ),
          ),
        ],
      ),
    );
  }
}
