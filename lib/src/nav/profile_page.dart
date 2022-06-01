import 'package:flutter/material.dart';

class ProfilePage extends StatefulWidget {
  ProfilePage({Key? key}) : super(key: key);

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  // final UserPreferences _prefs = UserPreferences();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Tú'),
      ),
      body: ListView(
        children: const [
          ListTile(
            title: Text('David'),
            subtitle: Text('El sholo'),
          ),
          ListTile(
            title: Text('Logros'),
          ),
          ListTile(
            title: Text('Partidas'),
            subtitle: Text('Haz ganado 0 partidas (Jaja no vale madre)'),
          ),
        ],
      ),
    );
  }
}
