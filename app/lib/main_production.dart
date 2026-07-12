import 'package:febric/bootstrap.dart';
import 'package:febric/env/app_environment.dart';

/// Production entrypoint: `flutter build <platform> -t lib/main_production.dart`.
Future<void> main() => bootstrap(AppEnvironment.production);
