library firecross;

import 'package:firecross/src/common/firecross_auth_result.dart';
import 'package:firecross/src/common/firecross_user.dart';

abstract class FirecrossAuthBase {

  external FirecrossAuthBase._();

  external factory FirecrossAuthBase.fromApp();

  external Future<FirecrossAuthResult> signInWithEmailAndPassword(String email, String password);

  external Future<FirecrossAuthResult> createUserWithEmailAndPassword(String email, String password);

  external Future<void> signOut();

  external static FirecrossAuthBase get instance;

  external Future<FirecrossUser> currentUser();


}
