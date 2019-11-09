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

  @override
  Future<FirecrossAuthResult> signInWithEmailAndPassword(
      String email, String password) async {
    try {
      final rawUser = await _auth.signInWithEmailAndPassword(
          email: email, password: password);
      return FirecrossAuthResult(
        user: FirecrossUser(
          displayName: rawUser.user.displayName,
          isAnonymous: rawUser.user.isAnonymous,
          isEmailVerified: rawUser.user.isEmailVerified,
          providerId: rawUser.user.providerId,
          uid: rawUser.user.uid,
          photoUrl: rawUser.user.photoUrl,
          email: rawUser.user.email,
          phoneNumber: rawUser.user.phoneNumber,
        ),
      );
    } catch (e) {
      print(e);
      throw Exception(e.toString());
    }
  }
}
