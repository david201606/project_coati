import 'package:coati/src/utils/challenge.dart';
import 'package:flutter/material.dart';

class StrugglePage extends StatefulWidget {
  const StrugglePage({Key? key}) : super(key: key);

  @override
  State<StrugglePage> createState() => _StrugglePageState();
}

class _StrugglePageState extends State<StrugglePage> {
  int a = 0;
  int red = 0, blue = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.all(10),
                child: Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(15),
                      child: Text('$blue',
                          style: Theme.of(context).textTheme.displayMedium),
                    ),
                    Expanded(
                      child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                              primary: Colors.blue,
                              padding: const EdgeInsets.symmetric(vertical: 20),
                              onPrimary:
                                  Theme.of(context).colorScheme.background),
                          onPressed: () {
                            if (a > -3) {
                              setState(() {
                                a--;
                              });
                            } else {
                              showDialog(
                                barrierDismissible: false,
                                context: context,
                                builder: (context) => AlertDialog(
                                    title: const Text('Gano azul'),
                                    content:
                                        Text(Challenge().randomizedChallenge()),
                                    actions: [
                                      ElevatedButton(
                                          onPressed: () {
                                            Navigator.pop(context);
                                            setState(() {
                                              a = 0;
                                              blue++;
                                            });
                                          },
                                          child: const Text('De acuerdo'))
                                    ]),
                              );
                            }
                          },
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: const [
                              Icon(Icons.arrow_downward_rounded),
                              Icon(Icons.arrow_downward_rounded),
                              Icon(Icons.arrow_downward_rounded),
                              Icon(Icons.arrow_downward_rounded),
                            ],
                          )),
                    ),
                  ],
                ),
              ),
              const Spacer(),
              Item(a: a, number: 3),
              Item(a: a, number: 2),
              Item(a: a, number: 1),
              Container(
                color: a == 0
                    ? Theme.of(context).colorScheme.onBackground
                    : Theme.of(context).colorScheme.background,
                child: Center(
                    child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    IconButton(
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        icon:
                            const Icon(Icons.stop_rounded, color: Colors.grey)),
                    Text(
                      '${a < 0 ? a * -1 : a}',
                      style: Theme.of(context)
                          .textTheme
                          .displayMedium!
                          .copyWith(
                              color: Theme.of(context).colorScheme.background),
                    ),
                    Container(),
                    /*IconButton(
                        onPressed: () {},
                        icon: Icon(Icons.pause_rounded, color: Colors.grey)),*/
                  ],
                )),
                height: 70,
                width: double.infinity,
              ),
              Item(a: a, number: -1),
              Item(a: a, number: -2),
              Item(a: a, number: -3),
              const Spacer(),
              Padding(
                padding: const EdgeInsets.all(10),
                child: Row(
                  children: [
                    Expanded(
                      child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                              primary: Colors.red,
                              padding: const EdgeInsets.symmetric(vertical: 20),
                              onPrimary:
                                  Theme.of(context).colorScheme.background),
                          onPressed: () {
                            if (a < 3) {
                              setState(() {
                                a++;
                              });
                            } else {
                              showDialog(
                                barrierDismissible: false,
                                context: context,
                                builder: (context) => AlertDialog(
                                    title: const Text('Gano Rojo'),
                                    content:
                                    Text(Challenge().randomizedChallenge()),
                                    actions: [
                                      ElevatedButton(
                                          onPressed: () {
                                            Navigator.pop(context);
                                            setState(() {
                                              a = 0;
                                              red++;
                                            });
                                          },
                                          child: const Text('De acuerdo'))
                                    ]),
                              );
                            }
                          },
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: const [
                              Icon(Icons.arrow_upward_rounded),
                              Icon(Icons.arrow_upward_rounded),
                              Icon(Icons.arrow_upward_rounded),
                              Icon(Icons.arrow_upward_rounded),
                            ],
                          )),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(15),
                      child: Text('$red',
                          style: Theme.of(context).textTheme.displayMedium),
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class Item extends StatelessWidget {
  final int number;

  const Item({
    Key? key,
    required this.a,
    required this.number,
  }) : super(key: key);

  final int a;

  @override
  Widget build(BuildContext context) {
    return Container(
      color: a == number
          ? Theme.of(context).colorScheme.onBackground
          : Theme.of(context).colorScheme.background,
      child: Center(
          child: Text(
        '${a < 0 ? a * -1 : a}',
        style: Theme.of(context)
            .textTheme
            .displayMedium!
            .copyWith(color: Theme.of(context).colorScheme.background),
      )),
      height: 70,
      width: double.infinity,
    );
  }
}
