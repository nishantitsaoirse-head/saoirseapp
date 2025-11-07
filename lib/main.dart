import 'package:flutter/material.dart';
import 'package:get_storage/get_storage.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:saoirse_app/l10n/app_localizations.dart';
import 'package:saoirse_app/screens/home/home_screen.dart';

final storage = GetStorage();
void main() async {
  await GetStorage.init();
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  Locale _locale = const Locale('en');

  void _changeLanguage(Locale locale) {
    setState(() {
      _locale = locale;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      locale: _locale,
      // Use device locale by default
      onGenerateTitle: (context) => AppLocalizations.of(context)!.appTitle,

      localizationsDelegates: const [
        AppLocalizations.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
      ],
      supportedLocales: AppLocalizations.supportedLocales,

      // Optional: force a starting locale
      // locale: const Locale('hi'),

      home: HomeScreen(
        onLocaleChange: _changeLanguage,
      ),
    );
  }
}
