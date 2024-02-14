import 'package:flutter/material.dart';

extension Navigation on BuildContext {
  void pushNamed(String routeName, {Object? arguments}) {
    Navigator.of(this).pushNamed(routeName, arguments: arguments);
  }

  void pushReplacementNamed(String routeName, {Object? arguments}) {
    Navigator.of(this).pushReplacementNamed(routeName, arguments: arguments);
  }

  void pushReplacementNamedRemoveUntil(
      String newRoute, bool Function(Route<dynamic>) predicate,
      {Object? arguments}) {
    Navigator.of(this)
        .pushNamedAndRemoveUntil(newRoute, predicate, arguments: arguments);
  }

  void removeRoute(Route<dynamic> route) {
    Navigator.of(this).removeRoute(route);
  }

  void pop() {
    Navigator.of(this).pop();
  }
}

extension MediaQueryExtension on BuildContext {
  MediaQueryData get mediaQuery => MediaQuery.of(this);

  double get screenWidth => mediaQuery.size.width;
  double get screenHeight => mediaQuery.size.height;

  double get blockSizeHorizontal => screenWidth / 100;
  double get blockSizeVertical => screenHeight / 100;
}
