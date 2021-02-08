import 'package:flutter/material.dart';

import 'package:flutter_chat/root.dart';

import 'package:flutter_chat/utils/loading.dart';
import 'infrastructure/datasource/firebase_auth_datasource.dart';

void main() {
  runApp(App());
}

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: FutureBuilder(
        future: FirebaseAuthDatasource().initialize(),
        builder: (context, snapshot) {
          if (snapshot.hasError) {
            return Container(
              color: Colors.white,
            );
          }
          if (snapshot.connectionState == ConnectionState.done) {
            if (FirebaseAuthDatasource().signInAnonymous() != "not user") {
              return RootPage();
            }
          }
          return Scaffold(body: Loading());
        },
      ),
    );
  }
}
