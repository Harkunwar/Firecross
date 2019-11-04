import 'package:firebase_auth/firebase_auth.dart';
import 'package:firecross/src/base/firecross_auth.dart';
import 'package:firecross/src/mobile/firecross_app.dart';

class FirecrossAuth extends FirecrossAuthBase {

  static final FirebaseAuth _auth = FirebaseAuth.instance;

  final FirecrossApp app;

  @override
  FirecrossAuth._(this.app);

  factory FirecrossAuth.fromApp(FirecrossApp app) {
    return FirecrossAuth._(app);
  }

  static FirecrossAuth get instance => FirecrossAuth._(FirecrossApp.instance);

  @override
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
