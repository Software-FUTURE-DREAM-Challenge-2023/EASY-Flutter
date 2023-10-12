import 'package:easy_flutter/core/constant/app_color.dart';
import 'package:easy_flutter/presentation/widget/text_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          const Spacer(),
          Image.asset(
            'assets/images/image.png',
          ),
        ],
      ),
    );
  }
}
