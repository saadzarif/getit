import 'package:flutter/cupertino.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:getit/core/utils/extensions/context.dart';

Container errorSnackbar({
  required String content,
  required BuildContext context,
}) {
  return Container(
    width: 375.w,
    padding: EdgeInsets.symmetric(vertical: 10.h, horizontal: 10.w),
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(12.r),
      color: CupertinoColors.systemRed,
    ),
    alignment: Alignment.center,
    child: Column(
      children: [
        Text(
          content,
          style: context.textStyles.mThick.copyWith(
            color: CupertinoColors.white,
          ),
          textAlign: TextAlign.center,
        ),
      ],
    ),
  );
}

Container successSnackbar({
  required String content,
  required BuildContext context,
}) {
  return Container(
    width: 375.w,
    padding: EdgeInsets.symmetric(vertical: 15.h, horizontal: 10.w),
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(12.r),
      color: const Color(0xffFA82B5),
    ),
    alignment: Alignment.center,
    child: Text(
      content,
      style: context.textStyles.mThick.copyWith(
        color: CupertinoColors.white,
      ),
      textAlign: TextAlign.center,
    ),
  );
}

void showSnackbar(context, Widget snackBar) {
  FToast fToast = FToast().init(context);
  fToast.showToast(
    gravity: ToastGravity.BOTTOM,
    isDismissable: true,
    toastDuration: const Duration(seconds: 2),
    child: TweenAnimationBuilder(
      tween: Tween<double>(begin: 0, end: 1),
      duration: const Duration(milliseconds: 1400),
      builder: (context, value, child) {
        return Opacity(
          opacity: value.clamp(0, 1),
          child: snackBar,
        );
      },
    ),
  );
}
