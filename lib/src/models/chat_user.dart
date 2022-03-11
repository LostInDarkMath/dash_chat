part of dash_chat;

/// ChatUser used to show distinguish between different people
/// in a chat conversation or a chat group
class ChatUser {
  /// Unique id of the user if no unique is provided a [UUID v4]
  /// is automatically assigned to the chat user.
  String uid;

  /// An [optional] parameter to set the user name.
  String name;

  /// An [optional] parameter to set the user first name, if set will override the name property.
  String? firstName;

  /// An [optional] parameter to set the user last name, if set will override the name property.
  String? lastName;

  /// An [optional] parameter to set the user avatar.
  String? avatar;

  /// An [optional] parameter to set Text Color
  Color? color;

  /// An [optional] parameter to set The Message bubble Color
  Color? containerColor;

  /// An optional [DateTime] that indicates when the user was last online.
  DateTime? lastOnline;

  /// Allows to set custom-properties that could help with implementing custom
  /// functionality to dash chat.
  Map<String, dynamic> customProperties;

  ChatUser({
    String? uid,
    required this.name,
    this.avatar,
    this.containerColor,
    this.color,
    this.customProperties = const <String, dynamic>{},
    this.firstName,
    this.lastName,
    this.lastOnline,
  }):
    uid = uid ?? const Uuid().v4().toString()
  ;

  ChatUser.fromJson(Map<dynamic, dynamic> json):
    uid = json['uid'] as String,
    name = json['name'] as String,
    firstName = json['firstName'] as String?,
    lastName = json['lastName'] as String?,
    avatar = json['avatar'] as String?,
    containerColor = json['containerColor'] != null ? Color(json['containerColor'] as int) : null,
    color = json['color'] != null ? Color(json['color'] as int) : null,
    lastOnline = json['lastOnline'] != null ? DateTime.fromMillisecondsSinceEpoch(json['lastOnline'] as int) : null,
    customProperties = json['customProperties'] as Map<String, dynamic>? ?? <String, dynamic>{}
  ;

  Map<String, dynamic> toJson() => <String, dynamic>{
    'uid': uid,
    'name': name,
    'firstName': firstName,
    'lastName': lastName,
    'avatar': avatar,
    'containerColor': containerColor != null ? containerColor!.value : null,
    'lastOnline': lastOnline?.millisecondsSinceEpoch,
    'color': color != null ? color!.value : null,
    'customProperties': customProperties,
  };
}
