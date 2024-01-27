import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:getit/core/utils/extensions/context.dart';
import 'package:getit/features/view_all/widgets/animated_search_bar.dart';

ObstructingPreferredSizeWidget viewAllScreenAppBar(
    {required Function(String) onChanged,
    required TextEditingController controller,
    required BuildContext context}) {
  return CupertinoNavigationBar(
    backgroundColor: const Color(0xff9daf9b),
    border: Border.all(color: const Color.fromARGB(77, 183, 202, 181), width: 0.5),
    padding: EdgeInsetsDirectional.symmetric(horizontal: 10.w),
    automaticallyImplyLeading: false,
    automaticallyImplyMiddle: false,
    transitionBetweenRoutes: true,
    trailing: Material(
      color: Colors.transparent,
      child: AnimationSearchBar(
        backIconColor: CupertinoColors.white,
        backIcon: CupertinoIcons.chevron_back,
        centerTitle: 'Shop',
        centerTitleStyle: context.textStyles.mThick
            .copyWith(fontSize: 24.sp, color: CupertinoColors.white),
        searchIconColor: CupertinoColors.white,
        closeIconColor: CupertinoColors.white,
        cursorColor: CupertinoColors.white,
        onChanged: onChanged,
        searchTextEditingController: controller,
        horizontalPadding: 5.w,
        searchFieldHeight: 35.h,
      ),
    ),
  );
}
