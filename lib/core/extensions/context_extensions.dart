import 'package:flutter/material.dart';

/// context extensions based on BuildContext
extension ContextExtensions on BuildContext {
  /// screen width
  double get screenWidth => MediaQuery.of(this).size.width;

  /// screen height
  double get screenHeight => MediaQuery.of(this).size.height;

  /// Theme
  ThemeData get theme => Theme.of(this);
}
