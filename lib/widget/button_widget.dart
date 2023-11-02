import 'package:easy_flutter/core/constant/app_color.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ButtonWidget extends StatelessWidget {
  final double height;
  final double width;
  final String image;
  final int imageSize;
  final String content;
  final int fontSize;
  final VoidCallback onTap;

  const ButtonWidget({
    Key? key,
    required this.height,
    required this.width,
    required this.fontSize,
    required this.content,
    required this.imageSize,
    required this.image,
    required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: height.h,
        width: width.w,
        decoration: BoxDecoration(
          color: AppColor.white,
          borderRadius: BorderRadius.circular(8.r),
          border: Border.all(
            color: AppColor.realGreen,
            width: 1.w,
          ),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(width: 10.w),
            SizedBox(
              width: imageSize.w,
              height: imageSize.h,
              child: Image.asset(
                '$image',
              ),
            ),
            Expanded(
              child: Center(
                child: Text(
                  content,
                  style: TextStyle(
                    color: AppColor.black,
                    fontSize: 18.sp,
                    fontFamily: 'Pretendard',
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
