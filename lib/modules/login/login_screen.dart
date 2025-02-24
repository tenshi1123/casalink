import 'package:casalink/modules/splash/onboarding.dart';
import 'package:casalink/utils/constants/color.dart';
import 'package:casalink/utils/constants/styles.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../models/checkin_model.dart';
import '../../models/info_model.dart';
import '../../repo/follow_class_repo.dart';
import '../../repo/info_repo.dart';
import '../../repo/login_repo.dart';
import '../../router/app_pages.dart';
import '../../router/app_router.dart';
import 'forgot_password_screen.dart';
import 'package:flutter_svg/flutter_svg.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});
  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  bool _isObscure = true;
  final _focusNode = FocusNode();
  final _focusNode1 = FocusNode();
  TextEditingController? passController = TextEditingController();
  TextEditingController? studenIdController = TextEditingController();
  bool isPhoneNoValid(String? phoneNo) {
    if (phoneNo == null) return false;
    final regExp = RegExp(r'(^(?:[+0]9)?[0-9]{8,12}$)');
    return regExp.hasMatch(phoneNo);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      backgroundColor: Colors.white,
      body: Container(
        height: 812.h,
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage("assets/images/background.png"),
            fit: BoxFit.cover,
          ),
        ),
        child: GestureDetector(
          onTap: () {
            _focusNode.unfocus();
          },
          child: Padding(
            padding: EdgeInsets.only(
              left: 20.w,
              right: 20.w,

              //bottom: MediaQuery.of(context).viewInsets.bottom,
            ),
            child: SingleChildScrollView(
              child: Column(
                children: [
                  SizedBox(height: 84.h),
                  Row(
                    children: [
                      GestureDetector(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: ((context) => const Onbonding()),
                            ),
                          );
                        },
                        child: Image(
                          image:
                              const AssetImage('assets/images/back_arrow.png'),
                          height: 48.h,
                          width: 48.w,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 50.h),
                  Text(
                    'Xin chào!',
                    textAlign: TextAlign.center,
                    overflow: TextOverflow.clip,
                    style: TextStyle(
                      fontSize: 24.sp,
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 10.h),
                  Text(
                    'Chào mừng đã trở lại, hãy đăng nhập',
                    textAlign: TextAlign.right,
                    style: TextStyle(
                      color: Colors.white.withValues(alpha: 0.6),
                      fontSize: 16.sp,
                      fontWeight: FontWeight.normal,
                    ),
                    overflow: TextOverflow.clip,
                  ),
                  SizedBox(
                    height: 30.h,
                  ),
                  Container(
                    width: 350.w,
                    height: 48.h,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(40.r)),
                      border: Border.all(
                          color: Colors.white.withValues(alpha: 0.4)),
                      color: Colors.white.withValues(alpha: 0.2),
                    ),
                    child: Center(
                      child: TextField(
                          keyboardType: const TextInputType.numberWithOptions(),
                          controller: studenIdController,
                          focusNode: _focusNode1,
                          scrollPadding: EdgeInsets.symmetric(
                              vertical:
                                  MediaQuery.of(context).viewInsets.bottom),
                          decoration: InputDecoration(
                            prefixIcon: SvgPicture.asset(
                              'assets/icons/user1.svg',
                              height: 17.h,
                              width: 14.w,
                              fit: BoxFit.scaleDown,
                            ),
                            hintText: 'Số điện thoại',
                            border: const OutlineInputBorder(
                                borderSide: BorderSide.none),
                            hintStyle: TextStyle(
                              fontSize: 16.sp,
                              color: Colors.white.withValues(alpha: 0.4),
                            ),
                          ),
                          style:
                              TextStyle(fontSize: 16.sp, color: Colors.white)),
                    ),
                  ),
                  SizedBox(
                    height: 20.h,
                  ),
                  Container(
                    width: 350.w,
                    height: 48.h,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(40.r)),
                      border: Border.all(
                          color: Colors.white.withValues(alpha: 0.4)),
                      color: Colors.white.withValues(alpha: 0.2),
                    ),
                    child: Center(
                      child: TextField(
                        obscureText: _isObscure,
                        obscuringCharacter: "*",
                        controller: passController,
                        focusNode: _focusNode,
                        textAlignVertical: TextAlignVertical.center,
                        style: TextStyle(fontSize: 16.sp, color: Colors.white),
                        // scrollPadding: EdgeInsets.symmetric(
                        //     vertical: MediaQuery.of(context).viewInsets.top),
                        decoration: InputDecoration(
                          contentPadding: const EdgeInsets.only(top: 0),
                          prefixIcon: SvgPicture.asset(
                            'assets/icons/lock1.svg',
                            height: 17.h,
                            width: 14.w,
                            fit: BoxFit.scaleDown,
                          ),
                          hintText: 'Mật khẩu',
                          border: const OutlineInputBorder(
                              borderSide: BorderSide.none),
                          hintStyle: TextStyle(
                            fontSize: 16.sp,
                            color: Colors.white.withValues(alpha: 0.4),
                          ),
                          suffixIcon: IconButton(
                            padding: const EdgeInsets.only(top: 0),
                            icon: _isObscure
                                ? SvgPicture.asset(
                                    'assets/icons/eye_close.svg',
                                    height: 17.h,
                                    width: 14.w,
                                    color: Colors.white,
                                    fit: BoxFit.scaleDown,
                                  )
                                : SvgPicture.asset(
                                    'assets/icons/eye_open.svg',
                                    height: 17.h,
                                    width: 14.w,
                                    color: Colors.white,
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
                  SizedBox(
                    height: 25.h,
                  ),
                  Row(
                    children: [
                      const Spacer(),
                      GestureDetector(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: ((context) => const ForgotPassScreen()),
                            ),
                          );
                        },
                        child: Text(
                          'Quên mật khẩu',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 14.sp,
                            //decoration: TextDecoration.underline,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 60.h,
                  ),
                  GestureDetector(
                    onTap: () async {
                      if (isPhoneNoValid(studenIdController?.text) == false) {
                        showDialog(
                          context: context,
                          builder: (BuildContext context) {
                            return AlertDialog(
                              title: Text(
                                'Số điện thoại không đúng định dạng',
                                style: defaultText14M,
                              ),
                              content: Text(
                                'Vui lòng kiểm tra lại số điện thoại đã nhập',
                                style: defaultText14M,
                              ),
                              actionsPadding:
                                  const EdgeInsets.symmetric(horizontal: 10.0),
                              actions: <Widget>[
                                TextButton(
                                  child: const Text(
                                    'ok',
                                  ),
                                  onPressed: () {
                                    Navigator.of(context).pop();
                                  },
                                ),
                              ],
                            );
                          },
                        );
                      } else {
                        bool loged = await LoginRepo().login(
                          studenIdController?.text ?? '',
                          passController?.text ?? '',
                        );
                        if (loged == true) {
                          InfoModel infoModel = await InfoRepo().getInfo();
                          CheckinModel infoClassModel =
                              await FollowClassRepo().getListCheckin();
                          AppRouter.toPage(context, AppPages.BottomNavBarPage,
                              // blocValue: _authBloc,
                              arguments: {
                                'infoModel': infoModel,
                                'infoClassModel': infoClassModel
                              });
                        } else {
                          showDialog(
                            context: context,
                            builder: (BuildContext context) {
                              return CupertinoAlertDialog(
                                title: const Text('Vui lòng thử lại'),
                                content: const Text(
                                    'Vui lòng kiểm tra lại mã học sinh và mật khẩu của bạn'),
                                actions: <Widget>[
                                  CupertinoDialogAction(
                                    isDefaultAction: true,
                                    child: Text(
                                      'Yes',
                                      style: TextStyle(
                                        fontSize: 20,
                                        color: pri500,
                                      ),
                                    ),
                                    onPressed: () {
                                      Navigator.of(context, rootNavigator: true)
                                          .pop(
                                        (_) => false,
                                      );
                                    },
                                  )
                                ],
                              );
                            },
                          );
                        }
                      }
                    },
                    child: Container(
                      height: 48.h,
                      width: 340.w,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(77.r),
                        color: const Color(0xff28B4E9),
                      ),
                      child: Center(
                        child: Text(
                          'Đăng nhập',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 16.sp,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 10.h,
                  ),
                  // GestureDetector(
                  //   onTap: () {},
                  //   child: Container(
                  //     height: 48.h,
                  //     width: 340.w,
                  //     decoration: BoxDecoration(
                  //       borderRadius: BorderRadius.circular(9.r),
                  //       color: Colors.white,
                  //       border: Border.all(),
                  //     ),
                  //     child: Center(
                  //       child: Text(
                  //         'Đăng nhập với tư cách khách',
                  //         textAlign: TextAlign.center,
                  //         style: TextStyle(
                  //           color: key1Color,
                  //           fontSize: 14.sp,
                  //           fontWeight: FontWeight.w700,
                  //         ),
                  //       ),
                  //     ),
                  //   ),
                  // ),
                  SizedBox(
                    height: 60.h,
                  ),
                  // GestureDetector(
                  //   onTap: () {
                  //     Navigator.push(
                  //       context,
                  //       MaterialPageRoute(
                  //         builder: ((context) => const RegisterScreen()),
                  //       ),
                  //     );
                  //   },
                  //   child: RichText(
                  //     text: TextSpan(
                  //       text: 'Chưa có tài khoản ?',
                  //       style: defaultText16M,
                  //       children: <TextSpan>[
                  //         TextSpan(
                  //           text: ' Đăng ký',
                  //           style: defaultText16M.copyWith(color: main1Color),
                  //         ),
                  //       ],
                  //     ),
                  //   ),
                  // ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
