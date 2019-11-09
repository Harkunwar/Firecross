import 'firecross_auth.dart';

abstract class FirecrossAppBase {

  external FirecrossAppBase._();

  external factory FirecrossAppBase.initializeApp(
      {String apiKey,
      String authDomain,
      String databaseURL,
      String projectId,
      String storageBucket,
      String messagingSenderId});

  external static FirecrossAppBase get instance;

  external static FirecrossAuthBase get auth;
}
