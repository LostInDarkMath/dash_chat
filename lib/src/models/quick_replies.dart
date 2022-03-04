part of dash_chat;

/// Quick replies will contain all the replies that should
/// be shown to the user
class QuickReplies {
  /// [List] of replies that will be shown to the user
  List<Reply>? values;

  /// Should the quick replies be dismissible or persist
  bool? keepIt;

  QuickReplies({
    this.keepIt,
    this.values = const <Reply>[],
  });

  QuickReplies.fromJson(Map<dynamic, dynamic> json) {
    keepIt = json['keepIt'] as bool?;
    values = [for(var x in json['values'] as List<dynamic>? ?? <dynamic>[]) Reply.fromJson(x as Map<String, dynamic>)];
  }

  Map<String, dynamic> toJson() => <String, dynamic>{
    'keepIt': keepIt,
    'values': values!.map((e) => e.toJson()).toList(),
  };
}
