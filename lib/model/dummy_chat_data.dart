import 'package:chat_date_separator/model/chat.dart';

final now = DateTime.now();
List<Chat> dummyChats = [
  Chat(
    created: now,
    text: 'Text1',
    textUser: 'userA',
  ),
  Chat(
    created: now,
    text: 'Text2',
    textUser: 'userA',
  ),
  Chat(
    created: now.add(Duration(minutes: 1)),
    text: 'Text3',
    textUser: 'userB',
  ),
  Chat(
    created: now.add(Duration(minutes: 1)),
    text: 'Text4',
    textUser: 'userA',
  ),
  Chat(
    created: now.add(Duration(days: 1, minutes: 5)),
    text: 'Text5',
    textUser: 'userB',
  ),
  Chat(
    created: now.add(Duration(days: 1, minutes: 6)),
    text: 'Text6',
    textUser: 'userA',
  ),
  Chat(
    created: now.add(Duration(days: 2, minutes: 6)),
    text: 'Text7',
    textUser: 'userA',
  ),
  Chat(
    created: now.add(Duration(days: 2, minutes: 10)),
    text: 'Text8',
    textUser: 'userA',
  ),
  Chat(
    created: now.add(Duration(days: 3, minutes: 90)),
    text: 'Text9',
    textUser: 'userB',
  ),
  Chat(
    created: now.add(Duration(days: 3, minutes: 90)),
    text: 'Text10',
    textUser: 'userA',
  ),
  Chat(
    created: now.add(Duration(days: 4, minutes: 100)),
    text: 'Text11',
    textUser: 'userB',
  ),
];
