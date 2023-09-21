import 'dart:developer';

import 'package:flutter/material.dart';

import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_localization/controller/language_controller.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

enum Language { english, spanish, urdu }

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(onPressed: () async {
        SharedPreferences sp = await SharedPreferences.getInstance();
        String languageCode = sp.getString("language_code") ?? '';
        log(languageCode);
      }),
      appBar: AppBar(
        backgroundColor: Colors.amber,
        title: Text(AppLocalizations.of(context)!.helloWorld),
        actions: [
          Consumer<LanguageController>(
            builder: (context, provider, child) {
              return PopupMenuButton(
                  onSelected: (value) {
                    if (Language.english.name == value.name) {
                      provider.changeLanguage(Locale("en"));
                    } else if (Language.urdu.name == value.name) {
                      provider.changeLanguage(Locale("ur"));
                    } else {
                      provider.changeLanguage(Locale("es"));
                    }
                  },
                  itemBuilder: ((context) => <PopupMenuEntry<Language>>[
                        const PopupMenuItem(
                          value: Language.english,
                          child: Text("English"),
                        ),
                        const PopupMenuItem(
                            value: Language.spanish, child: Text("Spanish")),
                        const PopupMenuItem(
                            value: Language.urdu, child: Text("Urdu")),
                      ]));
            },
          )
        ],
      ),
    );
  }
}
