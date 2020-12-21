import 'package:flutter/material.dart';
import 'package:flutter_assignment/models/message.dart';
import 'package:flutter_assignment/models/user.dart';
import 'package:flutter_assignment/widgets/audio_player.dart';
import 'package:flutter_assignment/widgets/video_player.dart';
import 'package:google_fonts/google_fonts.dart';

class ChatScreen extends StatefulWidget {
  ChatScreen({Key key, this.chatuser}) : super(key: key);
  final User chatuser;
  @override
  _ChatScreenState createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  final GlobalKey<AnimatedListState> _listKey = GlobalKey();
  bool _playAudio = false;
  List<Message> messages;
  final msgController = TextEditingController();

  @override
  void initState() {
    super.initState();
    messages = genMessagesFor(widget.chatuser);
  }

  _sendMessage() {
    if (msgController.text.length > 0) {
      setState(() {
        messages.insert(
          0,
          Message(
            msg: msgController.text,
            time: "Now",
            sender: currentUser,
            to: widget.chatuser,
            image: "assets/memes/meme.jpg",
          ),
        );
        _listKey.currentState
            .insertItem(0, duration: Duration(milliseconds: 785));
        msgController.text = "";
      });
    }
  }

  _buildItem(message, isMe, animation) {
    return Padding(
      padding: const EdgeInsets.all(2.0),
      child: FadeTransition(
        opacity: animation,
        child: FadeTransition(
          opacity: animation,
          child: _msgView(message, isMe),
        ),
      ),
    );
  }

  _msgView(Message message, bool isMe) {
    final Container msg = Container(
      margin: isMe
          ? EdgeInsets.fromLTRB(
              80.0,
              8.0,
              8.0,
              8.0,
            )
          : EdgeInsets.fromLTRB(
              8.0,
              8.0,
              80.0,
              8.0,
            ),
      padding: EdgeInsets.symmetric(horizontal: 20.0, vertical: 15.0),
      constraints: BoxConstraints(
        maxWidth: MediaQuery.of(context).size.width * 0.75,
      ),
      decoration: BoxDecoration(
          color: Colors.black,
          border: Border.all(
            color: isMe
                ? Theme.of(context).primaryColor
                : Theme.of(context).accentColor,
          ),
          boxShadow: <BoxShadow>[
            BoxShadow(
              color: isMe
                  ? Theme.of(context).primaryColor
                  : Theme.of(context).accentColor,
              spreadRadius: 2,
              blurRadius: 5.0,
            )
          ],
          borderRadius: BorderRadius.all(
            Radius.circular(15.0),
          )),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: (message.image != null
            ? <Widget>[
                Align(
                    alignment: Alignment.center,
                    child: Image.asset(
                      message.image,
                      width: MediaQuery.of(context).size.width * 0.6,
                      height: MediaQuery.of(context).size.width * 0.6,
                    )),
                SizedBox(height: 8.0),
                Align(
                  alignment: isMe ? Alignment.topRight : Alignment.topLeft,
                  child: Text(
                    message.msg,
                    style: TextStyle(
                      color: Colors.blueGrey,
                      fontSize: 16.0,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
                SizedBox(height: 8.0),
                Align(
                  alignment:
                      isMe ? Alignment.bottomRight : Alignment.bottomLeft,
                  child: Text(
                    message.time,
                    style: TextStyle(
                      color: Colors.grey[800],
                      fontSize: 16.0,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
              ]
            : message.video != null
                ? <Widget>[
                    Align(
                      alignment: Alignment.center,
                      child: AssetVideoPlayer(videosrc: message.video),
                    ),
                    Align(
                      alignment: isMe ? Alignment.topRight : Alignment.topLeft,
                      child: Text(
                        message.msg,
                        style: TextStyle(
                          color: Colors.blueGrey,
                          fontSize: 16.0,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                    SizedBox(height: 8.0),
                    Align(
                      alignment:
                          isMe ? Alignment.bottomRight : Alignment.bottomLeft,
                      child: Text(
                        message.time,
                        style: TextStyle(
                          color: Colors.grey[800],
                          fontSize: 16.0,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                  ]
                : message.audio != null
                    ? <Widget>[
                        AssetAudioPlayer(audiosrc: message.audio),
                        Align(
                          alignment:
                              isMe ? Alignment.topRight : Alignment.topLeft,
                          child: Text(
                            message.msg,
                            style: TextStyle(
                              color: Colors.blueGrey,
                              fontSize: 16.0,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ),
                        SizedBox(height: 8.0),
                        Align(
                          alignment: isMe
                              ? Alignment.bottomRight
                              : Alignment.bottomLeft,
                          child: Text(
                            message.time,
                            style: TextStyle(
                              color: Colors.grey[800],
                              fontSize: 16.0,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ),
                      ]
                    : <Widget>[
                        Align(
                          alignment:
                              isMe ? Alignment.topRight : Alignment.topLeft,
                          child: Text(
                            message.msg,
                            style: TextStyle(
                              color: Colors.blueGrey,
                              fontSize: 16.0,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ),
                        SizedBox(height: 8.0),
                        Align(
                          alignment: isMe
                              ? Alignment.bottomRight
                              : Alignment.bottomLeft,
                          child: Text(
                            message.time,
                            style: TextStyle(
                              color: Colors.grey[800],
                              fontSize: 16.0,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ),
                      ]),
      ),
    );
    if (isMe) {
      return msg;
    }
    return Row(
      children: <Widget>[
        msg,
      ],
    );
  }

  _messageBuilder() {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 8.0),
      height: 70.0,
      color: Colors.black87,
      child: Row(
        children: <Widget>[
          IconButton(
            icon: Icon(Icons.photo),
            iconSize: 25.0,
            color: Theme.of(context).primaryColor,
            onPressed: () {},
          ),
          Expanded(
            child: TextField(
              textCapitalization: TextCapitalization.sentences,
              controller: msgController,
              decoration: InputDecoration.collapsed(
                hintText: 'Send a message...',
              ),
            ),
          ),
          IconButton(
            icon: Icon(Icons.send),
            iconSize: 25.0,
            color: Theme.of(context).primaryColor,
            onPressed: () {
              _sendMessage();
            },
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).primaryColor,
      appBar: AppBar(
        leading: IconButton(
            icon: Icon(Icons.arrow_back_ios),
            onPressed: () {
              Navigator.pop(context);
            }),
        title: Text(
          widget.chatuser.name,
          style: GoogleFonts.varelaRound(
            fontSize: 34.0,
          ),
        ),
        elevation: 0.0,
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.phone),
            iconSize: 30.0,
            color: Colors.white,
            onPressed: () {},
          ),
          IconButton(
            icon: Icon(Icons.videocam),
            iconSize: 30.0,
            color: Colors.white,
            onPressed: () {},
          ),
          IconButton(
            icon: Icon(Icons.more_vert),
            iconSize: 30.0,
            color: Colors.white,
            onPressed: () {},
          ),
        ],
      ),
      body: GestureDetector(
        onTap: () => FocusScope.of(context).unfocus(),
        child: Column(
          children: <Widget>[
            Expanded(
              child: Container(
                decoration: BoxDecoration(
                  color: Theme.of(context).scaffoldBackgroundColor,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(30.0),
                    topRight: Radius.circular(30.0),
                  ),
                ),
                child: ClipRRect(
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(30.0),
                    topRight: Radius.circular(30.0),
                  ),
                  child: AnimatedList(
                    reverse: true,
                    key: _listKey,
                    initialItemCount: messages.length,
                    itemBuilder: (context, index, animation) {
                      final Message message = messages[index];
                      final bool isMe =
                          message.sender.userId == currentUser.userId;
                      return _buildItem(message, isMe, animation);
                    },
                  ),
                  // child: AnimationLimiter(
                  //   child: ListView.builder(
                  //     reverse: true,
                  //     itemCount: messages.length,
                  //     itemBuilder: (BuildContext context, int index) {
                  //       final Message message = messages[index];
                  //       final bool isMe =
                  //           message.sender.userId == currentUser.userId;
                  //       return AnimationConfiguration.staggeredList(
                  //         position: index,
                  //         duration: Duration(milliseconds: 785),
                  //         child: SlideAnimation(
                  //           verticalOffset: 50.0,
                  //           child: FadeInAnimation(
                  //             child: _msgView(message, isMe),
                  //           ),
                  //         ),
                  //       );
                  //     },
                  //   ),
                  // ),
                ),
              ),
            ),
            _messageBuilder(),
          ],
        ),
      ),
    );
  }
}
