import 'package:firebase/firebase.dart' as fb;
import 'package:firecross/src/base/firecross_auth.dart';
import 'package:firecross/src/common/firecross_auth_result.dart';
import 'package:firecross/src/common/firecross_user.dart';
import 'package:firecross/src/web/firecross_app.dart';

class FirecrossAuth implements FirecrossAuthBase {
  final FirecrossApp app;

  @override
  FirecrossAuth._(this.app);

  @override
  factory FirecrossAuth.fromApp(FirecrossApp app) {
    return FirecrossAuth._(app);
  }

  static FirecrossAuth get instance => FirecrossAuth._(FirecrossApp.instance);

  fb.Auth get _auth => fb.auth(fb.app());

  FirecrossAuthResult _generateAuthResult(fb.UserCredential result) {
    return FirecrossAuthResult(
      user: FirecrossUser(
        displayName: result.user.displayName,
        isAnonymous: result.user.isAnonymous,
        isEmailVerified: result.user.emailVerified,
        providerId: result.user.providerId,
        uid: result.user.uid,
        photoUrl: result.user.photoURL,
        email: result.user.email,
        phoneNumber: result.user.phoneNumber,
      ),
    );
  }

  @override
  Future<FirecrossAuthResult> signInWithEmailAndPassword(
      String email, String password) async {
      final result = await _auth.signInWithEmailAndPassword(email, password);
      return _generateAuthResult(result);
  }

  @override
  Future<FirecrossAuthResult> createUserWithEmailAndPassword(String email, String password) async {
    final result = await _auth.createUserWithEmailAndPassword(email, password);
    return _generateAuthResult(result);
  }
}
