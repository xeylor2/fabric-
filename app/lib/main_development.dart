import 'package:febric/bootstrap.dart';
import 'package:febric/env/app_environment.dart';

/// Development entrypoint: `flutter run -t lib/main_development.dart`.
Future<void> main() => bootstrap(AppEnvironment.development);
