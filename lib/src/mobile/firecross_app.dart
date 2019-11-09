import 'package:firecross/src/base/firecross_app.dart';
import 'package:firecross/src/mobile/firecross_auth.dart';

class FirecrossApp implements FirecrossAppBase {
  static final FirecrossApp _instance = FirecrossApp._();

  @override
  FirecrossApp._();

  @override
  factory FirecrossApp.initalizeApp(
      {String apiKey,
      String authDomain,
      String databaseURL,
      String projectId,
      String storageBucket,
      String messagingSenderId}) {
    return _instance;
  }

  static FirecrossApp get instance => _instance;

  static FirecrossAuth get auth => FirecrossAuth.fromApp(instance);
}
