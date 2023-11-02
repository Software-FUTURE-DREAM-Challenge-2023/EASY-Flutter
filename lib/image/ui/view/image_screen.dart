import 'package:easy_flutter/core/constant/app_color.dart';
import 'package:easy_flutter/image/ui/view/image_info_screen.dart';
import 'package:easy_flutter/widget/button_widget.dart';
import 'package:easy_flutter/widget/header_title_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class ImageScreen extends StatefulWidget {
  const ImageScreen({Key? key}) : super(key: key);

  @override
  State<ImageScreen> createState() => _ImageScreenState();
}

class _ImageScreenState extends State<ImageScreen> {
  final pageController = PageController(initialPage: 1000);
  bool _isSelectedAll = false;

  List<String> type = ['합성수지', '금속', '종이'];

  Map<String, List<String>> details = {
    '합성수지': ['페트병', '플라스틱', '비닐류'],
    '금속': ['캔류'],
    '종이': ['종이', '일반팩', '멸균팩'],
  };

  int selectedTypeIndex = 0;
  int selectedDetailIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.white,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: EdgeInsets.only(top: 30.h),
            child: HeaderTitleWidget(content: '사용방법'),
          ),
          Padding(
            padding: EdgeInsets.only(top: 40.h, left: 33.5.w),
            child: ButtonWidget(
              onTap: () {
                setState(
                  () {
                    showDialog(
                      context: context,
                      builder: (context) {
                        int tempSelectedTypeIndex = selectedTypeIndex;
                        int tempSelectedDetailIndex = selectedDetailIndex;
                        return StatefulBuilder(
                          builder: (context, setState) {
                            return AlertDialog(
                              content: SizedBox(
                                height: 300,
                                child: Column(
                                  children: <Widget>[
                                    SizedBox(
                                      height: 150.0,
                                      child: CupertinoPicker(
                                        itemExtent: 30.0,
                                        onSelectedItemChanged: (index) {
                                          setState(() {
                                            tempSelectedTypeIndex = index;
                                            tempSelectedDetailIndex = 0;
                                          });
                                        },
                                        children:
                                            type.map((t) => Text(t)).toList(),
                                      ),
                                    ),
                                    SizedBox(
                                      height: 150.0,
                                      child: CupertinoPicker(
                                        itemExtent: 30.0,
                                        onSelectedItemChanged: (index) {
                                          setState(() {
                                            tempSelectedDetailIndex = index;
                                          });
                                        },
                                        children: details[
                                                type[tempSelectedTypeIndex]]!
                                            .map((d) => Text(d))
                                            .toList(),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              actions: <Widget>[
                                TextButton(
                                  child: Text('확인'),
                                  onPressed: () {
                                    setState(() {
                                      selectedTypeIndex = tempSelectedTypeIndex;
                                      selectedDetailIndex =
                                          tempSelectedDetailIndex;
                                    });
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (context) => ImageInfoScreen(
                                          type: type[selectedTypeIndex],
                                          detail:
                                              details[type[selectedTypeIndex]]![
                                                  selectedDetailIndex],
                                        ),
                                      ),
                                    );
                                  },
                                ),
                              ],
                            );
                          },
                        );
                      },
                    );
                  },
                );
              },
              height: 58,
              width: 308,
              fontSize: 18,
              content: '배출 방법 검색하기',
              imageSize: 33,
              image: 'assets/images/icon/camera.png',
            ),
          ),
          Padding(
            padding: EdgeInsets.only(top: 50.h, left: 35.w),
            child: Text(
              '오늘의 분리수거 지식',
              style: TextStyle(
                color: AppColor.black,
                fontFamily: 'Roboto',
                fontWeight: FontWeight.w700,
                fontSize: 16.sp,
              ),
            ),
          ),
          SizedBox(height: 20.h),
          SizedBox(
            height: 117.h,
          ),
          Padding(
            padding: EdgeInsets.only(top: 10.h),
            child: Container(
              width: double.infinity,
              alignment: Alignment.center,
              child: SmoothPageIndicator(
                controller: pageController,
                count: 3,
                effect: ScrollingDotsEffect(
                  dotHeight: 6.h,
                  dotWidth: 6.h,
                  dotColor: AppColor.primaryColor,
                  activeDotColor: AppColor.green,
                ),
              ),
            ),
          ),
          /*Padding(
            padding: EdgeInsets.only(top: 35.h, left: 35.w),
            child: Text(
              '최근 검색 기록',
              style: TextStyle(
                color: AppColor.black,
                fontFamily: 'Roboto',
                fontWeight: FontWeight.w700,
                fontSize: 16.sp,
              ),
            ),
          ),
          Center(
            child: Container(
              height: 220.h,
              width: 300.w,
              padding: EdgeInsets.only(top: 10.h),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          SizedBox(
                            width: 24.w,
                            height: 24.h,
                            child: Checkbox(
                              value: _isSelectedAll,
                              activeColor: AppColor.realGreen,
                              checkColor: AppColor.white,
                              onChanged: (value) {
                                setState(() {
                                  _isSelectedAll = !_isSelectedAll;
                                });
                              },
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.only(left: 7.w),
                            child: Text(
                              '전체 선택',
                              style: TextStyle(
                                color: AppColor.black,
                                fontSize: 10.sp,
                                fontFamily: 'Roboto',
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          )
                        ],
                      ),
                      Text(
                        '삭제',
                        style: TextStyle(
                          color: AppColor.black,
                          fontSize: 10.sp,
                          fontFamily: 'Roboto',
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ],
                  ),
                  // ListView.builder(
                  //   itemCount: 3,
                  //   itemBuilder: (context, index) {
                  //     return SearchListWidget(itemName: 'dsds', itemType: '멀라');
                  //   },
                  // ),
                ],
              ),
            ),
          ),*/
        ],
      ),
    );
  }
}
