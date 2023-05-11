part of dash_chat;

/// Custom scroll behaviour for the the [ChatView].
class CustomScrollBehaviour extends ScrollBehavior {

  /// See also https://docs.flutter.dev/release/breaking-changes/3-3-deprecations
  @override
  Widget buildOverscrollIndicator(BuildContext context, Widget child, ScrollableDetails details) {
    return child;
  }
}
