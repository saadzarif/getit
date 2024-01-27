import 'package:flutter/material.dart';

import '../../styling/text_styles.dart';

extension BuildContextX on BuildContext {
  Size get deviceSize => MediaQuery.of(this).size;

  bool get isSmallSize => deviceSize.width < 800;

  NavigatorState get navigator => Navigator.of(this);

  Color get primaryColor => Theme.of(this).colorScheme.primary;

  Color? get iconColor => Theme.of(this).iconTheme.color;

  AppTextStyles get textStyles => AppTextStyles();
}

extension NavigatorX on NavigatorState {
  Future<void> pushMaterialRoute(BuildContext context, Widget child) async {
    Navigator.push(context, MaterialPageRoute(builder: (context) => child));
  }
}
