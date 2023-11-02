import 'package:easy_flutter/widget/text_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

loginDialog(BuildContext context) {
  showDialog(
    context: context,
    builder: (context) {
      return AlertDialog(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(13.r),
        ),
        content: Column(
          children: [
            TextWidget(
              fontSize: 28,
            ),
          ],
        ),
      );
    },
  );
}
