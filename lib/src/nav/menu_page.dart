import 'package:coati/src/nav/budies_page.dart';
import 'package:coati/src/nav/home_page.dart';
import 'package:coati/src/nav/profile_page.dart';
import 'package:flutter/material.dart';

import 'new_room.dart';

class MenuPage extends StatefulWidget {
  const MenuPage({Key? key}) : super(key: key);

  @override
  State<MenuPage> createState() => _MenuPageState();
}

class _MenuPageState extends State<MenuPage> {
  int selected = 0;
  List<Widget> pages = [
    const HomePage(),
    BuddiesPage(),
    ProfilePage(),
  ];

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
            icon: Icon(Icons.rocket_launch_rounded),
            label: 'Partidas',
          ),
          NavigationDestination(
            icon: Icon(Icons.sports_kabaddi_rounded),
            label: 'Buddies',
          ),
          NavigationDestination(
            icon: Icon(Icons.account_circle_rounded),
            label: 'Perfil',
          ),
        ],
      ),
      floatingActionButtonLocation: selected == 0
          ? FloatingActionButtonLocation.endFloat
          : FloatingActionButtonLocation.centerFloat,
      floatingActionButton: selected == 0 || selected == 1
          ? FloatingActionButton.extended(
              onPressed: () {
                switch (selected) {
                  case 0:
                    Navigator.push(context, MaterialPageRoute(
                      builder: (context) {
                        return NewRoom();
                      },
                    ));
                    break;
                  case 1:
                    print('Aqui andamos');
                    break;
                }
              },
              label: Text(selected == 0 ? 'Nueva partida' : 'Nuevo buddy'),
              icon: Icon(selected == 0
                  ? Icons.sports_esports_rounded
                  : Icons.person_add_rounded),
            )
          : Container(),
    );
  }
}
