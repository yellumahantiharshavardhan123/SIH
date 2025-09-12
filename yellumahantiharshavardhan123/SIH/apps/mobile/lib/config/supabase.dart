import 'package:supabase_flutter/supabase_flutter.dart';

class SupaConfig {
  static const url = String.fromEnvironment('SUPABASE_URL', defaultValue: '');
  static const anonKey = String.fromEnvironment('SUPABASE_ANON_KEY', defaultValue: '');
}

Future<void> initSupabase() async {
  await Supabase.initialize(url: SupaConfig.url, anonKey: SupaConfig.anonKey);
}

SupabaseClient get sb => Supabase.instance.client;
