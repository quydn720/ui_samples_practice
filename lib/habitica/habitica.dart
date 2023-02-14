import 'package:flutter/material.dart';
import 'package:ui_samples_practice/habitica/presentation/pages/habitica_home.dart';
import 'package:ui_samples_practice/l10n/l10n.dart';

export 'presentation/pages/habitica_home.dart';

class HabiticaApp extends StatelessWidget {
  const HabiticaApp({super.key});

  @override
  Widget build(BuildContext context) {
    final baseTheme = ThemeData(brightness: Brightness.light);

    return MaterialApp(
      localizationsDelegates: AppLocalizations.localizationsDelegates,
      supportedLocales: AppLocalizations.supportedLocales,
      theme: baseTheme.copyWith(
        outlinedButtonTheme: OutlinedButtonThemeData(
          style: OutlinedButton.styleFrom(
            foregroundColor: Colors.black,
            padding: const EdgeInsets.all(16),
            side: const BorderSide(),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(24),
            ),
          ),
        ),
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: OutlinedButton.styleFrom(
            backgroundColor: const Color.fromRGBO(20, 32, 97, 1),
            foregroundColor: Colors.white,
            padding: const EdgeInsets.all(16),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(24),
            ),
          ),
        ),
        inputDecorationTheme: InputDecorationTheme(
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(32),
          ),
        ),
      ),
      home: const HabiticaHome(),
    );
  }
}
