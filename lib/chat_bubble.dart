import 'package:flutter/material.dart';

/// Chat Bubble widget class
class ChatBubble extends StatelessWidget {
  /// consctructor
  const ChatBubble(
      {Key? key,
      required this.isMe,
      required this.text,
      required this.timestamp,
      required this.showDate,
      required this.date})
      : super(key: key);

  // return true if the chat sender is the user
  final bool isMe;

  // chat text message
  final String text;

  // chat timestamp value
  final String timestamp;

  // return true if should show date widget
  final bool showDate;

  // chat date value
  final String date;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(12),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          // show Date Separator widget if True
          if (showDate) _dateSeparator(context, date),

          _bubbleRow(context),
        ],
      ),
    );
  }

  // Chat bubble row widget
  Row _bubbleRow(BuildContext context) {
    return Row(
      // align chat bubble to left side if is User, else align to right side
      mainAxisAlignment: isMe ? MainAxisAlignment.end : MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        // if is User, show timestamp widget on left side
        if (isMe) _timestamp(context),

        // text bubble widget
        _textBubble(context),

        // if is not User, show timestamp widget on right side
        if (!isMe) _timestamp(context),
      ],
    );
  }

  /// Text Bubble widget
  Widget _textBubble(BuildContext context) {
    return Flexible(
      child: Container(
        // make the maximum width of the chat bubble 0.74 of screen width
        constraints:
            BoxConstraints(maxWidth: MediaQuery.of(context).size.width * 0.74),
        child: Container(
          padding: const EdgeInsets.all(16),
          decoration: BoxDecoration(
            // if is User, set bubble color to white, else set to green
            color: isMe ? Colors.white : Colors.green[400],

            // Change bubble border radius based on chat sender
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

          // use SelectableText widget instead of a nornaml Text widget so that we can select and copy the text (optional)
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
    );
  }

  /// Chat Bubble Timestamp widget
  Widget _timestamp(BuildContext context) {
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
            ),
          ),
        ],
      ),
    );
  }

  /// Date Separator widget
  Widget _dateSeparator(BuildContext context, String date) {
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
              ),
            ),
          ),
        ],
      ),
    );
  }
}
