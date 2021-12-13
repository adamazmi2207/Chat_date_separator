import 'package:chat_date_separator/chat_bubble.dart';
import 'package:chat_date_separator/model/dummy_chat_data.dart';
import 'package:chat_date_separator/util/date_util.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

/// MyApp class
class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: ChatPage(),
    );
  }
}

/// Chat Page widget class
class ChatPage extends StatelessWidget {
  ChatPage({Key? key}) : super(key: key);

  // Set dummy data
  // (usually you will get this data from your database using StreamBuilder etc.X)
  final chats = dummyChats;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Chat App'),
        backgroundColor: Colors.green[300],
      ),
      backgroundColor: Colors.green[50],
      body: _body(),
    );
  }

  /// Chat Screen Body widget
  Widget _body() {
    // Initially set tmpDate as one day from current date
    var tmpDate = DateUtil.tomorrow();

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8),
      child: Container(
        child: ListView.builder(
            itemCount: chats.length,
            shrinkWrap: true,
            physics: const ClampingScrollPhysics(),
            padding: const EdgeInsets.only(
              left: 10.0,
              right: 10.0,
              bottom: 70.0,
              top: 10.0,
            ),
            itemBuilder: (context, index) {
              final chat = chats[index];
              final createdAt = chat.createdAt;

              // we will use this variable to check it the current date is similar as previous date
              // set to false as default
              var isSameDate = false;

              // return True if is same date
              isSameDate = tmpDate.isSameDate(createdAt);

              // Show Date Separator widget if not same date (date changed)
              if (!isSameDate) {
                // Reset tmpDate with current message createdAt date
                tmpDate = createdAt;
              }

              final isMe = chat.sender == 'userA';
              final text = chat.text;
              final timestamp = DateUtil.hMMFormat(createdAt);
              final date = DateUtil.dateWithDayFormat(createdAt);

              // Pass these parameters to chat bubble widget
              final _chatBubble = ChatBubble(
                isMe: isMe,
                text: text,
                timestamp: timestamp,
                showDate: !isSameDate,
                date: date,
              );

              // return the chat bubble created above
              return _chatBubble;
            }),
      ),
    );
  }
}
