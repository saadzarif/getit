import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:getit/core/models/item_model.dart';
import 'package:getit/core/utils/extensions/context.dart';

class ProductPrimaryDetails extends StatelessWidget {
  const ProductPrimaryDetails({super.key,required this.product,});
  final ItemModel product;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 16.w),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                product.itemName,
                style: context.textStyles.mThick,
              ),
              Text(
                product.itemBrand,
                style: context.textStyles.mThick,
              ),
            ],
          ),
          SizedBox(
            height: 8.h,
          ),
          RatingBar.builder(
            itemSize: 18,
            wrapAlignment: WrapAlignment.start,
            initialRating: product.itemRating,
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
            "${product.itemPrice.toStringAsFixed(2)} USD",
            style: context.textStyles.thin200.copyWith(
              color: CupertinoColors.black,
              fontSize: 18.sp,
            ),
          ),
        ],
      ),
    );
  }
}
