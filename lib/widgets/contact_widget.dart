import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_assignment/models/user.dart';
import 'package:google_fonts/google_fonts.dart';

class Contact extends StatefulWidget {
  Contact({Key key, this.user}) : super(key: key);
  final User user;
  @override
  _ContactState createState() => _ContactState();
}

class _ContactState extends State<Contact> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 0.0, vertical: 8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Container(
            width: MediaQuery.of(context).size.width * 0.20,
            child: Center(
              child: CircleAvatar(
                radius: 36,
                backgroundColor: Theme.of(context).primaryColor,
                child: CircleAvatar(
                  radius: 34.0,
                  backgroundImage: NetworkImage(widget.user.avatar),
                ),
              ),
            ),
          ),
          Container(
            width: MediaQuery.of(context).size.width * 0.75,
            padding: EdgeInsets.symmetric(horizontal: 1.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  '${widget.user.name}',
                  style: GoogleFonts.varela(
                    textStyle: TextStyle(
                      color: Theme.of(context).accentColor,
                      fontSize: 20.0,
                      letterSpacing: 0.5,
                    ),
                  ),
                ),
                Text(
                  'Hey, Wassup ??',
                  style: GoogleFonts.varela(
                    textStyle: TextStyle(
                      color: Theme.of(context).accentColor,
                      fontSize: 14.0,
                      letterSpacing: 0.5,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
