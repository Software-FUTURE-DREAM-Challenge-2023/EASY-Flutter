import 'package:easy_flutter/core/constant/app_color.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SearchListWidget extends StatelessWidget {
  final String itemName;
  final String itemType;
  // final DateTime date;
  // final Image image;
  const SearchListWidget({
    required this.itemName,
    required this.itemType,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: 22.h),
      child: Row(
        children: [
          SizedBox(
            width: 24.w,
            height: 24.h,
            child: Checkbox(
              value: false,
              activeColor: AppColor.realGreen,
              checkColor: AppColor.white,
              onChanged: (value) {},
            ),
          ),
          SizedBox(width: 10.w),
          Container(
            width: 52.w,
            height: 52.h,
            decoration: BoxDecoration(
              color: Colors.grey,
              borderRadius: BorderRadius.circular(10.r),
            ),
          ),
          Padding(
            padding: EdgeInsets.only(left: 7.w),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: EdgeInsets.only(bottom: 6.h),
                  child: Text(
                    itemName,
                    style: TextStyle(
                      color: AppColor.black,
                      fontSize: 12.sp,
                      fontFamily: 'Roboto',
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                ),
                Text(
                  itemType,
                  style: TextStyle(
                    color: AppColor.primaryColor,
                    fontSize: 10.sp,
                    fontFamily: 'Roboto',
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ],
            ),
          ),
          const Spacer(),
          Text(
            '7월 21일',
            style: TextStyle(
              color: AppColor.black,
              fontSize: 10.sp,
              fontFamily: 'Roboto',
              fontWeight: FontWeight.w500,
            ),
          )
        ],
      ),
    );
  }
}
