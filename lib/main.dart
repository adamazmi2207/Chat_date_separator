import 'package:chat_date_separator/model/chat.dart';
import 'package:chat_date_separator/model/dummy_chat_data.dart';
import 'package:chat_date_separator/util/date_util.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: ChatPage(),
    );
  }
}

class ChatPage extends StatelessWidget {
  ChatPage({Key? key}) : super(key: key);

  final chats = dummyChats;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Chat Page'),
        backgroundColor: Colors.green[300],
      ),
      backgroundColor: Colors.green[50],
      body: _body(),
    );
  }

  Widget _body() {
    var tmpDate = DateUtil.checkIfTomorrow();
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8),
      child: Container(
        child: ListView.builder(
            itemCount: chats.length,
            shrinkWrap: true,
            physics: const ClampingScrollPhysics(),
            padding: const EdgeInsets.only(
                left: 10.0, right: 10.0, bottom: 70.0, top: 10.0),
            itemBuilder: (context, index) {
              final chat = chats[index];
              final createdAt = chat.created;

              var isSameDate = false;
              isSameDate = tmpDate.isSameDate(createdAt);

              debugPrint('isSameDate = $isSameDate');

              // 同じ日ではなければ表示
              if (!isSameDate) {
                tmpDate = createdAt;
              }

              final isMe = chat.textUser == 'userA';
              final text = chat.text;
              final timestamp = DateUtil.hMMFormat(createdAt);
              final date = DateUtil.dateWithDayFormat(createdAt);

              final _messageBubble = ChatBubble(
                isMe: isMe,
                text: text,
                timestamp: timestamp,
                showDate: !isSameDate,
                date: date,
              );
              return _messageBubble;
            }),
      ),
    );
  }
}

class ChatBubble extends StatelessWidget {
  const ChatBubble(
      {Key? key,
      required this.isMe,
      required this.text,
      required this.timestamp,
      required this.showDate,
      required this.date})
      : super(key: key);

  final bool isMe;
  final String text;
  final String timestamp;
  final bool showDate;
  final String date;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(12),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          if (showDate) _dateDivider(context, date),
          Row(
            mainAxisAlignment:
                isMe ? MainAxisAlignment.end : MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              if (isMe) _chatBubbleSideArea(context),
              _textBubble(context),
              if (!isMe) _chatBubbleSideArea(context),
            ],
          ),
        ],
      ),
    );
  }

  Widget _textBubble(BuildContext context) {
    return Flexible(
      child: Container(
        constraints:
            BoxConstraints(maxWidth: MediaQuery.of(context).size.width * 0.74),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment:
              isMe ? CrossAxisAlignment.end : CrossAxisAlignment.start,
          children: [
            Flexible(
              child: Container(
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: isMe ? Colors.white : Colors.green[400],
                  borderRadius: BorderRadius.only(
                    bottomRight: isMe ? Radius.zero : const Radius.circular(20),
                    topLeft: const Radius.circular(20),
                    bottomLeft: isMe ? const Radius.circular(20) : Radius.zero,
                    topRight: const Radius.circular(20),
                  ),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.5),
                      blurRadius: 3,
                      offset: const Offset(0, 1),
                    ),
                  ],
                ),
                child: SelectableText(
                  text,
                  toolbarOptions: const ToolbarOptions(
                    copy: true,
                    selectAll: true,
                    cut: false,
                    paste: false,
                  ),
                  style: TextStyle(
                    color: isMe ? Colors.black54 : Colors.white,
                    fontSize: 16.0,
                    fontWeight: FontWeight.w300,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  /// Chat bubble side area widget (timestamp, delete button)
  Widget _chatBubbleSideArea(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10.0),
      child: Column(
        children: [
          const SizedBox(height: 4),
          Text(
            timestamp,
            style: const TextStyle(
              fontSize: 10.0,
              color: Colors.black54,
              // fontFamily:
            ),
          ),
        ],
      ),
    );
  }

  Widget _dateDivider(BuildContext context, String date) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 16.0),
      child: Stack(
        children: [
          const Divider(),
          Center(
            child: Container(
                height: 20,
                padding: const EdgeInsets.symmetric(horizontal: 16.0),
                color: Colors.green[50],
                child: Text(
                  date,
                  style: TextStyle(
                    color: Colors.black45,
                    fontSize: 12.0,
                  ),
                )),
          ),
        ],
      ),
    );
  }
}
