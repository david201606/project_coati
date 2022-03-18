import 'package:flutter/material.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Tú'),
      ),
      body: ListView(
        children:  [
          const Text('Aja, muchas cosas'),
          ElevatedButton(onPressed: () {

          }, child: Text('Cerrar sesion'))
        ],
      ),
    );
  }
}
