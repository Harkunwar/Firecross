import 'package:firebase/firebase.dart' as fb;
import 'package:firecross/src/base/firecross.dart';
import 'package:firecross/src/web/firecross_auth.dart';

class Firecross extends FirecrossBase {
  static final Firecross _instance = Firecross._();

  Firecross._();

  factory Firecross.initalizeApp(
      {String apiKey,
      String authDomain,
      String databaseURL,
      String projectId,
      String storageBucket,
      String messagingSenderId}) {
    fb.initializeApp(
        apiKey: apiKey,
        authDomain: authDomain,
        databaseURL: databaseURL,
        projectId: projectId,
        storageBucket: storageBucket,
        messagingSenderId: messagingSenderId);
    return _instance;
  }

  static Firecross get instance => _instance;

  static FirecrossAuth get auth => FirecrossAuth.fromApp(instance);
}
