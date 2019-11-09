import 'package:firecross/src/common/firecross_user.dart';

class FirecrossAuthResult {
  final FirecrossUser user;

  // TODO: Type to be decided
  final dynamic additionalUserInfo;

  FirecrossAuthResult({this.user, this.additionalUserInfo});
}
