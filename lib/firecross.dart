library firecross;

export 'package:firecross/mobile/firecross_mobile.dart'
  if (dart.library.html) 'package:firecross/web/firecross_web.dart'
  if (dart.library.io) 'package:firecross/web/firecross_mobile.dart';

