import 'package:firebase_auth/firebase_auth.dart';
import 'package:firecross/src/base/firecross_auth.dart';
import 'package:firecross/src/common/firecross_auth_result.dart';
import 'package:firecross/src/common/firecross_user.dart';
import 'package:firecross/src/mobile/firecross_app.dart';

class FirecrossAuth implements FirecrossAuthBase {
  static final FirebaseAuth _auth = FirebaseAuth.instance;

  final FirecrossApp app;

  @override
  FirecrossAuth._(this.app);

  factory FirecrossAuth.fromApp(FirecrossApp app) {
    return FirecrossAuth._(app);
  }

  static FirecrossAuth get instance => FirecrossAuth._(FirecrossApp.instance);

  FirecrossAuthResult _generateAuthResult(AuthResult result) {
    return FirecrossAuthResult(
      user: FirecrossUser(
        displayName: result.user.displayName,
        isAnonymous: result.user.isAnonymous,
        isEmailVerified: result.user.isEmailVerified,
        providerId: result.user.providerId,
        uid: result.user.uid,
        photoUrl: result.user.photoUrl,
        email: result.user.email,
        phoneNumber: result.user.phoneNumber,
      ),
    );
  }

  @override
  Future<FirecrossAuthResult> signInWithEmailAndPassword(
      String email, String password) async {
    final result = await _auth.signInWithEmailAndPassword(
        email: email, password: password);
    return _generateAuthResult(result);
  }

  @override
  Future<FirecrossAuthResult> createUserWithEmailAndPassword(
      String email, String password) async {
    final result = await _auth.createUserWithEmailAndPassword(
        email: email, password: password);
    return _generateAuthResult(result);
  }
}
