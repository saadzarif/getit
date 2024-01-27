import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:getit/core/models/item_model.dart';
import 'package:getit/core/utils/extensions/context.dart';
import 'package:getit/features/home/widgets/constants.dart';

class RecommendedItemContainer extends StatelessWidget {
  const RecommendedItemContainer({
    super.key,
    required this.item,
  });
  final ItemModel item;

  @override
  Widget build(BuildContext context) {
    return Stack(
      clipBehavior: Clip.none,
      children: [
        Hero(
          tag: '${item.itemName}1',
          transitionOnUserGestures: true,
          // flightShuttleBuilder: (flightContext, animation, flightDirection,
          //     fromHeroContext, toHeroContext) {
          //   return AnimatedBuilder(
          //     animation: animation,
          //     builder: (context, child) {
          //       return Container(
          //         margin: EdgeInsets.symmetric(
          //             horizontal:
          //                 (1.0 - animation.value) * 16 + animation.value * 16.w,
          //             vertical: (1.0 - animation.value) * 16 +
          //                 animation.value * 20.h),
          //         padding: EdgeInsets.symmetric(
          //             horizontal:
          //                 (1.0 - animation.value) * 24 + animation.value * 16.w,
          //             vertical:
          //                 (1.0 - animation.value) * 24 + animation.value * 5.h),
          //         height:
          //             (1.0 - animation.value) * 500.h + animation.value * 115.h,
          //         width: double.maxFinite,
          //         decoration: BoxDecoration(
          //           color: const Color(0xff9daf9b),
          //           borderRadius: BorderRadius.circular(
          //               (1.0 - animation.value) * 24.r +
          //                   animation.value * 16.r),
          //         ),
          //         child: Column(
          //           crossAxisAlignment: CrossAxisAlignment.start,
          //           children: [
          //             Image.asset(
          //               brandImages[item.itemBrand],
          //               height: (1.0 - animation.value) * 35.h +
          //                   animation.value * 30.h,
          //               width: (1.0 - animation.value) * 35.h +
          //                   animation.value * 30.h,
          //               color: CupertinoColors.white,
          //             ),
          //             SizedBox(
          //               height: (1.0 - animation.value) * 5.h +
          //                   animation.value * 0.h,
          //             ),
          //             Text(
          //               item.itemName,
          //               style: context.textStyles.mThick.copyWith(
          //                 color: CupertinoColors.white,
          //                 // fontSize: 22.sp,
          //                 fontSize: (1.0 - animation.value) * 22.sp +
          //                     animation.value * 16.sp,
          //                 fontWeight:
          //                     animation.value > 0.5 ? FontWeight.w800 : null,
          //               ),
          //             ),
          //             SizedBox(
          //               height: (1.0 - animation.value) * 5.h +
          //                   animation.value * 2.h,
          //             ),
          //             RatingBar.builder(
          //               itemSize: 18,
          //               wrapAlignment: WrapAlignment.start,
          //               initialRating: item.itemRating,
          //               direction: Axis.horizontal,
          //               allowHalfRating: true,
          //               itemPadding: EdgeInsets.zero,
          //               unratedColor: CupertinoColors.white.withOpacity(0.1),
          //               ignoreGestures: true,
          //               itemBuilder: (context, _) => const Icon(
          //                 Icons.star_rounded,
          //                 color: CupertinoColors.white,
          //               ),
          //               onRatingUpdate: (rating) {},
          //             ),
          //             SizedBox(
          //               height: (1.0 - animation.value) * 5.h +
          //                   animation.value * 2.h,
          //             ),
          //             Text(
          //               "${item.itemPrice.toStringAsFixed(2)} USD",
          //               style: context.textStyles.thin200.copyWith(
          //                 color: CupertinoColors.white,
          //                 fontSize: (1.0 - animation.value) * 20.sp +
          //                     animation.value * 18.sp,
          //                 fontWeight:
          //                     animation.value < 0.5 ? FontWeight.w400 : null,
          //               ),
          //             ),
          //             Spacer(),
          //           ],
          //         ),
          //       );
          //     },
          //   );
          // },
          // flightShuttleBuilder: (flightContext, animation, flightDirection,
          //     fromHeroContext, toHeroContext) {
          //   return AnimatedBuilder(
          //     animation: animation,
          //     builder: (context, child) => FadeTransition(
          //       opacity: animation,
          //       child: Container(
          //         margin:
          //             EdgeInsets.symmetric(horizontal: 16.w, vertical: 20.h),
          //         padding:
          //             EdgeInsets.symmetric(horizontal: 16.w, vertical: 5.h),
          //         decoration: BoxDecoration(
          //             color: const Color(0xff9daf9b),
          //             borderRadius: BorderRadius.circular(16.r)),
          //       ),
          //     ),
          //   );
          // },
          child: Container(
            margin: EdgeInsets.symmetric(horizontal: 16.w, vertical: 20.h),
            padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 5.h),
            height: 115.h,
            width: double.maxFinite,
            decoration: BoxDecoration(
                color: const Color(0xff9daf9b),
                borderRadius: BorderRadius.circular(16.r)),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              // mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset(
                  brandImages[item.itemBrand],
                  height: 30.h,
                  width: 30.h,
                  color: CupertinoColors.white,
                ),
                Text(
                  item.itemName,
                  style: context.textStyles.mThick.copyWith(
                    color: CupertinoColors.white,
                  ),
                ),
                SizedBox(
                  height: 2.h,
                ),
                RatingBar.builder(
                  itemSize: 18,
                  wrapAlignment: WrapAlignment.start,
                  initialRating: item.itemRating,
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
                  height: 2.h,
                ),
                Text(
                  "${item.itemPrice.toStringAsFixed(2)} USD",
                  style: context.textStyles.thin200.copyWith(
                    color: CupertinoColors.white,
                    fontSize: 18.sp,
                  ),
                ),
              ],
            ),
          ),
        ),
        Positioned(
          right: 35.w,
          top: -5.h,
          height: 140.h,
          width: 140.h,
          child: Hero(
            tag: item.itemName,
            transitionOnUserGestures: true,
            child: Image.asset(
              item.itemImage,
              fit: BoxFit.contain,
            ),
          ),
        )
      ],
    );
  }
}
