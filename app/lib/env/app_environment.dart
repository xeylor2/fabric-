/// Runtime environment the application was launched with.
///
/// Selected exclusively via the entrypoints (`main_development.dart`,
/// `main_production.dart`) and injected through Riverpod in `bootstrap.dart`.
enum AppEnvironment {
  development,
  production;

  bool get isDevelopment => this == AppEnvironment.development;

  bool get isProduction => this == AppEnvironment.production;

  String get label => switch (this) {
    AppEnvironment.development => 'Development',
    AppEnvironment.production => 'Production',
  };
}
