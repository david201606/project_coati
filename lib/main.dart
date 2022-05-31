import 'package:coati/src/nav/games_page.dart';
import 'package:coati/src/nav/menu_page.dart';
import 'package:coati/src/theme/theme_colors.dart';
import 'package:coati/src/utils/user_preferences.dart';
import 'package:flutter/material.dart';

import 'src/theme/my_theme.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  /*final prefs = UserPreferences();
  await prefs.initPrefs();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );*/
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
      home: GamesPage(),
    );
  }
}
