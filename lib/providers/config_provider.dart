import 'package:app/config/app_config.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final appConfigProvider = Provider<AppConfig>(
  (ref) => AppConfig(
    supabaseUrl: dotenv.env['SUPABASE_URL']!,
    supabaseAnnonKey: dotenv.env['SUOABASE_ANNON_KEY']!,
    appEnv: dotenv.env['APP_ENV'] ?? 'production',
  ),
);
