import 'package:flutter/material.dart';
import 'package:flutter_localization/controller/language_controller.dart';
import 'package:flutter_localization/home_screen.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  SharedPreferences sp = await SharedPreferences.getInstance();
  String languageCode = sp.getString("language_code") ?? '';
  runApp(MyApp(
    local: languageCode,
  ));
}

class MyApp extends StatelessWidget {
  final String? local;
  const MyApp({super.key, this.local});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [ChangeNotifierProvider(create: (_) => LanguageController())],
      child: Consumer<LanguageController>(
        builder: (context, provider, child) {
          return MaterialApp(
            locale: local == '' ? const Locale('en') : provider.appLocale,
            localizationsDelegates: const [
              AppLocalizations.delegate, // Add this line
              GlobalMaterialLocalizations.delegate,
              GlobalWidgetsLocalizations.delegate,
              GlobalCupertinoLocalizations.delegate,
            ],
            supportedLocales: const [
              Locale('en'), // English
              Locale('es'), // Spanish
              Locale("ur")
            ],
            debugShowCheckedModeBanner: false,
            title: 'Localization',
            theme: ThemeData(
              useMaterial3: true,
            ),
            home: const HomeScreen(),
          );
        },
      ),
    );
  }
}
