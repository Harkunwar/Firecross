import 'dart:html';

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

  @override
  Future<FirecrossAuthResult> signInWithEmailAndPassword(
      String email, String password) async {
    try {
      final app = fb.app();
      final auth = fb.auth(app);
      final rawUser = await auth.signInWithEmailAndPassword(email, password);
      window.console.log(rawUser);
      return FirecrossAuthResult(
        user: FirecrossUser(
          displayName: rawUser.user.displayName,
          isAnonymous: rawUser.user.isAnonymous,
          isEmailVerified: rawUser.user.emailVerified,
          providerId: rawUser.user.providerId,
          uid: rawUser.user.uid,
          photoUrl: rawUser.user.photoURL,
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
