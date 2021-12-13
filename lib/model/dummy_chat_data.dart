import 'package:chat_date_separator/model/chat.dart';

// set current date & time
final now = DateTime.now();

// Dummy data: List of Chats
List<Chat> dummyChats = [
  Chat(
    createdAt: now,
    text: 'Text1Text1Text1Text1',
    sender: 'userA',
  ),
  Chat(
    createdAt: now,
    text: 'Text2Text2Text2Text2',
    sender: 'userA',
  ),
  Chat(
    createdAt: now.add(Duration(minutes: 1)),
    text: 'Text3Text3Text3Text3',
    sender: 'userB',
  ),
  Chat(
    createdAt: now.add(Duration(minutes: 1)),
    text: 'Text4',
    sender: 'userA',
  ),
  Chat(
    createdAt: now.add(Duration(days: 1, minutes: 5)),
    text: 'Text5',
    sender: 'userB',
  ),
  Chat(
    createdAt: now.add(Duration(days: 1, minutes: 6)),
    text: 'Text6',
    sender: 'userA',
  ),
  Chat(
    createdAt: now.add(Duration(days: 2, minutes: 6)),
    text: 'Text7',
    sender: 'userA',
  ),
  Chat(
    createdAt: now.add(Duration(days: 2, minutes: 10)),
    text: 'Text8',
    sender: 'userA',
  ),
  Chat(
    createdAt: now.add(Duration(days: 3, minutes: 90)),
    text: 'Text9',
    sender: 'userB',
  ),
  Chat(
    createdAt: now.add(Duration(days: 3, minutes: 90)),
    text: 'Text10',
    sender: 'userA',
  ),
  Chat(
    createdAt: now.add(Duration(days: 4, minutes: 100)),
    text: 'Text11',
    sender: 'userB',
  ),
];
