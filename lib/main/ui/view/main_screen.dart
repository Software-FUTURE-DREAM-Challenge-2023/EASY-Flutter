import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:easy_flutter/core/constant/app_color.dart';
import 'package:easy_flutter/image/ui/view/image_screen.dart';
import 'package:easy_flutter/reward/ui/view/reward_screen.dart';
import 'package:easy_flutter/secret.dart';
import 'package:easy_flutter/widget/button_widget.dart';
import 'package:easy_flutter/widget/header_title_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class MainScreen extends StatefulWidget {
  final bool? state;
  const MainScreen({Key? key, this.state}) : super(key: key);

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  String nameText = "";
  String id = "";

  Future<void> getProfile() async {
    FlutterSecureStorage storage = FlutterSecureStorage();

    final dio = Dio();

    dynamic accessToken = await storage.read(key: 'accessToken');

    print(accessToken);

    try {
      final resp = await dio.get(
        '$baseUrl/api/oauth/profile?access_token=$accessToken',
      );
      if(resp.statusCode == 200) {
        print('성공');
        print(resp.data);
        Map<String, dynamic> responseData = jsonDecode(resp.data);
        String nickname = responseData['response']['nickname'];
        id = responseData['response']['id'];
        setState(() {
          nameText = nickname;
        });
      }
    } catch (err) {
      print('실패');
      print(err.toString());
    }
  }

  @override
  void initState() {
    super.initState();
    getProfile();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.white,
      body: Column(
        children: [
          SizedBox(
            height: 30.h,
          ),
          HeaderTitleWidget(content: '$nameText님'),
          SizedBox(height: 50.h),
          ButtonWidget(
            onTap: () {
              Navigator.push(context, MaterialPageRoute(builder: (context) => ImageScreen()));
            },
            height: 58,
            width: 308,
            image: 'assets/images/icon/star.png',
            imageSize: 33,
            content: '배출 방법 확인하기',
            fontSize: 25,
          ),
          SizedBox(height: 20.h),
          ButtonWidget(
            onTap: () {

            },
            height: 58,
            width: 308,
            image: 'assets/images/icon/palette.png',
            imageSize: 33,
            content: '업사이클링 공방 확인하기',
            fontSize: 25,
          ),
          SizedBox(height: 20.h),
          ButtonWidget(
            onTap: () {
              Navigator.push(context, MaterialPageRoute(builder: (context) => RewardScreen(name: nameText, id: id)));
            },
            height: 58,
            width: 308,
            image: 'assets/images/icon/money.png',
            imageSize: 33,
            content: '나의 포인트',
            fontSize: 25,
          ),
          const Spacer(),
          Image.asset('assets/images/splash/backgroundImage.png'),
        ],
      ),
    );
  }
}