import 'package:flutter/material.dart';
import 'package:flutter_chat/domain/model/message_model.dart';
import 'package:flutter_chat/infrastructure/datasource/firebase_firestore_datasource.dart';

class ChatTextForm extends StatelessWidget {
  const ChatTextForm(this.chatMessageList, this.updateFunction);

  final chatMessageList;
  final updateFunction;

  @override
  Widget build(BuildContext context) {
    final messageTextInputCtl = TextEditingController();
    return Column(
      mainAxisAlignment: MainAxisAlignment.end,
      children: <Widget>[
        Container(
          margin: EdgeInsets.only(left: 2),
          color: Colors.blue[100],
          child: Column(
            children: <Widget>[
              Form(
                // key: _formKey,
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: <Widget>[
                    Flexible(
                      child: TextFormField(
                        controller: messageTextInputCtl,
                        keyboardType: TextInputType.multiline,
                        maxLines: 5,
                        minLines: 1,
                        decoration: const InputDecoration(
                          hintText: 'メッセージを入力してください',
                        ),
                      ),
                    ),
                    Material(
                      color: Colors.blue[100],
                      child: Center(
                        child: Ink(
                          decoration: const ShapeDecoration(
                            color: Colors.white,
                            shape: CircleBorder(),
                          ),
                          child: IconButton(
                            icon: Icon(Icons.send),
                            color: Colors.blue,
                            onPressed: () {
                              FocusScope.of(context).unfocus();
                              var messageModel = MessageModel(
                                avatarUrl: "1",
                                name: "makoto",
                                datetime: DateTime.now(),
                                message: messageTextInputCtl.text.toString(),
                                isMine: true,
                              );
                              FirebaseFirestoreDatasource()
                                  .setData(messageModel);
                              updateFunction(messageModel);
                            },
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
