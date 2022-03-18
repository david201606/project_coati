import 'package:coati/src/theme/theme_colors.dart';
import 'package:flutter/material.dart';

import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';

import 'src/nav/menu_page.dart';
import 'src/theme/my_theme.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Coati',
      theme: MyTheme.define(ColorsPalettes().lightColors()),
      darkTheme: MyTheme.define(ColorsPalettes().darkColors()),
      home: const MenuPage(),
    );
  }
}
