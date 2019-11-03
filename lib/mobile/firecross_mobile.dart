library firecross;

import 'package:firebase_auth/firebase_auth.dart';
// import 'package:firecross/model/firecross_base.dart';

final FirebaseAuth _auth = FirebaseAuth.instance;

class Firecross {
  // @override
  Firecross(
      {String apiKey,
      String authDomain,
      String databaseURL,
      String projectId,
      String storageBucket,
      String messagingSenderId}) {
  }

  // @override
  Future<bool> signInWithEmailAndPassword(String email, String password) async {
    try {
      await  _auth.signInWithEmailAndPassword(email: email, password: password);
      return Future.value(true);
    } catch (e) {
      print(e);
      return Future.value(false);
    }
  }
}
