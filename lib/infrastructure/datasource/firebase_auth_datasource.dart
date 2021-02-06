import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_auth/firebase_auth.dart';

class FirebaseAuthDatasource {
  String _uid = "";

  Future<FirebaseApp> initialize() {
    print("initialize");

    return Firebase.initializeApp().catchError((err) => {
          print(err.toString()),
        });
  }

  Future<String> signInAnonymous() async {
    print("signInAnonymous");
    String errWord = "";
    var task = await FirebaseAuth.instance.signInAnonymously();

    _uid = task.user.uid;

    print(task.user.uid);

    if (task.user.uid == null) {
      errWord = "not user";
    }

    return errWord;
  }
}
