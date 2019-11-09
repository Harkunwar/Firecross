import 'package:firebase_auth/firebase_auth.dart';
import 'package:firecross/src/base/firecross_auth.dart';
import 'package:firecross/src/mobile/firecross_auth_result.dart';
import 'package:firecross/src/mobile/firecross_user.dart';
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

  FirecrossUser _generateUser(FirebaseUser user) {
    return FirecrossUser(
      user: user,
      displayName: user.displayName,
      isAnonymous: user.isAnonymous,
      isEmailVerified: user.isEmailVerified,
      providerId: user.providerId,
      uid: user.uid,
      photoUrl: user.photoUrl,
      email: user.email,
      phoneNumber: user.phoneNumber,
    );
  }

  FirecrossAuthResult _generateAuthResult(AuthResult result) {
    return FirecrossAuthResult(
      user: _generateUser(result.user),
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

  @override
  Future<FirecrossUser> currentUser() async {
    return _generateUser(await _auth.currentUser());
  }

  @override
  Future<void> signOut() async {
    await _auth.signOut();
  }
}
