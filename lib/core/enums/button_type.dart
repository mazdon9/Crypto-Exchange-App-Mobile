enum ButtonType {
  /// Default button: width 343, height 48, blue background, no theme support
  defaultNoTheme,

  /// Default button: width 188, height 48, blue background, with theme support
  defaultWithTheme,

  /// Secondary button: width 343, height 48, blue background, with theme support
  /// Used in setting_screen, maintains original color without theme changes
  secondaryWithTheme,
}

extension ButtonTypeExtension on ButtonType {
  double get width {
    switch (this) {
      case ButtonType.defaultNoTheme:
      case ButtonType.secondaryWithTheme:
        return 343;
      case ButtonType.defaultWithTheme:
        return 188;
    }
  }

  double get height {
    switch (this) {
      case ButtonType.defaultNoTheme:
      case ButtonType.defaultWithTheme:
      case ButtonType.secondaryWithTheme:
        return 48;
    }
  }

  bool get useTheme {
    switch (this) {
      case ButtonType.defaultNoTheme:
        return false;
      case ButtonType.defaultWithTheme:
      case ButtonType.secondaryWithTheme:
        return true;
    }
  }

  bool get isSecondary {
    switch (this) {
      case ButtonType.defaultNoTheme:
      case ButtonType.defaultWithTheme:
        return false;
      case ButtonType.secondaryWithTheme:
        return true;
    }
  }
}
