import 'package:coati/src/nav/Toca%20Toca.dart';
import 'package:coati/src/nav/prueba.dart';
import 'package:coati/src/nav/struggle_page.dart';
import 'package:coati/src/nav/upOrDownPage.dart';
import 'package:coati/src/utils/user_preferences.dart';
import 'package:flutter/material.dart';

import 'number_game_page.dart';

class HomePage extends StatelessWidget {
  HomePage({Key? key}) : super(key: key);
  final UserPreferences _prefs = UserPreferences();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Koaty'),
        actions: const [
          /*IconButton(
              onPressed: () {
                FirebaseFirestore.instance.collection('hi').get().then((value) {
                  print(value.docs.length);
                });
              },
              icon: Icon(Icons.rocket_rounded))*/
        ],
      ),
      body: ListView(children: [
        ListTile(
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => const StrugglePage(),
              ),
            );
          },
          title: Text('Luchitas'),
          subtitle: Text('Presiona el botón hasta que alguien pierda'),
          leading: Icon(Icons.sports_kabaddi_rounded),
        ),
        ListTile(
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => const TocaToca(),
              ),
            );
          },
          title: Text('Toca Toca'),
          subtitle: Text('Juega y despues reta'),
          leading: Icon(Icons.check_box_outline_blank),
        ),
        ListTile(
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => const prueba(),
              ),
            );
          },
          title: Text('Prueba de animacion'),
          subtitle: Text('Juega y despues reta'),
          leading: Icon(Icons.cached),
        ),
        ListTile(
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => const UpOrDown(),
              ),
            );
          },
          title: Text('¿Arriba o Abajo?'),
          subtitle: Text('Adivina si esta arriba o abajo'),
          leading: Icon(Icons.swap_vert_rounded),
        ),
        ListTile(
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => const NumbersGamePage(),
              ),
            );
          },
          title: Text('A, 2, ..., Q, K'),
          subtitle: Text('Adivina si esta arriba o abajo'),
          leading: Icon(Icons.help_rounded),
        ),
      ]),
    );
  }
}
