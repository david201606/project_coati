import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

import 'new_room.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Coati'),
        actions: [
          IconButton(
              onPressed: () {
                FirebaseFirestore.instance.collection('hi').get().then((value) {
                  print(value.docs.length);
                });
              },
              icon: Icon(Icons.rocket_rounded))
        ],
      ),
      body: ListView(
        children: [
          ListTile(
            leading: Icon(Icons.sports_esports_rounded),
            title: Text('Te estamos esperando'),
            subtitle: Text('2 personas esperando para jugar'),
            trailing: Icon(Icons.accessibility_rounded),
            onTap: () {},
          ),
        ],
      ),
    );
  }
}
