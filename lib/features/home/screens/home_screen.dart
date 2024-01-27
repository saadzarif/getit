import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:getit/core/models/item_model.dart';
import 'package:getit/core/utils/extensions/context.dart';
import 'package:getit/features/home/widgets/appbar.dart';
import 'package:getit/features/home/widgets/category_item.dart';
import 'package:getit/features/home/widgets/constants.dart';
import 'package:getit/features/home/widgets/item_container.dart';
import 'package:getit/features/product/screens/product_screen.dart';
import 'package:getit/features/view_all/screens/view_all_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  late List<ItemModel> recommendedItems;
  @override
  void initState() {
    recommendedItems = items.where((element) => element.isRecommended).toList();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      child: Material(
        color: Colors.transparent,
        child: CustomScrollView(
          shrinkWrap: true,
          slivers: [
            SliverPersistentHeader(
              pinned: true,
              floating: true,
              delegate: CustomSliverDelegate(
                expandedHeight: 260.h,
              ),
            ),
            SliverList(
              delegate: SliverChildListDelegate(
                [
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 16.w),
                    child: Text(
                      'Shop by Category',
                      style: context.textStyles.mThick.copyWith(
                          fontSize: 22.sp, fontWeight: FontWeight.w800),
                    ),
                  ),
                  SizedBox(
                    height: 10.h,
                  ),
                  SizedBox(
                    height: 80.h,
                    child: ListView.builder(
                      shrinkWrap: true,
                      scrollDirection: Axis.horizontal,
                      physics: const BouncingScrollPhysics(),
                      itemCount: categories.length,
                      itemBuilder: (context, index) {
                        return CategoryItem(index: index);
                      },
                    ),
                  ),
                  SizedBox(
                    height: 20.h,
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 16.w),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Recommended',
                          style: context.textStyles.lThick
                              .copyWith(fontSize: 23.sp),
                        ),
                        CupertinoButton(
                          onPressed: () {
                            Navigator.of(context).push(CupertinoPageRoute(
                              builder: (context) => const ViewAllScreen(),
                            ));
                          },
                          alignment: Alignment.centerRight,
                          padding: EdgeInsets.zero,
                          child: Text(
                            'View all',
                            style: context.textStyles.sThick
                                .copyWith(color: const Color(0xff9daf9b)),
                          ),
                        ),
                      ],
                    ),
                  ),
                  ListView.builder(
                    padding: EdgeInsets.zero,
                    shrinkWrap: true,
                    itemCount: recommendedItems.length,
                    physics: const BouncingScrollPhysics(),
                    itemBuilder: (context, index) {
                      return GestureDetector(
                        onTap: () {
                          Navigator.of(context).push(PageRouteBuilder(
                            pageBuilder: (context, animation,
                                    secondaryAnimation) =>
                                ProductScreen(product: recommendedItems[index]),
                            transitionDuration:
                                const Duration(milliseconds: 400),
                            transitionsBuilder: (context, animation,
                                secondaryAnimation, child) {
                              return FadeTransition(
                                opacity: animation,
                                child: child,
                              );
                            },
                          ));
                          // Navigator.of(context).push(CupertinoPageRoute(
                          //   builder: (context) =>
                          //       ProductScreen(product: recommendedItems[index]),
                          // ));
                        },
                        child: RecommendedItemContainer(
                            item: recommendedItems[index]),
                      );
                    },
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
