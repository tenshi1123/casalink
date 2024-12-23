import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../utils/constants/styles.dart';

class PersonalScreen extends StatelessWidget {
  const PersonalScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          height: 560.h,
          width: double.infinity,
          decoration: const BoxDecoration(
            image: DecorationImage(
              image: AssetImage("assets/images/personal_background.png"),
              fit: BoxFit.fitWidth,
            ),
          ),
        ),
        Positioned(
          top: 92.h,
          left: 16.w,
          child: Row(
            children: [
              Image(
                image: const AssetImage('assets/images/avatar2.png'),
                height: 48.h,
                width: 48.w,
              ),
              SizedBox(
                width: 16.w,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Nguyễn Thế Hoàng',
                    style: defaultText18B.copyWith(color: Colors.white),
                  ),
                  Text(
                    '097 111 6262',
                    style: defaultText16M.copyWith(
                      color: Colors.white,
                    ),
                  ),
                ],
              )
            ],
          ),
        ),
        Positioned(
            top: 192.h,
            left: 0.w,
            child: Container(
              height: 600.h,
              width: 475.w,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(24.r),
              ),
              child: Column(
                children: [
                  ListTile(
                    leading: Image(
                      image: const AssetImage('assets/images/icon_info.png'),
                      height: 28.h,
                      width: 28.w,
                    ),
                    title: Text(
                      'Thông tin tài khoản',
                      style: defaultText16M,
                    ),
                    trailing: const Icon(Icons.arrow_forward_ios),
                  ),
                  ListTile(
                    leading: Image(
                      image:
                          const AssetImage('assets/images/icon_changepass.png'),
                      height: 28.h,
                      width: 28.w,
                    ),
                    title: Text(
                      'Đổi mật khẩu',
                      style: defaultText16M,
                    ),
                    trailing: const Icon(Icons.arrow_forward_ios),
                  ),
                  ListTile(
                    leading: Image(
                      image: const AssetImage('assets/images/icon_logout.png'),
                      height: 28.h,
                      width: 28.w,
                    ),
                    title: Text(
                      'Đăng xuất',
                      style: defaultText16M.copyWith(
                          color: const Color(0xffED1C24)),
                    ),
                    trailing: const Icon(Icons.arrow_forward_ios),
                  ),
                ],
              ),
            )),
      ],
    );
  }
}
