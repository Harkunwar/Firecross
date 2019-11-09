import 'package:firebase/firebase.dart';
import 'package:firecross/src/base/firecross_user.dart';

class FirecrossUser implements FirecrossUserBase {

  final User _user;

  final String displayName;

  final bool isAnonymous;

  final bool isEmailVerified;

  final String providerId;

  final String uid;

  final String photoUrl;

  final String email;

  final String phoneNumber;

  FirecrossUser({
    User user,
    this.displayName,
    this.isAnonymous,
    this.isEmailVerified,
    this.providerId,
    this.uid,
    this.photoUrl,
    this.email,
    this.phoneNumber,
  }) : _user = user;

  @override
  Future<void> updateProfile({String displayName, String photoUrl}) async {
    UserProfile profile = UserProfile(
      displayName: displayName?? this.displayName,
      photoURL: photoUrl?? this.photoUrl,

    );
    await _user.updateProfile(profile);
  }

  @override
  Future<void> reload() {
    return _user.reload();
  }
}
