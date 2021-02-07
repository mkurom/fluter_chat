import 'package:flutter/material.dart';
// import 'package:provider/provider.dart';

import 'package:flutter_chat/application/widgets/message_card.dart';
import 'package:flutter_chat/application/widgets/text_form.dart';
import 'package:flutter_chat/domain/model/message_model.dart';
import 'package:flutter_chat/infrastructure/datasource/firebase_firestore_datasource.dart';

class ChatPage extends StatefulWidget {
  @override
  _ChatPageState createState() => _ChatPageState();
}

class _ChatPageState extends State<ChatPage> {
  List<MessageModel> chatMessageList = [];

  void updateList() {
    setState(() {});
  }

  @override
  void initState() {
    super.initState();

    fetchData();
  }

  void fetchData() async {
    chatMessageList = await FirebaseFirestoreDatasource().fetchData();
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        title: Text('チャット'),
      ),
      body: SafeArea(
        child: Stack(
          children: <Widget>[
            SizedBox(
              height: MediaQuery.of(context).size.height - 200,
              child: SingleChildScrollView(
                child: ListView.builder(
                  shrinkWrap: true,
                  physics: NeverScrollableScrollPhysics(),
                  itemCount: chatMessageList.length,
                  itemBuilder: (BuildContext context, int i) {
                    return MessageCard(chatMessageList[i]);
                  },
                ),
              ),
            ),
            ChatTextForm(chatMessageList, updateList),
          ],
        ),
      ),
    );
  }
}
