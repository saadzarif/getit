import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:getit/core/utils/extensions/context.dart';

List<Widget> sizeAndQuanityWidgets(
    {required BuildContext context,
    required String selectedSize,
    required Function(String?) onValueChanged,
    required int productQuantity,
    required VoidCallback decreaseQuantity,
    required VoidCallback increaseQuantity,

    }) {
  return [
    Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          "Size",
          style: context.textStyles.mThick.copyWith(
            color: CupertinoColors.white,
            fontSize: 22.sp,
          ),
        ),
        Container(
          width: 75.w,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(6.r),
            boxShadow: [
              BoxShadow(
                color: CupertinoColors.white.withOpacity(0.2),
              ),
            ],
          ),
          padding: const EdgeInsets.all(3),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              GestureDetector(
                onTap: decreaseQuantity,
                child: const Icon(
                  CupertinoIcons.minus_square_fill,
                  color: CupertinoColors.white,
                ),
              ),
              Text(
                "$productQuantity",
                style: context.textStyles.sThick.copyWith(
                  color: CupertinoColors.white,
                ),
              ),
              GestureDetector(
                onTap:increaseQuantity,
                child: const Icon(
                  CupertinoIcons.plus_app_fill,
                  color: CupertinoColors.white,
                ),
              ),
            ],
          ),
        ),
      ],
    ),
    SizedBox(
      height: 16.h,
    ),
    Center(
      child: CupertinoSlidingSegmentedControl<String>(
        backgroundColor: CupertinoColors.white.withOpacity(0.05),
        padding: EdgeInsets.zero,
        thumbColor: const Color(0xff9daf9b),
        // This represents the currently selected segmented control.
        groupValue: selectedSize,
        // Callback that sets the selected segmented control.
        onValueChanged: onValueChanged,

        children: <String, Widget>{
          "S": Padding(
            padding: EdgeInsets.symmetric(horizontal: 0.w),
            child: const Text(
              'S',
              style: TextStyle(color: CupertinoColors.white),
            ),
          ),
          "M": Padding(
            padding: EdgeInsets.symmetric(horizontal: 0.w),
            child: const Text(
              'M',
              style: TextStyle(color: CupertinoColors.white),
            ),
          ),
          "L": Padding(
            padding: EdgeInsets.symmetric(horizontal: 0.w),
            child: const Text(
              'L',
              style: TextStyle(color: CupertinoColors.white),
            ),
          ),
          "XL": Padding(
            padding: EdgeInsets.symmetric(horizontal: 0.w),
            child: const Text(
              'XL',
              style: TextStyle(color: CupertinoColors.white),
            ),
          ),
          "XXL": Padding(
            padding: EdgeInsets.symmetric(horizontal: 0.w),
            child: const Text(
              'XXL',
              style: TextStyle(color: CupertinoColors.white),
            ),
          ),
        },
      ),
    ),
  ];
}
