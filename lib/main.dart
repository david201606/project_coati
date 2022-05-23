import 'package:coati/src/nav/auth_page.dart';
import 'package:coati/src/nav/menu_page.dart';
import 'package:coati/src/nav/strugle.dart';
import 'package:coati/src/theme/theme_colors.dart';
import 'package:coati/src/utils/user_preferences.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

import 'firebase_options.dart';
import 'src/theme/my_theme.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final prefs = UserPreferences();
  await prefs.initPrefs();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  MyApp({Key? key}) : super(key: key);
  final UserPreferences _prefs = UserPreferences();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Koaty',
      debugShowCheckedModeBanner: false,
      theme: MyTheme.define(ColorsPalettes().lightColors()),
      darkTheme: MyTheme.define(ColorsPalettes().darkColors()),
      // home: const TTTPage(),
      // home: _prefs.userID == '' ? const AuthPage() : const MenuPage(),
      home: StruglePage(),
    );
  }
}
