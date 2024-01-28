import 'package:flutter/material.dart';

class ProductListItemTextWrapper extends StatefulWidget {
  const ProductListItemTextWrapper({
    Key? key,
    required this.child,
  }) : super(key: key);

  final Widget child;

  @override
  State<ProductListItemTextWrapper> createState() =>
      _ProductListItemTextWrapperState();
}

class _ProductListItemTextWrapperState extends State<ProductListItemTextWrapper>
    with SingleTickerProviderStateMixin {
  late final AnimationController animationController;
  late final Animation<Offset> offsetAnimation;

  @override
  void initState() {
    super.initState();
    animationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 700),
    )..forward();

    offsetAnimation = Tween<Offset>(
      begin: const Offset(0, -30),
      end: Offset.zero,
    ).animate(
      CurvedAnimation(
        parent: animationController,
        curve: const Interval(0.3, 1, curve: Curves.easeOutBack),
      ),
    );
  }

  @override
  void dispose() {
    animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: animationController,
      child: widget.child,
      builder: (context, child) {
        return Transform.translate(
          offset: offsetAnimation.value,
          child: child,
        );
      },
    );
  }
}
