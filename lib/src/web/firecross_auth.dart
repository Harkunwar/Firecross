import 'package:firebase/firebase.dart' as fb;
import 'package:firecross/src/base/firecross_auth.dart';
import 'package:firecross/src/web/firecross_auth_result.dart';
import 'package:firecross/src/web/firecross_user.dart';
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

  FirecrossUser _generateUser(fb.User user) {
    return FirecrossUser(
      user: user,
      displayName: user.displayName,
      isAnonymous: user.isAnonymous,
      isEmailVerified: user.emailVerified,
      providerId: user.providerId,
      uid: user.uid,
      photoUrl: user.photoURL,
      email: user.email,
      phoneNumber: user.phoneNumber,
    );
  }

  FirecrossAuthResult _generateAuthResult(fb.UserCredential result) {
    return FirecrossAuthResult(
      user: _generateUser(result.user),
    );
  }

  @override
  Future<FirecrossAuthResult> signInWithEmailAndPassword(
      String email, String password) async {
    final result = await _auth.signInWithEmailAndPassword(email, password);
    return _generateAuthResult(result);
  }

  @override
  Future<FirecrossAuthResult> createUserWithEmailAndPassword(
      String email, String password) async {
    final result = await _auth.createUserWithEmailAndPassword(email, password);
    return _generateAuthResult(result);
  }

  @override
  Future<void> sendPasswordResetEmail(String email) async {
    await _auth.sendPasswordResetEmail(email);
  }

//  @override
//  Future<void> confirmPasswordReset(String code, String newPassword) async{
//    await _auth.confirmPasswordReset(code, newPassword);
//  }

  @override
  Future<FirecrossUser> currentUser() async {
    return Future.value(_generateUser(_auth.currentUser));
  }

  @override
  Future<void> signOut() async {
    await _auth.signOut();
  }

  
}
