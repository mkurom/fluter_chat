import 'package:flutter/material.dart';

import 'application/pages/chat_page.dart';

class RootPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Flutter Chat Tutorial'),
      ),
      body: Center(
        child: OutlineButton(
          onPressed: () {
            Navigator.pushAndRemoveUntil(
                context,
                MaterialPageRoute(builder: (context) => ChatPage()),
                (_) => false);
          },
          child: Text('Move Chat Page'),
        ),
      ),
    );
  }
}
