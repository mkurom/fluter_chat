import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_auth/firebase_auth.dart';
// import 'package:cloud_firestore/cloud_firestore.dart';

class FirebaseManager {
  static FirebaseManager _firebaseManager;

  factory FirebaseManager() {
    if (_firebaseManager == null) {
      _firebaseManager = new FirebaseManager._();
    }
    return _firebaseManager;
  }

  const FirebaseManager._();

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

    print(task.user.uid);

    if (task.user.uid == null) {
      errWord = "not user";
    }

    return errWord;
  }
}
