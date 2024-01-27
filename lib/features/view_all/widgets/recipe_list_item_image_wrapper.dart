import 'dart:math' as math;

import 'package:flutter/material.dart';

class RecipeListItemImageWrapper extends StatefulWidget {
  const RecipeListItemImageWrapper({
    Key? key,
    required this.child,
    this.playOnce = false,
    required this.invert,
  }) : super(key: key);

  final Widget child;
  final bool playOnce;
  final bool invert;
  @override
  State<RecipeListItemImageWrapper> createState() =>
      _RecipeListItemImageWrapperState();
}

class _RecipeListItemImageWrapperState extends State<RecipeListItemImageWrapper>
    with SingleTickerProviderStateMixin, AutomaticKeepAliveClientMixin {
  late final AnimationController animationController;
  late final Animation<double> scaleAnimation;
  late final Animation<double> rotationAnimation;

  @override
  void initState() {
    super.initState();
    animationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 700),
    )..forward();

    scaleAnimation = Tween<double>(begin: 0.6, end: 1).animate(
      CurvedAnimation(
        parent: animationController,
        curve: const Interval(0.3, 1, curve: Curves.easeOutBack),
      ),
    );

    rotationAnimation = Tween<double>(
      begin: 20 * math.pi / 180,
      end: 0,
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
    super.build(context);
    return Transform.translate(
      // offset: Offset(0, 0),
      // offset: Offset(20, 20),
      offset: Offset(widget.invert ? -10 : 30, -10),
      child: AnimatedBuilder(
        animation: animationController,
        child: widget.child,
        builder: (context, child) {
          return Transform.scale(
            scale: scaleAnimation.value,
            alignment:
                widget.invert ? Alignment.centerLeft : Alignment.centerRight,
            child: Transform.rotate(
              angle: rotationAnimation.value,
              alignment:
                  widget.invert ? Alignment.centerLeft : Alignment.centerRight,
              child: child,
            ),
          );
        },
      ),
    );
  }

  @override
  bool get wantKeepAlive => widget.playOnce;
}
