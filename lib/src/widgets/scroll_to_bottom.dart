part of dash_chat;

class ScrollToBottom extends StatelessWidget {
  final Function? onScrollToBottomPress;
  final ScrollController scrollController;
  final bool inverted;
  final ScrollToBottomStyle scrollToBottomStyle;

  const ScrollToBottom({
    this.onScrollToBottomPress,
    required this.scrollController,
    required this.inverted,
    required this.scrollToBottomStyle,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: scrollToBottomStyle.width,
      height: scrollToBottomStyle.height,
      child: RawMaterialButton(
        elevation: 5,
        fillColor: scrollToBottomStyle.backgroundColor ?? Theme.of(context).primaryColor,
        shape: const CircleBorder(),
        child: Icon(
          scrollToBottomStyle.icon ?? Icons.keyboard_arrow_down,
          color: scrollToBottomStyle.textColor ?? Colors.white,
        ),
        onPressed: () {
          onScrollToBottomPress?.call() ??
              scrollController.animateTo(
                inverted ? 0.0 : scrollController.position.maxScrollExtent + 25.0,
                duration: const Duration(milliseconds: 300),
                curve: Curves.easeInOut,
              );
        },
      ),
    );
  }
}
