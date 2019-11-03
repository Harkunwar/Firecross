import 'package:flutter/foundation.dart';

abstract class FirecrossBase {

  FirecrossBase({
    String apiKey,
    String authDomain,
    String databaseURL,
    String projectId,
    String storageBucket,
    String messagingSenderId,
    String appId,
    String measurementId});

  Future<bool> signInWithEmailAndPasswod(String email, String password);
}
