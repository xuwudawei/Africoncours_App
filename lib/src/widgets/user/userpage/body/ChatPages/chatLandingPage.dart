import 'package:flutter/material.dart';
import '../ChatPages/ui/screens/screens.dart';

class ChatLanding extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MessageHomeScreen(),
      routes: {
        'chat': (ctx) => ChatScreen(),
      },
    );
  }
}
