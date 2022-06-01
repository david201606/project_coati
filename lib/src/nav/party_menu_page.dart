import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:coati/src/nav/party_info_page.dart';
import 'package:coati/src/nav/parties_page.dart';
import 'package:flutter/material.dart';

import 'games_page.dart';

class PartyMenuPage extends StatefulWidget {

  final DocumentSnapshot partyDoc;

  const PartyMenuPage({Key? key, required this.partyDoc}) : super(key: key);

  @override
  State<PartyMenuPage> createState() => _PartyMenuPageState();
}

class _PartyMenuPageState extends State<PartyMenuPage> {
  int selected = 0;
  List<Widget> pages = [];

  @override
  void initState() {
    pages = [
       PartyInfoPage(partyDoc:widget.partyDoc ),
      GamesPage(people: widget.partyDoc['people']),
    ];
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: pages[selected],
      bottomNavigationBar: NavigationBar(
        selectedIndex: selected,
        labelBehavior: NavigationDestinationLabelBehavior.onlyShowSelected,
        onDestinationSelected: (value) {
          setState(() {
            selected = value;
          });
        },
        destinations: const [
          NavigationDestination(
            icon: Icon(Icons.celebration_rounded),
            label: 'Fiesta',
          ),
          NavigationDestination(
            icon: Icon(Icons.gamepad_rounded),
            label: 'Juegos',
          ),
        ],
      ),
      floatingActionButtonLocation: selected == 0
          ? FloatingActionButtonLocation.endFloat
          : FloatingActionButtonLocation.centerFloat,
    );
  }
}
