import 'package:firecross/src/base/firecross_auth_result.dart';
import 'package:firecross/src/web/firecross_user.dart';

class FirecrossAuthResult implements FirecrossAuthResultBase {
  final FirecrossUser user;

  // TODO: Type to be decided
  final dynamic additionalUserInfo;

  FirecrossAuthResult({this.user, this.additionalUserInfo});
}
