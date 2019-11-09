import 'package:firebase_auth/firebase_auth.dart';
import 'package:firecross/src/base/firecross_user.dart';

class FirecrossUser implements FirecrossUserBase {

  final FirebaseUser _user;

  final String displayName;

  final bool isAnonymous;

  final bool isEmailVerified;

  final String providerId;

  final String uid;

  final String photoUrl;

  final String email;

  final String phoneNumber;

  FirecrossUser({
    FirebaseUser user,
    this.displayName,
    this.isAnonymous,
    this.isEmailVerified,
    this.providerId,
    this.uid,
    this.photoUrl,
    this.email,
    this.phoneNumber,
  }): _user = user ;

  @override
  Future<void> updateProfile({String displayName, String photoUrl}) {
    UserUpdateInfo info = UserUpdateInfo();
    if(displayName != null) info.displayName = displayName;
    if(photoUrl != null) info.photoUrl = photoUrl;
    _user.updateProfile(info);
    return null;
  }

  @override
  Future<void> reload() async {
    await _user.reload();
  }

}
