import 'package:coati/src/nav/home_page.dart';
import 'package:coati/src/nav/menu_page.dart';
import 'package:flutter/material.dart';
import 'dart:math';

class TocaToca extends StatefulWidget {
  const TocaToca({Key? key}) : super(key: key);

  @override
  State<TocaToca> createState() => _TocaTocaState();
}

class _TocaTocaState extends State<TocaToca> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Row(
        children: [
          Column(
            children: [
              InkWell(
                onLongPress: () {
                  showDialog(
                    barrierDismissible: false,
                    context: context,
                    builder: (context) => AlertDialog(
                        title:
                            const Text('Mijo... Ya valio... 5seg en botella'),
                        actions: [
                          ElevatedButton(
                              onPressed: () {
                                Navigator.pop(context);
                                setState(() {});
                              },
                              child: const Text('Simona'))
                        ]),
                  );
                },
                child: Container(
                  margin: const EdgeInsets.all(8),
                  width: (MediaQuery.of(context).size.width * .5) - 16,
                  height: (MediaQuery.of(context).size.height * .5) - 16,
                  color: Colors.green[100],
                ),
              ),
              InkWell(
                onLongPress: () {
                  main() {
                    var rng = new Random();
                    for (var i = 0; i < 10; i++) {
                      print(rng.nextInt(100));
                    }
                  }
                },
                child: Container(
                  margin: const EdgeInsets.all(8),
                  width: (MediaQuery.of(context).size.width * .5) - 16,
                  height: (MediaQuery.of(context).size.height * .5) - 16,
                  color: Colors.purple[100],
                ),
              ),
            ],
          ),
          Column(
            children: [
              InkWell(
                onLongPress: () {
                  print('Azul');
                },
                child: Container(
                  margin: const EdgeInsets.all(8),
                  width: (MediaQuery.of(context).size.width * .5) - 16,
                  height: (MediaQuery.of(context).size.height * .5) - 16,
                  color: Colors.teal[100],
                ),
              ),
              InkWell(
                onLongPress: () {
                  print('Rojo');
                },
                child: Container(
                  margin: const EdgeInsets.all(8),
                  width: (MediaQuery.of(context).size.width * .5) - 16,
                  height: (MediaQuery.of(context).size.height * .5) - 16,
                  color: Colors.red[100],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
