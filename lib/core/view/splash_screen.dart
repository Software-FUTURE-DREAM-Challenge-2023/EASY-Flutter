import 'package:dio/dio.dart';
import 'package:easy_flutter/core/constant/app_color.dart';
import 'package:easy_flutter/core/view/naver_login_screen.dart';
import 'package:easy_flutter/widget/text_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SplashScreen extends StatefulWidget {
  final bool delay;
  const SplashScreen({Key? key, required this.delay}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  final dio = Dio();


  @override
  void initState() {
    super.initState();

    Future.delayed(
      Duration(milliseconds: widget.delay == true ? 1500 : 0),
          () {
        showDialog(
          context: context,
          barrierDismissible: false,
          builder: (context) {
            return AlertDialog(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(13.r),
              ),
              content: SizedBox(
                width: 282.w,
                height: 297.h,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Column(
                      children: [
                        TextWidget(fontSize: 28),
                        Padding(
                          padding: EdgeInsets.only(top: 10.h),
                          child: Text(
                            '환경을 고려하는 착한생각',
                            style: TextStyle(
                              color: AppColor.black,
                              fontSize: 14.sp,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ),
                      ],
                    ),
                    GestureDetector(
                      onTap: () {
                        setState(() {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => NaverLoginScreen()
                            ),
                          );
                        });
                      },
                      child: Container(
                        width: 196.w,
                        height: 38.h,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(5.r),
                          border: Border.all(
                            color: Color(0xFFCCCCCC),
                            width: 1.w,
                          ),
                        ),
                        child: Row(
                          children: [
                            Padding(
                              padding: EdgeInsets.only(left: 10.w),
                              child: SizedBox(
                                width: 30.w,
                                height: 30.h,
                                child: CircleAvatar(
                                  backgroundImage: AssetImage(
                                    'assets/images/icon/naver.png',
                                  ),
                                ),
                              ),
                            ),
                            Expanded(
                              child: Center(
                                child: Text(
                                  '네이버 로그인',
                                  style: TextStyle(
                                    color: AppColor.primaryColor,
                                    fontSize: 14.sp,
                                    fontFamily: 'Roboto',
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            );
          },
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.white,
      body: Column(
        children: [
          const Spacer(),
          Image.asset(
            'assets/images/splash/image.png',
          ),
        ],
      ),
    );
  }
}
