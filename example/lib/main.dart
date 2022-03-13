import 'package:flutter/material.dart';
import 'package:dash_chat/dash_chat.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final ChatUser user = ChatUser(
    name: "Albert",
    uid: "123456789",
    avatar: "https://pickaface.net/gallery/avatar/unr_sample_161118_2054_ynlrg.png",
  );

  final ChatUser otherUser = ChatUser(
    name: "Steven",
    uid: "25649654",
  );

  final messages = <ChatMessage>[];

  Future<bool> onSend(ChatMessage message) async {
    messages.add(message);
    messages.add(ChatMessage(
      text: 'Hey :)',
      user: otherUser,
    ));
    return true; // tell the library that sending was successful
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Chat app'),
      ),
      body: DashChat(
        onSend: onSend,
        user: user,
        messages: messages,
      ),
    );
  }
}
