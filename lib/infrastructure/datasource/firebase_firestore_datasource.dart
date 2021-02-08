import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_chat/domain/model/message_model.dart';

class FirebaseFirestoreDatasource {
  Future<void> setData(MessageModel messageData) {
    Map<String, dynamic> data = {
      'avatarUrl': messageData.avatarUrl,
      'name': messageData.name,
      'datetime': messageData.datetime.toString(),
      'message': messageData.message,
      'isMine': messageData.isMine,
    };

    return FirebaseFirestore.instance
        .collection('chats')
        .doc()
        .set(data)
        .catchError(
          (error) => print("Failed to set data: $error"),
        );
  }

  Stream<QuerySnapshot> fetchSnapshot() {
    var data = FirebaseFirestore.instance.collection("chats").snapshots();
    return data;
  }

  Future<List<MessageModel>> fetchData() async {
    List<Map<String, dynamic>> data = [];

    await FirebaseFirestore.instance
        .collection("chats")
        .get()
        .then(
          (querySnapshot) => {
            querySnapshot.docs.forEach(
              (doc) => {
                data.add(
                  doc.data(),
                ),
              },
            ),
          },
        )
        .catchError(
          (error) => print("Failed to fetch data: $error"),
        );

    List<MessageModel> models = [];

    for (int i = 0; i < data.length; i++) {
      MessageModel model = MessageModel(
        avatarUrl: data[i]["avatarUrl"],
        name: data[i]["name"],
        datetime: data[i]["datetime"],
        message: data[i]["message"],
        isMine: data[i]["isMine"],
      );

      models.add(model);
    }

    return models;
  }
}
