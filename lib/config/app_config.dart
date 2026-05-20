class AppConfig {
  final String supabaseUrl;
  final String supabaseAnnonKey;
  final String appEnv;
  const AppConfig({
    required this.supabaseUrl,
    required this.supabaseAnnonKey,
    required this.appEnv,
  });
  bool get isProduction => appEnv == 'production';
  bool get isDevelopment => appEnv == 'development';
}
