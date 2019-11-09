library firecross;

import 'package:firecross/src/common/firecross_auth_result.dart';

abstract class FirecrossAuthBase {

  external FirecrossAuthBase._();

  external factory FirecrossAuthBase.fromApp();

  external Future<FirecrossAuthResult> signInWithEmailAndPassword(String email, String password);

  external static FirecrossAuthBase get instance;

}
