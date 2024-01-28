import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:getit/core/models/item_model.dart';
import 'package:getit/core/utils/extensions/context.dart';
import 'package:getit/features/home/widgets/constants.dart';
import 'package:google_fonts/google_fonts.dart';

List<Widget> basicDetails(
    {required ItemModel product, required BuildContext context}) {
  return [
    Image.asset(
      brandImages[product.itemBrand],
      height: 35.h,
      width: 35.h,
      color: CupertinoColors.white,
    ),
    SizedBox(
      height: 5.h,
    ),
    Text(
      product.itemName,
      style: context.textStyles.mThick.copyWith(
        color: CupertinoColors.white,
        fontSize: 22.sp,
        fontWeight: FontWeight.w800,
      ),
    ),
    SizedBox(
      height: 5.h,
    ),
    RatingBar.builder(
      itemSize: 18,
      wrapAlignment: WrapAlignment.start,
      initialRating: product.itemRating,
      direction: Axis.horizontal,
      allowHalfRating: true,
      itemPadding: EdgeInsets.zero,
      unratedColor: CupertinoColors.white.withOpacity(0.1),
      ignoreGestures: true,
      itemBuilder: (context, _) => const Icon(
        Icons.star_rounded,
        color: CupertinoColors.white,
      ),
      onRatingUpdate: (rating) {},
    ),
    SizedBox(
      height: 5.h,
    ),
    Text(
      "${product.itemPrice.toStringAsFixed(2)} USD",
      style: context.textStyles.mRegular.copyWith(
        color: CupertinoColors.white,
        fontSize: 20.sp,
      ),
    ),
  ];
}

Widget basicDetailsForHeroAnimation(
    {required ItemModel product,
    required BuildContext context,
    required Animation<double> animation}) {
  return Column(
      mainAxisAlignment: MainAxisAlignment.end,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Image.asset(
          brandImages[product.itemBrand],
          height: (1.0 - animation.value) * 30.h + animation.value * 35.h,
          width: (1.0 - animation.value) * 30.h + animation.value * 35.h,
          color: CupertinoColors.white,
        ),
        SizedBox(
          height: (1.0 - animation.value) * 1.h + animation.value * 5.h,
        ),
        Text(
          product.itemName,
          style: context.textStyles.mThick.copyWith(
            color: CupertinoColors.white,
            // fontSize: 22.sp,
            fontSize: (1.0 - animation.value) * 16.sp + animation.value * 22.sp,
            fontWeight: animation.value > 0.5 ? FontWeight.w800 : null,
          ),
        ),
        SizedBox(
          height: (1.0 - animation.value) * 4.5.h + animation.value * 5.h,
        ),
        RatingBar.builder(
          itemSize: 18,
          wrapAlignment: WrapAlignment.start,
          initialRating: product.itemRating,
          direction: Axis.horizontal,
          allowHalfRating: true,
          itemPadding: EdgeInsets.zero,
          unratedColor: CupertinoColors.white.withOpacity(0.1),
          ignoreGestures: true,
          itemBuilder: (context, _) => const Icon(
            Icons.star_rounded,
            color: CupertinoColors.white,
          ),
          onRatingUpdate: (rating) {},
        ),
        SizedBox(
          height: (1.0 - animation.value) * 4.h + animation.value * 5.h,
        ),
        Text(
          "${product.itemPrice.toStringAsFixed(2)} USD",
          style: GoogleFonts.inter(
            color: CupertinoColors.white,
            fontSize: (1.0 - animation.value) * 18.sp + animation.value * 20.sp,
            fontWeight: animation.value < 0.3
                ? FontWeight.w200
                : animation.value < 0.7
                    ? FontWeight.w300
                    : FontWeight.w400,
            fontStyle: FontStyle.normal,
            decoration: TextDecoration.none,
            letterSpacing: 0,
          ),
        ),
      ]);
}
