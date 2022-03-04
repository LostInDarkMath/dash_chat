part of dash_chat;

/// Avatar container for the the chat view uses a [CircleAvatar]
/// widget as default which can be overridden by providing
/// [avatarBuilder] property
class AvatarContainer extends StatelessWidget {
  /// A [ChatUser] object use to get the url of the user
  /// avatar
  final ChatUser user;

  /// [onPress] function take a function with this structure
  /// [Function(ChatUser)] will trigger when the avatar
  /// is tapped on
  final Function(ChatUser)? onPress;

  /// [onLongPress] function take a function with this structure
  /// [Function(ChatUser)] will trigger when the avatar
  /// is long pressed
  final Function(ChatUser)? onLongPress;

  /// [avatarBuilder] function take a function with this structure
  /// [Widget Function(ChatUser)] to build the avatar
  final Widget Function(ChatUser)? avatarBuilder;

  /// [constraints] to apply to build the layout
  /// by default used MediaQuery and take screen size as constants
  final BoxConstraints? constraints;

  final double? avatarMaxSize;

  const AvatarContainer({
    required this.user,
    this.onPress,
    this.onLongPress,
    this.avatarBuilder,
    this.constraints,
    this.avatarMaxSize,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final constraints = this.constraints ?? BoxConstraints(maxHeight: MediaQuery.of(context).size.height, maxWidth: MediaQuery.of(context).size.width);

    return GestureDetector(
      onTap: () => onPress?.call(user),
      onLongPress: () => onLongPress?.call(user),
      child: avatarBuilder != null
          ? avatarBuilder!(user)
          : Stack(
              alignment: Alignment.center,
              children: <Widget>[
                ClipOval(
                  child: Container(
                    height: constraints.maxWidth * 0.08,
                    width: constraints.maxWidth * 0.08,
                    constraints: BoxConstraints(
                      maxWidth: avatarMaxSize!,
                      maxHeight: avatarMaxSize!,
                    ),
                    color: Colors.grey,
                    child: Center(child: Text(user.name == null || user.name!.isEmpty ? '' : user.name![0])),
                  ),
                ),
                user.avatar != null && user.avatar!.isNotEmpty
                    ? Center(
                        child: ClipOval(
                          child: FadeInImage.memoryNetwork(
                            image: user.avatar!,
                            placeholder: kTransparentImage,
                            fit: BoxFit.cover,
                            height: constraints.maxWidth * 0.08,
                            width: constraints.maxWidth * 0.08,
                          ),
                        ),
                      )
                    : Container()
              ],
            ),
    );
  }
}
