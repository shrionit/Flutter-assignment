import 'package:flutter/material.dart';
import 'package:flutter_assignment/screens/home_screen.dart';
import 'package:google_fonts/google_fonts.dart';

void main() {
  runApp(ChatApp());
}

class ChatApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Chat App',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primaryColor: Colors.blue,
        brightness: Brightness.light,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      darkTheme: ThemeData(
        visualDensity: VisualDensity.adaptivePlatformDensity,
        brightness: Brightness.dark,
        scaffoldBackgroundColor: Color.fromARGB(255, 20, 20, 30),
        primaryColor: Colors.indigo[800],
        primaryColorDark: Color.fromARGB(255, 8, 9, 10),
        accentColor: Colors.white38,
      ),
      themeMode: ThemeMode.dark,
      home: HomeScreen(),
    );
  }
}
