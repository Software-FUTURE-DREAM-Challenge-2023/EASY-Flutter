import 'package:easy_flutter/core/constant/app_color.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class TextWidget extends StatelessWidget {
  final int fontSize;

  const TextWidget({Key? key, required this.fontSize}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return RichText(
      text: TextSpan(
        children: [
          TextSpan(
            text: '에코',
            style: TextStyle(
              color: AppColor.realGreen,
              fontSize: fontSize.sp,
              fontFamily: 'Pretendard',
              fontWeight: FontWeight.w800,
            ),
          ),
          TextSpan(
            text: '마인드',
            style: TextStyle(
              color: AppColor.black,
              fontSize: fontSize.sp,
              fontFamily: 'Pretendard',
              fontWeight: FontWeight.w800,
            ),
          ),
        ],
      ),
    );
  }
}
