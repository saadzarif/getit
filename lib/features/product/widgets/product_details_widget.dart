import 'package:flutter/cupertino.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:getit/core/utils/extensions/context.dart';

List<Widget> productDetails({required BuildContext context,required String details}){
  return [
      Text(
                          "Product Details",
                          style: context.textStyles.mThick.copyWith(
                            fontSize: 20.sp,
                            color: CupertinoColors.white,
                          ),
                        ),
                        SizedBox(
                          height: 8.h,
                        ),
                        Text(
                          details,
                          style: context.textStyles.thin300.copyWith(
                            color: CupertinoColors.white,
                            fontSize: 14.sp,
                          ),
                        ),
  ];
}