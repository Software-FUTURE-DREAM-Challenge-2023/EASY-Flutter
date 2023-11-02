import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:easy_flutter/core/constant/app_color.dart';
import 'package:easy_flutter/secret.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class RewardScreen extends StatefulWidget {
  final String name;
  final String id;

  const RewardScreen({Key? key, required this.name, required this.id})
      : super(key: key);

  @override
  State<RewardScreen> createState() => _RewardScreenState();
}

class _RewardScreenState extends State<RewardScreen> {
  String point = '';

  Future<void> getPoint() async {
    final dio = Dio();

    try {
      final resp = await dio.get(
        '$baseUrl/api/point/view/${widget.id}',
      );
      if (resp.statusCode == 200) {
        print('성공');
        print(resp.data);
        List<dynamic> responseData = jsonDecode(resp.data);
        String value = responseData[0][3].toString();
        setState(() {
          point = value;
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
    getPoint();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.white,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Container(
            width: 375.w,
            height: 305.h,
            color: AppColor.green,
            child: Column(
              children: [
                Container(
                  margin: EdgeInsets.only(top: 95.h),
                  width: 323.w,
                  height: 115.h,
                  decoration: BoxDecoration(
                    color: AppColor.white,
                    borderRadius: BorderRadius.circular(15.r),
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Padding(
                            padding: EdgeInsets.only(left: 26.w),
                            child: Text(
                              widget.name,
                              style: TextStyle(
                                  color: AppColor.black,
                                  fontSize: 19.sp,
                                  fontWeight: FontWeight.w700),
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.only(right: 24.w),
                            child: Text(
                              '적립내역 확인하기',
                              style: TextStyle(
                                color: AppColor.primaryColor,
                                fontWeight: FontWeight.w600,
                                fontSize: 12.sp,
                              ),
                            ),
                          ),
                        ],
                      ),
                      Container(
                        margin: EdgeInsets.only(top: 8.98.h, bottom: 19.02.h),
                        width: 293.w,
                        height: 1.h,
                        color: Color(0xFFE0E0E0),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Padding(
                            padding: EdgeInsets.only(left: 26.w),
                            child: Row(
                              children: [
                                Image.asset(
                                  'assets/images/icon/reward_coin.png',
                                  width: 16.52.w,
                                  height: 16.52.h,
                                ),
                                Padding(
                                  padding: EdgeInsets.only(left: 2.48.w),
                                  child: Text(
                                    '내 보유 포인트',
                                    style: TextStyle(
                                      color: AppColor.primaryColor,
                                      fontSize: 10.sp,
                                      fontWeight: FontWeight.w700,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.only(right: 20.w),
                            child: Text(
                              '${point}점',
                              style: TextStyle(
                                  color: AppColor.black,
                                  fontSize: 24.sp,
                                  fontWeight: FontWeight.w800),
                            ),
                          )
                        ],
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(top: 8.h),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        height: 39.h,
                        width: 153.w,
                        decoration: BoxDecoration(
                          color: AppColor.white,
                          borderRadius: BorderRadius.circular(5.r),
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Padding(
                              padding: EdgeInsets.only(left: 8.w),
                              child: Text(
                                '누적 포인트',
                                style: TextStyle(
                                  color: AppColor.primaryColor,
                                  fontSize: 11.sp,
                                  fontWeight: FontWeight.w700,
                                ),
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.only(right: 9.w),
                              child: Text(
                                '${point}점',
                                style: TextStyle(
                                  color: AppColor.black,
                                  fontSize: 15.sp,
                                  fontWeight: FontWeight.w700,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.only(left: 10.w),
                        height: 39.h,
                        width: 153.w,
                        decoration: BoxDecoration(
                          color: AppColor.white,
                          borderRadius: BorderRadius.circular(5.r),
                        ),
                        child: Center(
                          child: Text(
                            '포인트 상품 찾아보기',
                            style: TextStyle(
                              color: AppColor.primaryColor,
                              fontSize: 11.sp,
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
