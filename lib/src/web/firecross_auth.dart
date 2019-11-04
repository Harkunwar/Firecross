import 'package:firebase/firebase.dart' as fb;
import 'package:firecross/src/base/firecross_auth.dart';
import 'package:firecross/src/web/firecross_app.dart';

class FirecrossAuth extends FirecrossAuthBase {

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
