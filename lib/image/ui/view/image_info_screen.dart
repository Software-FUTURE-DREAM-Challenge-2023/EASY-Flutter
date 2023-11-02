import 'package:easy_flutter/core/constant/app_color.dart';
import 'package:easy_flutter/core/constant/waste_info.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ImageInfoScreen extends StatelessWidget {
  final String type;
  final String detail;
  const ImageInfoScreen({Key? key, required
   this.type, required this.detail}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    WasteInfo? wasteInfo = wasteInfoMap[type]![detail];
    return Scaffold(
      backgroundColor: AppColor.white,
      body: Stack(
        children: [
          Container(
            width: 375.w,
            height: 305.h,
            decoration: BoxDecoration(
              color: AppColor.green,
            ),
          ),
          Center(
            child: Container(
              width: 308.w,
              height: 560.h,
              decoration: BoxDecoration(
                color: AppColor.white,
                borderRadius: BorderRadius.circular(12.r),
                boxShadow: [
                  BoxShadow(
                    color: AppColor.primaryColor.withOpacity(0.3),
                    blurRadius: 15.r,
                  ),
                ],
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: EdgeInsets.only(left: 27.w, top: 45.h),
                    child: Row(
                      children: [
                        SizedBox(
                          width: 80.w,
                          height: 80.h,
                          child: CircleAvatar(
                            backgroundImage: AssetImage(wasteInfo!.imageUrl),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.only(left: 16.w),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Padding(
                                padding: EdgeInsets.only(bottom: 6.h),
                                child: Text(
                                  type,
                                  style: TextStyle(
                                    color: AppColor.black,
                                    fontSize: 14.sp,
                                    fontWeight: FontWeight.w800,
                                  ),
                                ),
                              ),
                              Text(
                                detail,
                                style: TextStyle(
                                  color: AppColor.primaryColor,
                                  fontSize: 12.sp,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding:
                        EdgeInsets.only(left: 27.w, top: 35.h, bottom: 18.h),
                    child: Text(
                      '분리배출방법',
                      style: TextStyle(
                          color: AppColor.black,
                          fontSize: 14.sp,
                          fontWeight: FontWeight.w600),
                    ),
                  ),
                  SizedBox(
                    height: 110.h,
                    width: double.infinity,
                    child: ListView.builder(
                      itemCount: wasteInfo!.methods.length,
                      itemBuilder: (context, index) {
                        return Center(
                          child: Padding(
                            padding:
                                EdgeInsets.only(bottom: 8.h),
                            child: Text(
                              wasteInfo.methods[index],
                              style: TextStyle(
                                color: AppColor.black,
                                fontSize: 12.sp,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                  // Padding(
                  //   padding:
                  //       EdgeInsets.only(left: 27.w, top: 30.h, bottom: 18.h),
                  //   child: Text(
                  //     '주변 공방 확인하기',
                  //     style: TextStyle(
                  //         color: AppColor.black,
                  //         fontSize: 14.sp,
                  //         fontWeight: FontWeight.w600),
                  //   ),
                  // ),
                  // Center(
                  //   child: SizedBox(
                  //     height: 146.h,
                  //     width: 254.w,
                  //     child: ListView.builder(
                  //       itemCount: 5,
                  //       itemBuilder: (context, index) {
                  //         return Padding(
                  //           padding: EdgeInsets.only(top: 9.h),
                  //           child: Row(
                  //             mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  //             children: [
                  //               Row(
                  //                 children: [
                  //                   Image.asset(
                  //                     'assets/images/icon/map_point.png',
                  //                     width: 16.w,
                  //                     height: 20.8.h,
                  //                   ),
                  //                   Padding(
                  //                     padding: EdgeInsets.only(left: 10.w),
                  //                     child: Text(
                  //                       '희성 공방',
                  //                       style: TextStyle(
                  //                         color: AppColor.black,
                  //                         fontWeight: FontWeight.w700,
                  //                         fontSize: 14.sp,
                  //                       ),
                  //                     ),
                  //                   ),
                  //                 ],
                  //               ),
                  //               Text(
                  //                 '부산광역시 강서구 가락대로 1393',
                  //                 style: TextStyle(
                  //                   color: AppColor.primaryColor,
                  //                   fontSize: 10.sp,
                  //                   fontWeight: FontWeight.w600,
                  //                 ),
                  //               )
                  //             ],
                  //           ),
                  //         );
                  //       },
                  //     ),
                  //   ),
                  // ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
