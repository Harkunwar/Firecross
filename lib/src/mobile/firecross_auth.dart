import 'package:firebase_auth/firebase_auth.dart';
import 'package:firecross/src/base/firecross_auth.dart';
import 'package:firecross/src/mobile/firecross.dart';

class FirecrossAuth extends FirecrossAuthBase {

  static final FirebaseAuth _auth = FirebaseAuth.instance;

  final Firecross app;

  @override
  FirecrossAuth._(this.app);

  factory FirecrossAuth.fromApp(Firecross app) {
    return FirecrossAuth._(app);
  }

  static FirecrossAuth get instance => FirecrossAuth._(Firecross.instance);

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
