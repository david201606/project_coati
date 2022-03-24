import 'package:coati/src/nav/auth_page.dart';
import 'package:coati/src/utils/auth_service.dart';
import 'package:coati/src/utils/user_preferences.dart';
import 'package:flutter/material.dart';

class ProfilePage extends StatelessWidget {
  ProfilePage({Key? key}) : super(key: key);

  final UserPreferences _prefs = UserPreferences();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Tú'),
      ),
      body: ListView(
        children: [
          ListTile(
            title: Text(_prefs.userName),
            subtitle: Text(_prefs.userEmail),
          ),
          const ListTile(
            title: const Text('Logros'),
          ),
          const ListTile(
            title: Text('Partidas'),
            subtitle: Text('Haz ganado 0 partidas (Jaja no vale madre)'),
          ),
          ElevatedButton(
              onPressed: () {
                AuthService().signOut();
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const AuthPage(),
                  ),
                );
              },
              child: const Text('Cerrar sesion'))
        ],
      ),
    );
  }
}
