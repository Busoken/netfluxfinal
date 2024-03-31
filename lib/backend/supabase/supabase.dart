import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:supabase_flutter/supabase_flutter.dart' hide Provider;

export 'database/database.dart';

class SupaFlow {
  SupaFlow._();

  static SupaFlow? _instance;
  static SupaFlow get instance => _instance ??= SupaFlow._();

  final _supabase = Supabase.instance.client;
  static SupabaseClient get client => instance._supabase;

  static Future initialize() async {
    await dotenv.load(fileName: ".env"); // Make sure to load environment variables
    return Supabase.initialize(
      url: dotenv.env['SUPABASE_URL']!, // Use the variables from .env
      anonKey: dotenv.env['SUPABASE_ANON_KEY']!,
      debug: false,
    );
  }
}
