import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'config/supabase.dart';
import 'l10n/loader.dart';
import 'app_router.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await initSupabase();
  runApp(const ProviderScope(child: TripSafeApp()));
}

class TripSafeApp extends StatefulWidget {
  const TripSafeApp({super.key});
  @override
  State<TripSafeApp> createState() => _TripSafeAppState();
}

class _TripSafeAppState extends State<TripSafeApp> {
  Locale _locale = const Locale('en');
  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: 'TripSafe',
      theme: ThemeData(colorScheme: ColorScheme.fromSeed(seedColor: const Color(0xFF0ea5e9)), useMaterial3: true),
      routerConfig: appRouter,
      locale: _locale,
      supportedLocales: AppLocalizations.supportedLocales,
      localizationsDelegates: const [AppLocalizations.delegate],
    );
  }
}
