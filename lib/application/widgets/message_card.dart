import 'package:flutter/material.dart';

class MessageCard extends StatelessWidget {
  const MessageCard(this.userMessage);

  final userMessage;

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: userMessage.isMine
          ? EdgeInsets.only(top: 5.0, left: 90.0, bottom: 5.0, right: 8.0)
          : EdgeInsets.only(top: 5.0, left: 8.0, bottom: 5.0, right: 90.0),
      child: ListTile(
        title: Text(userMessage.message),
        subtitle: Row(
          mainAxisAlignment: userMessage.isMine
              ? MainAxisAlignment.end
              : MainAxisAlignment.start,
          children: <Widget>[
            // CircleAvatar(
            //   backgroundImage: NetworkImage(userMessage.avatarUrl),
            //   radius: 10.0,
            // ),
            Text(userMessage.name),
            Spacer(),
            Text(
              userMessage.datetime,
              style: TextStyle(fontWeight: FontWeight.w100),
            ),
          ],
        ),
      ),
    );
  }
}
