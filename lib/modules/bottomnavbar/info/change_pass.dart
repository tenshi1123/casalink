import 'package:casalink/utils/constants/styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

class ChangePassScreen extends StatefulWidget {
  const ChangePassScreen({super.key});

  @override
  State<ChangePassScreen> createState() => _ChangePassScreenState();
}

class _ChangePassScreenState extends State<ChangePassScreen> {
  bool _isObscure = true;
  final _focusNode = FocusNode();
  TextEditingController? passController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios_new, color: Colors.black),
          onPressed: () {
            Navigator.of(context).pop(false);
          },
        ),
        backgroundColor: Colors.white,
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(
          horizontal: 16.w,
          vertical: 16.h,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Thay đổi mật khẩu',
              style: defaultText20B.copyWith(fontSize: 24.sp),
            ),
            SizedBox(
              height: 8.h,
            ),
            Text(
              'Bây giờ hãy nhập mật khẩu hiện tại của bạn',
              style: defaultText16M.copyWith(
                color: const Color(0xff292929).withValues(alpha: 0.4),
              ),
            ),
            SizedBox(
              height: 28.h,
            ),
            Container(
              width: 350.w,
              height: 48.h,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(40.r)),
                border: Border.all(color: Colors.white.withValues(alpha: 0.4)),
                color: const Color(0xfff0f0f0),
              ),
              child: Center(
                child: TextField(
                  obscureText: _isObscure,
                  obscuringCharacter: "*",
                  controller: passController,
                  focusNode: _focusNode,
                  textAlignVertical: TextAlignVertical.center,
                  // scrollPadding: EdgeInsets.symmetric(
                  //     vertical: MediaQuery.of(context).viewInsets.top),
                  decoration: InputDecoration(
                    contentPadding: const EdgeInsets.only(top: 0),
                    prefixIcon: SvgPicture.asset(
                      'assets/icons/lock1.svg',
                      height: 17.h,
                      width: 14.w,
                      fit: BoxFit.scaleDown,
                      color: const Color(0xff292929).withValues(alpha: 0.4),
                    ),
                    hintText: 'Nhập mật khẩu hiện tại',
                    border:
                        const OutlineInputBorder(borderSide: BorderSide.none),
                    hintStyle: TextStyle(
                      fontSize: 14.sp,
                      fontWeight: FontWeight.w500,
                      color: const Color(0xff292929).withValues(alpha: 0.4),
                    ),
                    suffixIcon: IconButton(
                      padding: const EdgeInsets.only(top: 0),
                      icon: _isObscure
                          ? SvgPicture.asset(
                              'assets/icons/eye_close.svg',
                              height: 17.h,
                              width: 14.w,
                              color: const Color(0xff292929)
                                  .withValues(alpha: 0.8),
                              fit: BoxFit.scaleDown,
                            )
                          : SvgPicture.asset(
                              'assets/icons/eye_open.svg',
                              height: 17.h,
                              width: 14.w,
                              color: const Color(0xff292929)
                                  .withValues(alpha: 0.8),
                              fit: BoxFit.scaleDown,
                            ),
                      onPressed: () {
                        setState(() {
                          _isObscure = !_isObscure;
                        });
                      },
                    ),
                  ),
                ),
              ),
            ),
            const Spacer(),
            Center(
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  textStyle: const TextStyle(fontSize: 20),
                  padding: EdgeInsets.symmetric(horizontal: 30.w),
                ),
                onPressed: () {},
                child: const Text('Xác nhận'),
              ),
            ),
            SizedBox(
              height: 16.h,
            )
          ],
        ),
      ),
    );
  }
}
