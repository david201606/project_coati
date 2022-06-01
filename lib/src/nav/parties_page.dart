import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:coati/src/nav/party_menu_page.dart';
import 'package:flutter/material.dart';

class PartiesPage extends StatelessWidget {
  const PartiesPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Mis Fiestas'),
      ),
      body: StreamBuilder(
          stream: FirebaseFirestore.instance
              .collection('users')
              .doc('9jd6knysI3ePBYIXhgj5wWM7nAx1')
              .collection('parties')
              .snapshots(),
          builder: (context, AsyncSnapshot<QuerySnapshot>? snapshot) {
            if (!snapshot!.hasData) {
              return const Center(
                child: Text('No tienes fiestas :('),
              );
            }

            List<Widget> parties = [];
            for (var i = 0; i < snapshot.data!.docs.length; ++i) {
              parties.add(
                ListTile(
                  leading: const Icon(Icons.cake_rounded),
                  title: Text(snapshot.data!.docs[i]['name']),
                  subtitle: Text('${snapshot.data!.docs[i]['people'].length} cabrones en este reve'),
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) =>
                              PartyMenuPage(partyDoc: snapshot.data!.docs[i]),
                        ));
                  },
                ),
              );
            }

            return ListView(
              children: parties,
            );
          }),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {},
        label: Text('Crear fiesta'),
        icon: Row(
          children: const [
            Icon(Icons.add_rounded),
            Icon(Icons.liquor_rounded),
          ],
        ),
      ),
    );
  }
}
