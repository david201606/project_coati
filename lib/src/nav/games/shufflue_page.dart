import 'dart:math';

import 'package:flutter/material.dart';

class ShufflePage extends StatefulWidget {
  final List<dynamic> people;

  const ShufflePage({Key? key, required this.people}) : super(key: key);

  @override
  State<ShufflePage> createState() => _ShufflePageState();
}

class _ShufflePageState extends State<ShufflePage> {
  int winnerPos = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            for (var i = 1; i <= widget.people.length; ++i)
              RandomItem(
                name: widget.people[i-1],
                size: winnerPos == i ? 3 : 1,
                position: winnerPos == 0 ? i : winnerPos,
                color: winnerPos == i
                    ? Colors.red
                    : i % 2 == 0
                        ? Colors.cyan
                        : Colors.greenAccent,
              ),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
              color: Colors.black87,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  IconButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      icon: const Icon(Icons.cancel_rounded,
                          color: Colors.white)),
                  ElevatedButton(
                      onPressed: () {
                        setState(() {
                          int num = Random().nextInt(widget.people.length) + 1;
                          winnerPos = num;
                        });
                      },
                      child: const Text('Revolver'))
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class RandomItem extends StatelessWidget {
  final String name;
  final int position;
  final Color color;
  final int size;

  const RandomItem({
    Key? key,
    required this.position,
    required this.color,
    required this.size,
    required this.name,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      flex: size,
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 200),
        decoration: BoxDecoration(
            color: color, border: Border.all(color: Colors.black, width: 2)),
        width: MediaQuery.of(context).size.width,
        child: Center(
            child: Text(
          name,
          style: Theme.of(context).textTheme.displayMedium,
        )),
      ),
    );
  }
}
