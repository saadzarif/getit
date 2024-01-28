import 'package:flutter/material.dart';
import 'package:getit/core/models/item_model.dart';

class ProductImage extends StatelessWidget {
  const ProductImage(
    this.recipe, {
    Key? key,
    this.imageRotationAngle = 0,
    this.imageSize,
    this.alignment = Alignment.center,
    this.hasShadow = true,
    this.shadowOffset,
  }) : super(key: key);

  final ItemModel recipe;
  final double imageRotationAngle;
  final double? imageSize;
  final AlignmentGeometry alignment;
  final bool hasShadow;
  final Offset? shadowOffset;

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: alignment,
      child: Hero(
        tag: '__recipe_${recipe.itemName}_image__',
        // Todo: MAYBE add a TweenAnimationBuilder for smoother animation??
        child: SizedBox(
          width: imageSize,
          height: imageSize,
          child: Stack(
            clipBehavior: Clip.none,
            children: [
              if (hasShadow) _buildShadow(),
              Positioned.fill(
                child: Transform.rotate(
                  angle: imageRotationAngle,
                  child: Image.asset(
                    recipe.itemImage,
                    width: imageSize,
                    height: imageSize,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildShadow() {
    Widget child = Container(
      clipBehavior: Clip.none,
      decoration: const BoxDecoration(
        color: Colors.transparent,
        shape: BoxShape.circle,
        boxShadow: [
          // BoxShadow(
          //   color: AppColors.orangeDark.withOpacity(0.5),
          //   blurRadius: 10,
          // ),
        ],
      ),
    );

    if (shadowOffset != null) {
      child = TweenAnimationBuilder(
        tween: Tween<Offset>(begin: Offset.zero, end: shadowOffset),
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeOutBack,
        builder: (context, Offset offset, child) => Transform.translate(
          offset: offset,
          child: child,
        ),
        child: child,
      );
    }

    return child;
  }
}
