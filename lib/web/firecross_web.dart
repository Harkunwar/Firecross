import 'package:firecross/model/firecross_base.dart';
import 'package:firebase/firebase.dart' as fb;

class Firecross extends FirecrossBase {
  @override
  Firecross(
      {String apiKey,
      String authDomain,
      String databaseURL,
      String projectId,
      String storageBucket,
      String messagingSenderId}) {

    fb.initializeApp(
        apiKey: apiKey,
        authDomain: authDomain,
        databaseURL: databaseURL,
        projectId: projectId,
        storageBucket: storageBucket,
        messagingSenderId: messagingSenderId);
  }

  @override
  Future<bool> signInWithEmailAndPasswod(String email, String password) async {
    try {
      final app = fb.app();
      final auth = fb.auth(app);
      await auth.signInWithEmailAndPassword(email, password);
      return Future.value(true);
    } catch (e) {
      print(e);
      return Future.value(false);
    }
  }
}
