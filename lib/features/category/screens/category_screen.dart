import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:getit/core/models/item_model.dart';
import 'package:getit/core/utils/extensions/context.dart';
import 'package:getit/features/category/widgets/arrow_painter.dart';
import 'package:getit/features/category/widgets/category_screen_appbar.dart';
import 'package:getit/features/category/widgets/product_primary_details.dart';
import 'package:getit/features/home/widgets/constants.dart';
import 'package:like_button/like_button.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class CategoryScreen extends StatefulWidget {
  const CategoryScreen({
    super.key,
    required this.categoryName,
  });
  final String categoryName;
  @override
  State<CategoryScreen> createState() => _CategoryScreenState();
}

class _CategoryScreenState extends State<CategoryScreen> {
  late List<ItemModel> categoryItems;
  int currentIndex = 0;
  final PageController pageController = PageController(
    initialPage: 0,
  );
  // SMIInput<bool>? input;
  // Artboard? artboard;
  // String assetPath = 'assets/riv/like_button.riv';
  // initializeArtboard() async {
  //   final data = await rootBundle.load(assetPath);
  //   final file = RiveFile.import(data);
  //   final board = file.mainArtboard;
  //   // SMIInput<bool>? input;
  //   final controller =
  //       StateMachineController.fromArtboard(board, 'stateMachine');
  //   if (controller != null) {
  //     board.addController(controller);
  //     input = controller.findInput<bool>('checked');
  //     input!.value = categoryItems[currentIndex].isFavorite;
  //     artboard = board;
  //   }
  // }

  // @override
  // void didChangeDependencies() async {
  //   await initializeArtboard();
  //   setState(() {});
  //   super.didChangeDependencies();
  // }

  @override
  void initState() {
    categoryItems = items
        .where((element) => element.itemGroup == widget.categoryName)
        .toList();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    List<GlobalKey<LikeButtonState>> globalKeys = List.generate(
        categoryItems.length, (index) => GlobalKey<LikeButtonState>());
    return CupertinoPageScaffold(
      backgroundColor: const Color(0xff9daf9b),
      navigationBar: categoryScreenAppBar(
        context,
        widget.categoryName,
      ),
      child: SafeArea(
        child: Column(
          children: [
            Container(
              height: 450.h,
              decoration: BoxDecoration(
                  color: CupertinoColors.white,
                  borderRadius:
                      BorderRadius.vertical(bottom: Radius.circular(18.r))),
              child: PageView.builder(
                itemCount: categoryItems.length,
                controller: pageController,
                onPageChanged: (value) {
                  setState(() {
                    currentIndex = value;
                  });
                },
                itemBuilder: (context, index) {
                  return SingleChildScrollView(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        SizedBox(
                          height: 30.h,
                        ),
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            SizedBox(
                              height: 35.h,
                              width: 35.h,
                              child: LikeButton(
                                isLiked: categoryItems[index].isFavorite,
                                padding: EdgeInsets.zero,
                                size: 25.sp,
                                key: globalKeys[index],
                                onTap: (isLiked) async {
                                  setState(() {
                                    items
                                            .where((element) =>
                                                element.itemName ==
                                                categoryItems[index].itemName)
                                            .first
                                            .isFavorite =
                                        !categoryItems[index].isFavorite;
                                  });
                                  return !isLiked;
                                },
                                postFrameCallback: (LikeButtonState state) {
                                  if (categoryItems[index].isFavorite) {
                                    state.controller?.forward();
                                  }
                                },
                              ),
                            ),
                            Image.asset(
                              categoryItems[index].itemImage,
                              width: 225.w,
                              height: 300.h,
                              fit: BoxFit.contain,
                            ),
                            CupertinoButton(
                              child: Text(
                                "Details",
                                style: context.textStyles.mThick.copyWith(
                                  color: const Color(0xff4a756e),
                                ),
                              ),
                              onPressed: () {},
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 15.h,
                        ),
                        ProductPrimaryDetails(
                          product: categoryItems[index],
                        ),
                      ],
                    ),
                  );
                },
              ),
            ),
            SizedBox(
              height: 30.h,
            ),
            Container(
              height: 100.h,
              padding: EdgeInsets.symmetric(horizontal: 8.w),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  GestureDetector(
                    onTap: () {
                      setState(() {
                        currentIndex--;
                      });
                      pageController.animateToPage(currentIndex,
                          duration: const Duration(milliseconds: 600),
                          curve: Curves.fastEaseInToSlowEaseOut);
                    },
                    child: CustomPaint(
                      size: Size(40.w, 25.h),
                      painter: ArrowPainter(arrowLength: 40.w, isLeft: true),
                    ),
                  ),
                  const Spacer(),
                  AnimatedSmoothIndicator(
                    activeIndex: currentIndex,
                    count: categoryItems.length,
                    effect: WormEffect(
                      activeDotColor: const Color(0xff4a756e),
                      dotColor: CupertinoColors.white.withOpacity(0.5),
                      spacing: 10,
                      dotHeight: 8.h,
                      dotWidth: 8.h,
                    ),
                  ),
                  const Spacer(),
                  GestureDetector(
                    onTap: () {
                      setState(() {
                        currentIndex++;
                      });
                      pageController.animateToPage(currentIndex,
                          duration: const Duration(milliseconds: 600),
                          curve: Curves.fastEaseInToSlowEaseOut);
                    },
                    child: CustomPaint(
                      size: Size(40.w, 25.h),
                      painter: ArrowPainter(arrowLength: 40.w, isLeft: false),
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
