import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:getit/core/models/item_model.dart';
import 'package:getit/core/utils/extensions/context.dart';
import 'package:getit/features/home/widgets/constants.dart';
import 'package:getit/features/view_all/widgets/product_list_item_text_wrapper.dart';

class ProductListItemText extends StatelessWidget {
  const ProductListItemText(
    this.menuItem, {
    Key? key,
  }) : super(key: key);

  final ItemModel menuItem;

  @override
  Widget build(BuildContext context) {
    return ProductListItemTextWrapper(
      child: Padding(
        padding: EdgeInsets.symmetric(
          horizontal: 20.w,
          vertical: 25.h,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              brandImages[menuItem.itemBrand],
              height: 30.h,
              width: 30.h,
              color: CupertinoColors.black,
            ),
            Text(
              menuItem.itemName,
              style: context.textStyles.mThick.copyWith(
                color: CupertinoColors.black,
              ),
            ),
            SizedBox(
              height: 2.h,
            ),
            RatingBar.builder(
              itemSize: 18,
              wrapAlignment: WrapAlignment.start,
              initialRating: menuItem.itemRating,
              direction: Axis.horizontal,
              allowHalfRating: true,
              itemPadding: EdgeInsets.zero,
              unratedColor: CupertinoColors.black.withOpacity(0.1),
              ignoreGestures: true,
              itemBuilder: (context, _) => const Icon(
                Icons.star_rounded,
                color: CupertinoColors.black,
              ),
              onRatingUpdate: (rating) {},
            ),
            SizedBox(
              height: 2.h,
            ),
            Text(
              "${menuItem.itemPrice.toStringAsFixed(2)} USD",
              style: context.textStyles.thin200.copyWith(
                color: CupertinoColors.black,
                fontSize: 18.sp,
              ),
            ),
            // Hero(
            //   tag: '__recipe_${menuItem.itemName}_title__',
            //   child: Text(
            //     menuItem.itemName,
            //     style: Theme.of(context).textTheme.headline4!.copyWith(
            //           color:
            //             CupertinoColors.black,
            //         ),
            //   ),
            // ),
            // const SizedBox(height: 10),
            // Flexible(
            //   child: Hero(
            //     tag: '__recipe_${menuItem.id}_description__',
            //     child: Text(
            //       menuItem.description,
            //       style: Theme.of(context).textTheme.subtitle1!.copyWith(
            //             color:
            //                 AppColors.textColorFromBackground(menuItem.bgColor),
            //           ),
            //       maxLines: 3,
            //       overflow: TextOverflow.ellipsis,
            //     ),
            //   ),
            // ),
          ],
        ),
      ),
    );
  }
}
