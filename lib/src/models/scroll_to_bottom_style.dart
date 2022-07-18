part of dash_chat;

class ScrollToBottomStyle {
  /// Background color of the scrollToBottom widget
  ///
  /// Defaults to theme accent color
  final Color? backgroundColor;

  /// Text/ Icon color for scrollToBottom widget
  ///
  /// Defaults to white
  final Color? textColor;

  /// Height of the scrollToBottom widget
  ///
  /// Defaults to `45.0`
  final double height;

  /// Width of the scrollToBottom widget
  ///
  /// Defaults to `45.0`
  final double width;

  /// Top absolute position of the widget
  ///
  /// Defaults to 0.0
  final double? top;

  /// Left absolute position of the widget
  ///
  /// Defaults to 0.0
  final double? left;

  /// Right absolute position of the widget
  ///
  /// Defaults to 20.0
  final double right;

  /// Bottom absolute position of the widget
  ///
  /// Defaults to 60.0
  final double bottom;

  /// Icon inside the widget
  ///
  /// Defaults to material icon -> `keyboard_arrow_down`
  final IconData? icon;

  const ScrollToBottomStyle({
    this.backgroundColor,
    this.textColor,
    this.bottom = 70.0,
    this.left,
    this.right = 20.0,
    this.top,
    this.height = 45.0,
    this.width = 45.0,
    this.icon,
  });
}
