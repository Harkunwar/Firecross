library firecross;

import 'package:firecross/src/base/firecross_auth_result.dart';
import 'package:firecross/src/base/firecross_user.dart';

abstract class FirecrossAuthBase {

  Future<FirecrossAuthResultBase> signInWithEmailAndPassword(
      String email, String password);

  Future<FirecrossAuthResultBase> createUserWithEmailAndPassword(
      String email, String password);

  Future<void> sendPasswordResetEmail(String email);

//  Future<void> confirmPasswordReset(String code, String newPassword);

  Future<void> signOut();

  Future<FirecrossUserBase> currentUser();

}
