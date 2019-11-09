library firecross;

export 'package:firecross/firecross_auth.dart';
export 'package:firecross/firecross_app.dart';

export 'package:firecross/src/mobile/firecross_user.dart'
    if (dart.library.html) 'package:firecross/src/web/firecross_user.dart';
export 'package:firecross/src/mobile/firecross_auth_result.dart'
    if (dart.library.html) 'package:firecross/src/web/firecross_auth_result.dart';

