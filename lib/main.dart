import 'package:flutter/material.dart';

import 'package:flutter_chat/chat.dart';

import 'package:flutter_chat/utils/loading.dart';
import 'infrastructure/firebaseManager.dart';

void main() {
  runApp(App());
}

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: FutureBuilder(
        future: FirebaseManager().initialize(),
        builder: (context, snapshot) {
          if (snapshot.hasError) {
            return Container(
              color: Colors.white,
            );
          }
          if (snapshot.connectionState == ConnectionState.done) {
            if (FirebaseManager().signInAnonymous() != "not user") {
              return ChatPage();
            } else {}
          }
          return Loading();
        },
      ),
    );
  }
}
