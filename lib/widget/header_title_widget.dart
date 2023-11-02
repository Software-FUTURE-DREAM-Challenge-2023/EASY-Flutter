import 'package:easy_flutter/core/constant/app_color.dart';
import 'package:easy_flutter/widget/text_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class HeaderTitleWidget extends StatelessWidget {
  final String content;
  const HeaderTitleWidget({
    required this.content,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Padding(
          padding: EdgeInsets.only(left: 30.w),
          child: TextWidget(fontSize: 25),
        ),
        Padding(
          padding: EdgeInsets.only(right: 24.w),
          child: Text(
            content,
            style: TextStyle(
              color: AppColor.primaryColor,
              fontSize: 10.sp,
            ),
          ),
        ),
      ],
    );
  }
}
