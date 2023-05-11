part of dash_chat;

class ChatInputToolbar extends StatelessWidget {
  final TextEditingController controller;
  final TextStyle? inputTextStyle;
  final InputDecoration? inputDecoration;
  final TextCapitalization? textCapitalization;
  final BoxDecoration? inputContainerStyle;
  final List<Widget> leading;
  final List<Widget> trailing;
  final int inputMaxLines;
  final int? maxInputLength;
  final bool alwaysShowSend;
  final ChatUser user;
  final Future<bool> Function(ChatMessage) onSend;
  final void Function(String) onTextChange;
  final bool inputDisabled;
  final String Function()? messageIdGenerator;
  final Widget Function(Function)? sendButtonBuilder;
  final Widget Function()? inputFooterBuilder;
  final bool showInputCursor;
  final double inputCursorWidth;
  final Color? inputCursorColor;
  final ScrollController? scrollController;
  final bool showTrailingBeforeSend;
  final FocusNode focusNode;
  final EdgeInsets inputToolbarPadding;
  final EdgeInsets inputToolbarMargin;
  final TextDirection textDirection;
  final bool sendOnEnter;
  final bool reverse;
  final TextInputAction? textInputAction;

  const ChatInputToolbar({
    Key? key,
    this.textDirection = TextDirection.ltr,
    required this.focusNode,
    this.scrollController,
    this.textInputAction,
    this.sendOnEnter = false,
    required this.onTextChange,
    this.inputDisabled = false,
    required this.controller,
    this.leading = const [],
    this.trailing = const [],
    this.inputDecoration,
    this.textCapitalization,
    this.inputTextStyle,
    this.inputContainerStyle,
    this.inputMaxLines = 1,
    this.showInputCursor = true,
    this.maxInputLength,
    this.inputCursorWidth = 2.0,
    this.inputCursorColor,
    required this.onSend,
    this.reverse = false,
    required this.user,
    this.alwaysShowSend = false,
    this.messageIdGenerator,
    this.inputFooterBuilder,
    this.sendButtonBuilder,
    this.showTrailingBeforeSend = true,
    this.inputToolbarPadding = const EdgeInsets.all(0.0),
    this.inputToolbarMargin = const EdgeInsets.all(0.0),
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: inputToolbarPadding,
      margin: inputToolbarMargin,
      decoration: inputContainerStyle ?? const BoxDecoration(color: Colors.white),
      child: Column(
        children: <Widget>[
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              ...leading,
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8.0),
                  child: Directionality(
                    textDirection: textDirection,
                    child: TextField(
                      focusNode: focusNode,
                      onChanged: (value) {
                        onTextChange(value);
                      },
                      onSubmitted: (value) {
                        if (sendOnEnter) {
                          _sendMessage(context);
                        }
                      },
                      textInputAction: textInputAction,
                      buildCounter: (
                        BuildContext context, {
                        int? currentLength,
                        int? maxLength,
                        bool? isFocused,
                      }) =>
                          null,
                      decoration: inputDecoration ??
                          const InputDecoration.collapsed(
                            hintText: '',
                            fillColor: Colors.white,
                          ),
                      textCapitalization: textCapitalization ?? TextCapitalization.none,
                      controller: controller,
                      style: inputTextStyle,
                      maxLength: maxInputLength,
                      minLines: 1,
                      maxLines: inputMaxLines,
                      showCursor: showInputCursor,
                      cursorColor: inputCursorColor,
                      cursorWidth: inputCursorWidth,
                      enabled: !inputDisabled,
                    ),
                  ),
                ),
              ),
              if (showTrailingBeforeSend) ...trailing,
              if (sendButtonBuilder != null)
                sendButtonBuilder!(() async => await _sendMessage(context))
              else
                IconButton(
                  icon: const Icon(Icons.send),
                  onPressed: alwaysShowSend || controller.text.isNotEmpty ? () => _sendMessage(context) : null,
                ),
              if (!showTrailingBeforeSend) ...trailing,
            ],
          ),
          if (inputFooterBuilder != null) inputFooterBuilder!()
        ],
      ),
    );
  }

  Future<void> _sendMessage(BuildContext context) async {
    if (controller.text.isEmpty) {
      return;
    }

    final message = ChatMessage(
      text: controller.text,
      user: user,
      messageIdGenerator: messageIdGenerator,
      createdAt: DateTime.now(),
    );

    final focusScope = FocusScope.of(context);
    final wasSent = await onSend(message);

    if(!wasSent){
      return;
    }

    onTextChange('');

    focusScope.requestFocus(focusNode);

    Timer(const Duration(milliseconds: 150), () {
      scrollController!.animateTo(
        reverse ? 0.0 : scrollController!.position.maxScrollExtent + 30.0,
        curve: Curves.easeOut,
        duration: const Duration(milliseconds: 300),
      );
    });
  }
}
