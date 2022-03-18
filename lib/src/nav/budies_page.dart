import 'package:flutter/material.dart';

class BuddiesPage extends StatelessWidget {
  const BuddiesPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Buddies'),
      ),
      body: Center(
          child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(
            Icons.sentiment_dissatisfied_rounded,
            size: 200,
            color: Theme.of(context).colorScheme.tertiaryContainer,
          ),
          Text('No tienes buddies agregados')
        ],
      )),

    );
  }
}
