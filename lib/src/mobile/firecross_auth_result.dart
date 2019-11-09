import 'package:firecross/src/base/firecross_auth_result.dart';
import 'package:firecross/src/mobile/firecross_user.dart';

class FirecrossAuthResult implements FirecrossAuthResultBase {
  final FirecrossUser user;

  final dynamic additionalUserInfo;

  FirecrossAuthResult({this.user, this.additionalUserInfo});
}
