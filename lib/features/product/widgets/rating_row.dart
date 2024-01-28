import 'package:flutter/cupertino.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:getit/core/utils/extensions/context.dart';

class RatingsRow extends StatelessWidget {
  const RatingsRow({
    super.key,
    required this.images,
  });
  final List<String> images;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Stack(
          clipBehavior: Clip.none,
          children: images
              .asMap()
              .map((index, e) => MapEntry(
                  index,
                  Padding(
                    padding: EdgeInsets.only(left: 0.7 * 28.r * index),
                    child: Container(
                      height: 28.h,
                      width: 28.h,
                      decoration: BoxDecoration(
                        border: Border.all(
                            width: 0, color: CupertinoColors.systemGrey2),
                        color: CupertinoColors.white.withOpacity(0.2),
                        shape: BoxShape.circle,
                        image: DecorationImage(
                          image: AssetImage(
                            images[index],
                          ),
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                  )))
              .values
              .toList()
              .reversed
              .toList(),
        ),
        SizedBox(
          width: 15.w,
        ),
        Text(
          "434+ people liked this",
          style: context.textStyles.sRegular
              .copyWith(color: CupertinoColors.white, fontSize: 15.sp),
        )
      ],
    );
  }
}
