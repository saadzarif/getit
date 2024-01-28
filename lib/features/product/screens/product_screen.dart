import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:getit/core/models/item_model.dart';
import 'package:getit/core/utils/extensions/context.dart';
import 'package:getit/features/product/widgets/basic_details.dart';
import 'package:getit/features/product/widgets/product_details_widget.dart';
import 'package:getit/features/product/widgets/rating_row.dart';
import 'package:getit/features/product/widgets/size_quantity_widgets.dart';

class ProductScreen extends StatefulWidget {
  const ProductScreen({
    super.key,
    required this.product,
  });
  final ItemModel product;
  @override
  State<ProductScreen> createState() => _ProductScreenState();
}

class _ProductScreenState extends State<ProductScreen> {
  String selectedSize = 'L';
  List<String> images = [
    "assets/images/no_profile_pic.png",
    "assets/images/no_profile_pic.png",
    "assets/images/no_profile_pic.png",
    "assets/images/no_profile_pic.png"
  ];
  int productQuantity = 1;
  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      child: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              height: 40.h + MediaQuery.of(context).padding.top,
              padding: EdgeInsets.only(top: MediaQuery.of(context).padding.top),
              decoration: const BoxDecoration(
                  color: CupertinoColors.white,
                  border: Border(
                    bottom: BorderSide(
                        color: CupertinoColors.systemGrey4, width: 0.8),
                  )),
              alignment: Alignment.centerLeft,
              child: Material(
                color: Colors.transparent,
                child: InkWell(
                  onTap: () {
                    Navigator.of(context).pop();
                  },
                  child: const Icon(
                    CupertinoIcons.back,
                    color: CupertinoColors.systemGrey,
                  ),
                ),
              ),
            ),
            Stack(
              children: [
                Hero(
                  tag: '${widget.product.itemName}',
                  transitionOnUserGestures: true,
                  flightShuttleBuilder: (flightContext, animation,
                      flightDirection, fromHeroContext, toHeroContext) {
                    return AnimatedBuilder(
                      animation: animation,
                      builder: (context, child) {
                        return Column(
                          children: [
                            SizedBox(
                              height: (1.0 - animation.value) * 20.h +
                                  animation.value * 16,
                            ),
                            Container(
                              margin: EdgeInsets.symmetric(
                                horizontal: (1.0 - animation.value) * 16.w +
                                    animation.value * 16,
                                // vertical: (1.0 - animation.value) * 20.h +
                                //     animation.value * 16,
                              ),
                              padding: EdgeInsets.symmetric(
                                horizontal: (1.0 - animation.value) * 16.w +
                                    animation.value * 24,
                                // vertical: (1.0 - animation.value) * 5.h +
                                //     animation.value * 24,
                              ),
                              height: (1.0 - animation.value) * 115.h +
                                  animation.value * 600.h,
                              width: double.maxFinite,
                              decoration: BoxDecoration(
                                color: const Color(0xff9daf9b),
                                borderRadius: BorderRadius.circular(
                                    (1.0 - animation.value) * 16.r +
                                        animation.value * 24.r),
                              ),
                              child: SingleChildScrollView(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    SizedBox(
                                      height: (1.0 - animation.value) * 5.h +
                                          animation.value * 24,
                                    ),
                                    basicDetailsForHeroAnimation(
                                      context: context,
                                      product: widget.product,
                                      animation: animation,
                                    ),
                                    SizedBox(
                                      height: (1.0 - animation.value) * 0.h +
                                          animation.value * 160.h,
                                    ),
                                    Opacity(
                                      opacity: animation.value.clamp(0, 0.8),
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          ...sizeAndQuanityWidgets(
                                              context: context,
                                              onValueChanged: (String? value) {
                                                if (value != null) {
                                                  setState(() {
                                                    selectedSize = value;
                                                  });
                                                }
                                              },
                                              productQuantity: productQuantity,
                                              decreaseQuantity: () {
                                                HapticFeedback.lightImpact();

                                                setState(() {
                                                  if (productQuantity > 1) {
                                                    productQuantity--;
                                                  }
                                                });
                                              },
                                              increaseQuantity: () {
                                                HapticFeedback.lightImpact();

                                                setState(() {
                                                  productQuantity++;
                                                });
                                              },
                                              selectedSize: selectedSize),
                                          SizedBox(
                                            height: 20.h,
                                          ),
                                          ...productDetails(
                                              context: context,
                                              details:
                                                  "Striped sneakers is a quintessential piece of casual shoes, loved by people of all ages and gender. Its simple yet versatile. This is the description of this product."),
                                          SizedBox(
                                            height: 12.h,
                                          ),
                                          Divider(
                                            thickness: 0.5,
                                            color: CupertinoColors.white
                                                .withOpacity(0.3),
                                          ),
                                          SizedBox(
                                            height: 8.h,
                                          ),
                                          RatingsRow(images: images),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            SizedBox(
                              height: (1.0 - animation.value) * 20.h +
                                  animation.value * 16,
                            ),
                          ],
                        );
                      },
                    );
                  },
                  child: Container(
                    margin: const EdgeInsets.all(16),
                    padding: const EdgeInsets.all(24),
                    height: 600.h,
                    width: double.maxFinite,
                    decoration: BoxDecoration(
                      color: const Color(0xff9daf9b),
                      borderRadius: BorderRadius.circular(24.r),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        ...basicDetails(
                            product: widget.product, context: context),
                        SizedBox(
                          height: 160.h,
                        ),
                        ...sizeAndQuanityWidgets(
                            context: context,
                            onValueChanged: (String? value) {
                              if (value != null) {
                                setState(() {
                                  selectedSize = value;
                                });
                              }
                            },
                            productQuantity: productQuantity,
                            decreaseQuantity: () {
                              HapticFeedback.lightImpact();
                              setState(() {
                                if (productQuantity > 1) {
                                  productQuantity--;
                                }
                              });
                            },
                            increaseQuantity: () {
                              HapticFeedback.lightImpact();

                              setState(() {
                                productQuantity++;
                              });
                            },
                            selectedSize: selectedSize),
                        SizedBox(
                          height: 20.h,
                        ),
                        ...productDetails(
                            context: context,
                            details:
                                "Striped sneakers is a quintessential piece of casual shoes, loved by people of all ages and gender. Its simple yet versatile. This is the description of this product."),
                        SizedBox(
                          height: 12.h,
                        ),
                        Divider(
                          thickness: 0.5,
                          color: CupertinoColors.white.withOpacity(0.3),
                        ),
                        SizedBox(
                          height: 8.h,
                        ),
                        RatingsRow(images: images),
                      ],
                    ),
                  ),
                ),
                Positioned(
                  top: 90.h,
                  right: 0,
                  child: Hero(
                    tag: widget.product.itemImage,
                    transitionOnUserGestures: true,
                    child: Image.asset(
                      widget.product.itemImage,
                      height: 200.h,
                      width: 200.w,
                    ),
                  ),
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}
