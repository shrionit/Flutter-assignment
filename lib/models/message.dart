import 'package:flutter/cupertino.dart';
import 'package:flutter_assignment/models/user.dart';

class Message {
  final int msgId;
  final User sender;
  User to;
  final String msg;
  final String image;
  final String video;
  final String audio;
  String time;
  bool unread;

  Message({
    this.msgId,
    this.sender,
    this.msg,
    this.image,
    this.time,
    this.video,
    this.audio,
    this.unread = false,
    this.to,
  });
}

// CHATS ON HOME SCREEN
List<Message> chats = [
  Message(
    sender: james,
    time: '5:30 PM',
    msg: 'Hey, how\'s it going? What did you do today?',
    unread: true,
  ),
  Message(
    sender: olivia,
    time: '4:30 PM',
    msg: 'Hey, how\'s it going? What did you do today?',
    unread: true,
  ),
  Message(
    sender: john,
    time: '3:30 PM',
    msg: 'Hey, how\'s it going? What did you do today?',
    unread: false,
  ),
  Message(
    sender: sophia,
    time: '2:30 PM',
    msg: 'Hey, how\'s it going? What did you do today?',
    unread: true,
  ),
  Message(
    sender: steven,
    time: '1:30 PM',
    msg: 'Hey, how\'s it going? What did you do today?',
    unread: false,
  ),
  Message(
    sender: sam,
    time: '12:30 PM',
    msg: 'Hey, how\'s it going? What did you do today?',
    unread: false,
  ),
  Message(
    sender: greg,
    time: '11:30 AM',
    msg: 'Hey, how\'s it going? What did you do today?',
    unread: false,
  ),
];

genMessagesFor(User user) {
  return <Message>[
    Message(
      sender: currentUser,
      time: '2:30 PM',
      msg: 'Cool.',
      unread: true,
    ),
    Message(
      sender: currentUser,
      time: '3:15 PM',
      video: "assets/memes/meme.mp4",
      msg: 'yoda life',
      unread: true,
    ),
    Message(
      sender: user,
      time: '3:45 PM',
      audio: "assets/memes/sound.mp3",
      msg: 'Listen To This',
      unread: true,
    ),
    Message(
      sender: currentUser,
      time: 'Now',
      image: "assets/memes/meme.jpg",
      msg: 'Check This Out',
      unread: true,
    ),
  ];
}
