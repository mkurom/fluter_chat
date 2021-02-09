import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_auth/firebase_auth.dart';

class FirebaseAuthDatasource {
  // String _uid = "";

  Future<FirebaseApp> initialize() {
    print("initialize");

    return Firebase.initializeApp().then((value) async {
      await signInAnonymous();
    }).catchError(
      (err) => {
        print(err.toString()),
      },
    );
  }

  Future<void> signInAnonymous() async {
    print("signInAnonymous");
    var task = await FirebaseAuth.instance.signInAnonymously();

    print(task.user.uid);
  }
}
