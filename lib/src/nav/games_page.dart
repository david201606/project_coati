import 'package:coati/src/nav/games/shufflue_page.dart';
import 'package:coati/src/utils/user_preferences.dart';
import 'package:flutter/material.dart';

import '../utils/challenge.dart';
import 'games/number_game_page.dart';
import 'games/struggle_page.dart';
import 'games/up_down_page.dart';

class GamesPage extends StatelessWidget {
  final List<dynamic> people;

  GamesPage({Key? key, required this.people}) : super(key: key);
  final UserPreferences _prefs = UserPreferences();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Juegos'),
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {
          showDialog(
            barrierDismissible: false,
            context: context,
            builder: (context) => AlertDialog(
              title: const Text('Aah el mamon'),
              content: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  const Text('Ahora por mamon te toca...'),
                  Text(Challenge().randomizedChallenge()),
                ],
              ),
              actions: [
                TextButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: const Text('Listo'),
                ),
              ],
            ),
          );
        },
        label: const Text('Dame un reto'),
        icon: const Icon(Icons.casino_rounded),
      ),
      body: ListView(
        children: [
          ListTile(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const UpOrDown(),
                ),
              );
            },
            title: const Text('¿Mayor o Menor?'),
            subtitle: const Text('Trata de adivinar la siguente carta'),
            leading: const Icon(Icons.swap_vert_rounded),
            trailing: IconButton(
              onPressed: () {
                showDialog(
                  barrierDismissible: false,
                  context: context,
                  builder: (context) => AlertDialog(
                    title: const Text('¿Mayor o Menor?'),
                    content: const Text(
                        'Trata de adivinar si la siguente carta es mayor o menor a la que esta visible, si te equivocas toca pagar las concecuencias\nOrden de las cartas:\nA, 2, 3, 4, 5, 6, 7, 8, 9, 10, J, Q, K'),
                    actions: [
                      TextButton(
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        child: const Text('Listo'),
                      ),
                    ],
                  ),
                );
              },
              icon: const Icon(Icons.help_outline_rounded),
            ),
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
            title: const Text('¿Pares?'),
            subtitle: const Text('Espera NO tener suerte'),
            leading: const Icon(Icons.help_rounded),
          ),
          ListTile(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const StrugglePage(),
                ),
              );
            },
            title: const Text('Luchitas'),
            subtitle: const Text('Que gane el más rápido'),
            leading: const Icon(Icons.sports_kabaddi_rounded),
          ),
          /*ListTile(
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
        ),*/
          ListTile(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => ShufflePage(people: people),
                ),
              );
            },
            title: const Text('Ruleta borracha'),
            subtitle: const Text('Reta a quien salga en la ruleta'),
            leading: const Icon(Icons.attractions_rounded),
          ),
          /*ListTile(
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
        ),*/
        ],
      ),
    );
  }
}
