import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:coati/src/utils/user_preferences.dart';
import 'package:flutter/material.dart';

class BuddiesPage extends StatelessWidget {
  BuddiesPage({Key? key}) : super(key: key);
  final UserPreferences _prefs = UserPreferences();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Buddies'),
      ),
      body: ListView(
        children: [
          FutureBuilder(
            future: FirebaseFirestore.instance
                .collection('users')
                .doc(_prefs.userID)
                .get(),
            builder: (context, AsyncSnapshot<DocumentSnapshot> snapshot) {
              if (snapshot.hasError) {
                return Text("Something went wrong");
              }

              if (snapshot.hasData && !snapshot.data!.exists) {
                return Text("Document does not exist");
              }

              if (snapshot.connectionState == ConnectionState.done) {
                Map<String, dynamic> data =
                    snapshot.data!.data() as Map<String, dynamic>;
                return Text(
                    "Full Name: ${data['full_name']} ${data['last_name']}");
              }

              return Text("loading");
            },
          )
        ],
      ),
    );
  }
}
