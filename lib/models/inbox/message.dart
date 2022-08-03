import 'package:vrent/models/inbox/sender.dart';

class Message{
  final Sender? sender;
  final String? time;
  final String? text;
  final bool? unread;

  Message({this.sender, this.time, this.text, this.unread});

}

List<Message> chats=[
  Message(
    sender: dummyUser1,
    text: "Hey! how are you doing?",
    time: "10:20 am",
    unread: false,
  ),

  Message(
    sender: dummyUser2,
    text: "I am good! what about you",
    time: "10:24 am",
    unread: false,
  ),

  Message(
    sender: dummyUser3,
    text: "Lets have a meetup at 9'o clock",
    time: "1:00 pm",
    unread: true,
  )

];