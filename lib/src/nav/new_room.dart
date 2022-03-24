import 'package:flutter/material.dart';

class NewRoom extends StatelessWidget {
  const NewRoom({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Crea tu consola'),
      ),
      body: ListView(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 10),
            child: Text(
              'Qué quieren jugar?',
              style: Theme.of(context).textTheme.displaySmall,
            ),
          ),
          ListTile(
            leading: const Icon(Icons.accessibility_new_rounded),
            title: const Text('Horcado'),
            subtitle: const Text('2-5 personas pueden jugar'),
            onTap: (){

            },
          ),ListTile(
            leading: const Icon(Icons.accessibility_new_rounded),
            title: const Text('Destruye el barco'),
            subtitle: const Text('2 personas pueden jugar'),
            onTap: (){

            },
          ),

        ],
      ),
    );
  }
}
