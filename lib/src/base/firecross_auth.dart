library firecross;

import 'package:firecross/src/base/firecross_auth_result.dart';
import 'package:firecross/src/base/firecross_user.dart';

abstract class FirecrossAuthBase {
  external FirecrossAuthBase._();

  external factory FirecrossAuthBase.fromApp();

  external Future<FirecrossAuthResultBase> signInWithEmailAndPassword(
      String email, String password);

  external Future<FirecrossAuthResultBase> createUserWithEmailAndPassword(
      String email, String password);

  external Future<void> signOut();

  external static FirecrossAuthBase get instance;

  external Future<FirecrossUserBase> currentUser();

}
