import 'package:flutter/material.dart';

class AnimatedScrollViewItem extends StatefulWidget {
  const AnimatedScrollViewItem({
    Key? key,
    required this.child,
  }) : super(key: key);

  final Widget child;

  @override
  State<AnimatedScrollViewItem> createState() => _AnimatedScrollViewItemState();
}

class _AnimatedScrollViewItemState extends State<AnimatedScrollViewItem>
    with SingleTickerProviderStateMixin, AutomaticKeepAliveClientMixin {
  late final AnimationController _animationController;
  late final Animation<double> _scaleAnimation;

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 300),
    )..forward();

    _scaleAnimation = Tween<double>(begin: 0.5, end: 1).animate(
      CurvedAnimation(
        parent: _animationController,
        curve: Curves.easeInOut,
      ),
    );
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return ScaleTransition(
      scale: _scaleAnimation,
      child: widget.child,
    );
  }

  @override
  bool get wantKeepAlive => false;
}
