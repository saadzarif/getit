import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:getit/core/utils/extensions/context.dart';

class CustomSliverDelegate extends SliverPersistentHeaderDelegate {
  final double expandedHeight;
  final bool hideTitleWhenExpanded;

  CustomSliverDelegate({
    required this.expandedHeight,
    this.hideTitleWhenExpanded = true,
  });

  @override
  Widget build(
      BuildContext context, double shrinkOffset, bool overlapsContent) {
    return Stack(
      clipBehavior: Clip.none,
      children: [
        Container(
          width: MediaQuery.of(context).size.width,
          height: expandedHeight,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.vertical(bottom: Radius.circular(32.r)),
            color: const Color(0xff9daf9b),
          ),
          alignment: Alignment.bottomRight,
          padding: EdgeInsets.only(bottom: 20.h, right: 20.w),
          child: Opacity(
            opacity: (1 - shrinkOffset / expandedHeight).clamp(0, 1),
            child: Image.asset(
              'assets/images/16.png',
              height: 190.h,
              fit: BoxFit.cover,
            ),
          ),
        ),
        Positioned(
          left: 12.w,
          // top: expandedHeight / 4 - shrinkOffset,
          bottom: 30.h,
          child: Opacity(
            opacity: (1 - shrinkOffset / expandedHeight).clamp(0, 1),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Icon(
                      Icons.location_on,
                      size: 18.sp,
                      color: CupertinoColors.white,
                    ),
                    Text(
                      'Milan, Italy',
                      style: context.textStyles.mRegular
                          .copyWith(color: CupertinoColors.white),
                    ),
                  ],
                ),
                SizedBox(
                  height: 30.h,
                ),
                Text(
                  'Spring Sale',
                  style: context.textStyles.mThick
                      .copyWith(fontSize: 26.sp, color: CupertinoColors.white),
                ),
                SizedBox(
                  height: 10.h,
                ),
                Text(
                  'Save up to \$20\non sale sneaker.',
                  style: context.textStyles.mRegular
                      .copyWith(color: Colors.white, height: 1.1),
                ),
                SizedBox(
                  height: 25.h,
                ),
              ],
            ),
          ),
        ),
        Positioned(
          top: expandedHeight / 1.15 - shrinkOffset * 0.58,
          left: MediaQuery.of(context).size.width / 14,
          right: MediaQuery.of(context).size.width / 14,
          child: Opacity(
            opacity: 1,
            child: Container(
              width: 300.w,
              height: 45.h,
              decoration: BoxDecoration(
                  color: CupertinoColors.white,
                  borderRadius: BorderRadius.circular(16.r),
                  boxShadow: const [
                    BoxShadow(
                        color: Colors.black12,
                        blurRadius: 5,
                        spreadRadius: 3,
                        offset: Offset(0, 3))
                  ]),
              child: Material(
                color: Colors.transparent,
                child: TextField(
                  decoration: InputDecoration(
                    constraints: BoxConstraints.loose(Size(300.w, 45.h)),
                    prefixIcon: Material(
                        color: Colors.transparent,
                        child: InkWell(
                            onTap: () {}, child: const Icon(Icons.search))),
                    hintText: "Find a brand",
                    suffixIcon: Material(
                      color: Colors.transparent,
                      child: InkWell(
                        onTap: () {},
                        child: const Icon(
                          Icons.mic,
                        ),
                      ),
                    ),
                    border: InputBorder.none,
                  ),
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }

  @override
  double get maxExtent => expandedHeight + expandedHeight / 6;

  @override
  double get minExtent => kToolbarHeight * 1.3;

  @override
  bool shouldRebuild(SliverPersistentHeaderDelegate oldDelegate) {
    return true;
  }
}
