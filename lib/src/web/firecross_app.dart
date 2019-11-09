import 'package:firebase/firebase.dart' as fb;
import 'package:firecross/src/base/firecross_app.dart';
import 'package:firecross/src/web/firecross_auth.dart';

class FirecrossApp implements FirecrossAppBase {
  static final FirecrossApp _instance = FirecrossApp._();

  FirecrossApp._();

  factory FirecrossApp.initalizeApp(
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

  static FirecrossApp get instance => _instance;

  static FirecrossAuth get auth => FirecrossAuth.fromApp(instance);
}
