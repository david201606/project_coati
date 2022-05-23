import 'package:cloud_firestore/cloud_firestore.dart';
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
        actions: [
          /*IconButton(
              onPressed: () {
                FirebaseFirestore.instance.collection('hi').get().then((value) {
                  print(value.docs.length);
                });
              },
              icon: Icon(Icons.rocket_rounded))*/
        ],
      ),
      body: StreamBuilder(
          stream: FirebaseFirestore.instance
              .collection('sesions')
              .where('players_uid', arrayContains: _prefs.userID)
              .snapshots(),
          builder: (context, AsyncSnapshot<QuerySnapshot> snapshot) {
            List<Widget> online = [];
            for (var i = 0; i < snapshot.data!.docs.length; ++i) {
              online.add(ListTile(
                leading: Icon(Icons.sports_esports_rounded),
                title: Text('Tic-Tac-Toe'),
                subtitle: Text('Estas jugando con FranciscoD22'),
                trailing: Icon(Icons.cancel_rounded),
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) =>
                            TTTPage(doc: snapshot.data!.docs[i]),
                      ));
                },
              ));
            }

            return ListView(
              children: online,
            );
          }),
    );
  }
}
