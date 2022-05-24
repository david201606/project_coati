import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:coati/src/nav/struggle_page.dart';
import 'package:coati/src/tic_tac_toe.dart';
import 'package:coati/src/utils/user_preferences.dart';
import 'package:flutter/material.dart';

import 'new_room.dart';

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
          title: Text('Retos'),
          subtitle: Text('Juega y despues reta'),
          leading: Icon(Icons.sports_esports_rounded),
        )
      ]),
    );
  }
}
