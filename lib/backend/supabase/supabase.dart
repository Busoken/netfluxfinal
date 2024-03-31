import 'package:supabase_flutter/supabase_flutter.dart' hide Provider;

export 'database/database.dart';

const _kSupabaseUrl = 'https://htwqmzblresezidexpyx.supabase.co';
const _kSupabaseAnonKey =
    'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6Imh0d3FtemJscmVzZXppZGV4cHl4Iiwicm9sZSI6ImFub24iLCJpYXQiOjE3MDc2NDMyMTMsImV4cCI6MjAyMzIxOTIxM30.JEXazetwodZ1Nnhvc8dr3nmuQVIlnT3dAHM1sIPXsBo';

class SupaFlow {
  SupaFlow._();

  static SupaFlow? _instance;
  static SupaFlow get instance => _instance ??= SupaFlow._();

  final _supabase = Supabase.instance.client;
  static SupabaseClient get client => instance._supabase;

  static Future initialize() => Supabase.initialize(
        url: _kSupabaseUrl,
        anonKey: _kSupabaseAnonKey,
        debug: false,
      );
}
