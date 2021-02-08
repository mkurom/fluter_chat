import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

import 'package:flutter_chat/utils/loading.dart';

import 'package:flutter_chat/application/widgets/message_card.dart';
import 'package:flutter_chat/application/widgets/text_form.dart';
import 'package:flutter_chat/domain/model/message_model.dart';
import 'package:flutter_chat/infrastructure/datasource/firebase_firestore_datasource.dart';

class ChatModel extends ChangeNotifier {
  List<MessageModel> _chatMessageList = [];

  void setData(MessageModel messsageModel) {
    _chatMessageList.add(messsageModel);
    notifyListeners();
  }
}

class ChatPage extends StatelessWidget {
  final ChatModel _chatModel = ChatModel();

  @override
  Widget build(BuildContext context) {
    initializeDateFormatting("ja_JP");
    return ChangeNotifierProvider<ChatModel>.value(
      value: _chatModel,
      child: Scaffold(
        appBar: AppBar(
          title: Text('チャット'),
        ),
        body: SingleChildScrollView(
          child: Center(
            child: Column(
              children: [
                SizedBox(
                  height: MediaQuery.of(context).size.height - 200,
                  child: StreamBuilder<QuerySnapshot>(
                      stream: FirebaseFirestoreDatasource().fetchSnapshot(),
                      builder: (BuildContext context,
                          AsyncSnapshot<QuerySnapshot> snapshot) {
                        if (!snapshot.hasData) {
                          return Loading();
                        } else {
                          _chatModel._chatMessageList = [];
                          for (var i = 0; i < snapshot.data.docs.length; i++) {
                            MessageModel model = MessageModel(
                              avatarUrl: snapshot.data.docs[i]["avatarUrl"],
                              name: snapshot.data.docs[i]["name"],
                              datetime: DateTime.parse(
                                  snapshot.data.docs[i]["datetime"]),
                              message: snapshot.data.docs[i]["message"],
                              isMine: snapshot.data.docs[i]["isMine"],
                            );
                            _chatModel._chatMessageList.add(model);
                          }

                          _chatModel._chatMessageList
                              .sort((a, b) => a.datetime.compareTo(b.datetime));

                          return ListView.builder(
                            shrinkWrap: true,
                            physics: NeverScrollableScrollPhysics(),
                            itemCount: _chatModel._chatMessageList.length,
                            itemBuilder: (BuildContext context, int i) {
                              return MessageCard(
                                  _chatModel._chatMessageList[i]);
                            },
                          );
                        }
                      }),
                ),
                ChatTextForm(_chatModel._chatMessageList, _chatModel.setData),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
