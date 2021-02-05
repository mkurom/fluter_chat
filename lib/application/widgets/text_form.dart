import 'package:flutter/material.dart';

class ChatTextForm extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      validator: (value) {
        if (value.isEmpty) {
          return '文字を入力してください。';
        }
        return null;
      },
    );
  }
}
