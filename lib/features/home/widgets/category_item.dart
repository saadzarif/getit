import 'package:flutter/cupertino.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:getit/core/utils/extensions/context.dart';
import 'package:getit/features/category/screens/category_screen.dart';
import 'package:getit/features/home/widgets/constants.dart';

class CategoryItem extends StatelessWidget {
  const CategoryItem({
    super.key,
    required this.index,
  });
  final int index;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.of(context).push(PageRouteBuilder(
          pageBuilder: (context, animation, secondaryAnimation) =>
              CategoryScreen(categoryName: categories[index]['categoryName']),
          transitionsBuilder: (context, animation, secondaryAnimation, child) {
            return FadeTransition(
              opacity: animation,
              child: child,
            );
          },
        ));
      },
      behavior: HitTestBehavior.opaque,
      child: Padding(
        padding: EdgeInsets.only(left: 16.w),
        child: Column(
          children: [
            Container(
              height: 60.h,
              width: 60.h,
              decoration: const BoxDecoration(
                color: Color(0xff4a756e),
                shape: BoxShape.circle,
              ),
              alignment: Alignment.center,
              child: Image.asset(
                categories[index]['categoryImage'],
                color: CupertinoColors.white,
                height: 25.h,
                width: 25.h,
              ),
            ),
            SizedBox(
              height: 3.h,
            ),
            Text(
              categories[index]['categoryName'],
              style: context.textStyles.sThick.copyWith(fontSize: 10.sp),
            )
          ],
        ),
      ),
    );
  }
}
