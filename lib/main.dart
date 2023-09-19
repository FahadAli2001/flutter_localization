import 'package:flutter/material.dart';
import 'package:flutter_localization/controller/language_controller.dart';
import 'package:flutter_localization/home_screen.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [ChangeNotifierProvider(create: (_) => LanguageController())],
      child: MaterialApp(
        locale: Locale('en'),
        localizationsDelegates: [
          AppLocalizations.delegate, // Add this line
          GlobalMaterialLocalizations.delegate,
          GlobalWidgetsLocalizations.delegate,
          GlobalCupertinoLocalizations.delegate,
        ],
        supportedLocales: [
          Locale('en'), // English
          Locale('es'), // Spanish
        ],
        debugShowCheckedModeBanner: false,
        title: 'Localization',
        theme: ThemeData(
          useMaterial3: true,
        ),
        home: HomeScreen(),
      ),
    );
  }
}
