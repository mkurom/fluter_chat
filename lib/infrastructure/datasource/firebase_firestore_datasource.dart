import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_chat/domain/model/message_model.dart';

class FirebaseFirestoreDatasource {
  Future<void> setData(MessageModel messageData) {
    Map<String, dynamic> data;

    final formRecord = {
      'avatarUrl': messageData.avatarUrl,
      'name': messageData.name,
      'datetime': messageData.datetime,
      'message': messageData.message,
      'isMine': messageData.isMine,
    };

    return FirebaseFirestore.instance
        .collection('chats')
        .doc()
        .set(formRecord)
        .catchError((error) => print("Failed to set data: $error"));
  }
}
