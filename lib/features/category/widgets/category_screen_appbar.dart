import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:getit/core/utils/extensions/context.dart';

CupertinoNavigationBar categoryScreenAppBar(BuildContext context, String name) {
  return CupertinoNavigationBar(
    backgroundColor: CupertinoColors.white,
    padding: EdgeInsetsDirectional.symmetric(horizontal: 5.w),
    leading: Material(
      color: Colors.transparent,
      child: InkWell(
        onTap: () {
          Navigator.of(context).pop();
        },
        child: SizedBox(
          width: 80.w,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Icon(
                CupertinoIcons.chevron_back,
                color: CupertinoColors.systemGrey,
                size: 25.sp,
              ),
              Text(
                'Back',
                style: context.textStyles.thin200,
              )
            ],
          ),
        ),
      ),
    ),
    middle: Text(
      name,
      style: context.textStyles.mThick.copyWith(fontSize: 20.sp),
    ),
  );
}
