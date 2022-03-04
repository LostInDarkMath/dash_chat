part of dash_chat;

/// Used for providing replies in quick replies
class Reply {
  /// Message shown to the user
  late String title;

  /// Actual value underneath the message
  /// It's an optional parameter
  String? value;

  /// If no messageId is provided it will use [UUID v4] to
  /// set a default id for that message
  dynamic messageId;

  Reply({
    required this.title,
    String? messageId,
    this.value,
  }) {
    this.messageId = messageId ?? const Uuid().v4().toString();
  }

  Reply.fromJson(Map<dynamic, dynamic> json) {
    title = json['title'] as String;
    value = json['value'] as String?;
    messageId = json['messageId'];
  }

  Map<String, dynamic> toJson() => <String, dynamic>{
    'messageId': messageId,
    'title': title,
    'value': value,
  };
}
