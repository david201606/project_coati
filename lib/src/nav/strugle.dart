import 'package:flutter/material.dart';

class StruglePage extends StatefulWidget {
  StruglePage({Key? key}) : super(key: key);

  @override
  State<StruglePage> createState() => _StruglePageState();
}

class _StruglePageState extends State<StruglePage> {
  int a = 0;

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
                child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        primary: Colors.blue,
                        padding: const EdgeInsets.symmetric(vertical: 20),
                        onPrimary: Theme.of(context).colorScheme.background),
                    onPressed: () {
                      if (a > -3) {
                        setState(() {
                          a--;
                        });
                      } else {
                        showDialog(
                          barrierDismissible: false,
                          context: context,
                          builder: (context) =>
                              AlertDialog(title: Text('Gano azul'), actions: [
                            ElevatedButton(
                                onPressed: () {
                                  Navigator.pop(context);
                                  setState(() {
                                    a = 0;
                                  });
                                },
                                child: Text('De acuerdo'))
                          ]),
                        );
                      }
                    },
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(Icons.arrow_downward_rounded),
                        Icon(Icons.arrow_downward_rounded),
                        Icon(Icons.arrow_downward_rounded),
                        Icon(Icons.arrow_downward_rounded),
                      ],
                    )),
              ),
              Spacer(),
              Item(a: a, number: 3),
              Item(a: a, number: 2),
              Item(a: a, number: 1),
              Item(a: a, number: 0),
              Item(a: a, number: -1),
              Item(a: a, number: -2),
              Item(a: a, number: -3),
              Spacer(),
              Padding(
                padding: const EdgeInsets.all(10),
                child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        primary: Colors.red,
                        padding: const EdgeInsets.symmetric(vertical: 20),
                        onPrimary: Theme.of(context).colorScheme.background),
                    onPressed: () {
                      if (a < 3) {
                        setState(() {
                          a++;
                        });
                      } else {
                        showDialog(
                          barrierDismissible: false,
                          context: context,
                          builder: (context) =>
                              AlertDialog(title: Text('Gano Rojo'), actions: [
                            ElevatedButton(
                                onPressed: () {
                                  Navigator.pop(context);
                                  setState(() {
                                    a = 0;
                                  });
                                },
                                child: Text('De acuerdo'))
                          ]),
                        );
                      }
                    },
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(Icons.arrow_upward_rounded),
                        Icon(Icons.arrow_upward_rounded),
                        Icon(Icons.arrow_upward_rounded),
                        Icon(Icons.arrow_upward_rounded),
                      ],
                    )),
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
        '$a',
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
