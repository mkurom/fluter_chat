import 'package:flutter/material.dart';

import 'package:flutter_chat/application/widgets/text_form.dart';

// import 'infrastructure/firebaseManager.dart';

class ChatPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('チャット'),
        ),
        body: Stack(
          alignment: Alignment.bottomCenter,
          children: <Widget>[
            Center(
              child: Text("sample"),
            ),
            ChatTextForm(),
            //~入力フォームと送信ボタンのウィジェット~
          ],
        ));
  }
}
