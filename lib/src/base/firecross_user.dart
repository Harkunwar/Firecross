abstract class FirecrossUserBase {
  final String displayName;

  final bool isAnonymous;

  final bool isEmailVerified;

  final String providerId;

  final String uid;

  final String photoUrl;

  final String email;

  final String phoneNumber;

  FirecrossUserBase({
    this.displayName,
    this.isAnonymous,
    this.isEmailVerified,
    this.providerId,
    this.uid,
    this.photoUrl,
    this.email,
    this.phoneNumber,
  });

  Future<void> updateProfile({String displayName, String photoUrl});

  Future<void> reload();
}
