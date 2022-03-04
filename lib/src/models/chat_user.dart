part of dash_chat;

/// ChatUser used to show distinguish between different people
/// in a chat conversation or a chat group
class ChatUser {
  /// Unique id of the user if no unique is provided a [UUID v4]
  /// is automatically assigned to the chat user.
  String? uid;

  /// An [optional] parameter to set the user name.
  String? name;

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

  /// Allows to set custom-properties that could help with implementing custom
  /// functionality to dash chat.
  Map<String, dynamic>? customProperties;

  ChatUser({
    String? uid,
    String? name,
    this.avatar,
    this.containerColor,
    this.color,
    this.customProperties,
    this.firstName,
    this.lastName,
  }) {
    this.name = name ?? '$firstName $lastName';
    this.uid = uid ?? const Uuid().v4().toString();
  }

  ChatUser.fromJson(Map<dynamic, dynamic> json) {
    final pName = json['name'] as String?;

    uid = json['uid'] as String?;
    name = pName ?? '$firstName $lastName';
    firstName = json['firstName'] as String?;
    lastName = json['lastName'] as String?;
    avatar = json['avatar'] as String?;
    containerColor = json['containerColor'] != null ? Color(json['containerColor'] as int) : null;
    color = json['color'] != null ? Color(json['color'] as int) : null;
    customProperties = json['customProperties'] as Map<String, dynamic>?;
  }

  Map<String, dynamic> toJson() => <String, dynamic>{
    'uid': uid,
    'name': name,
    'firstName': firstName,
    'lastName': lastName,
    'avatar': avatar,
    'containerColor': containerColor != null ? containerColor!.value : null,
    'color': color != null ? color!.value : null,
    'customProperties': customProperties,
  };
}
