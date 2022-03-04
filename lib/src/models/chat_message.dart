part of dash_chat;

/// A message data structure used by dash chat to handle messages
/// and also to handle quick replies
class ChatMessage {
  /// Id of the message. If no id is supplied a new id is assigned
  /// using a [UUID v4]. This behaviour could be overridden by providing
  /// an optional parameter called [messageIdGenerator].
  /// [messageIdGenerator] take a function with
  /// signature [String Function()]
  String? id;

  /// Actual text message.
  String? text;

  /// It's a [non-optional] parameter which specifies the time the
  /// message was delivered takes a [DateTime] object.
  late DateTime createdAt;

  /// Takes a [ChatUser] object which is used to distinguish between
  /// users and also provide avatar URLs and name.
  late ChatUser user;

  /// A [non-optional] parameter which is used to display images
  /// takes a [String] as a url
  String? image;

  /// A [non-optional] parameter which is used to display video
  /// takes a [String] as a url
  String? video;

  /// A [non-optional] parameter which is used to show quick replies
  /// to the user
  QuickReplies? quickReplies;

  /// Allows to set custom-properties that could help with implementing custom
  /// functionality to dash chat.
  Map<String, dynamic>? customProperties;

  /// Allows to set buttons that could help with implementing custom
  /// actions in message container.
  List<Widget>? buttons;

  ChatMessage(
      {String? id,
      required this.text,
      required this.user,
      this.image,
      this.video,
      this.quickReplies,
      String Function()? messageIdGenerator,
      DateTime? createdAt,
      this.customProperties,
      this.buttons}) {
    this.createdAt = createdAt ?? DateTime.now();
    this.id = id ?? messageIdGenerator?.call() ?? const Uuid().v4().toString();
  }

  ChatMessage.fromJson(Map<dynamic, dynamic> json) {
    id = json['id'] as String?;
    text = json['text'] as String?;
    image = json['image'] as String?;
    video = json['video'] as String?;
    createdAt = DateTime.fromMillisecondsSinceEpoch(json['createdAt'] as int);
    user = ChatUser.fromJson(json['user'] as Map<String, dynamic>);
    quickReplies = json['quickReplies'] != null
      ? QuickReplies.fromJson(json['quickReplies'] as Map<String, dynamic>)
      : null;
    customProperties = json['customProperties'] as Map<String, dynamic>?;
  }

  Map<String, dynamic> toJson() => <String, dynamic>{
    'id': id,
    'text': text,
    'image': image,
    'video': video,
    'createdAt': createdAt.millisecondsSinceEpoch,
    'user': user.toJson(),
    'quickReplies': quickReplies?.toJson(),
    'customProperties': customProperties,
  };
}
