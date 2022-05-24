import 'package:flutter/material.dart';

class UpOrDown extends StatefulWidget {
  const UpOrDown({Key? key}) : super(key: key);

  @override
  State<UpOrDown> createState() => _UpOrDownState();
}

class _UpOrDownState extends State<UpOrDown> {



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(children: [
          const Spacer(),
          Column(
            children: [
              Padding(
                padding: const EdgeInsets.only(bottom: 20),
                child: Text(
                  '¿Arriba o Abajo?',
                  style: Theme.of(context).textTheme.headlineSmall,
                ),
              ),
              PlayingCard(
                color: Colors.red,
                number: 'K',
                icon: Icons.favorite,
                onTap: () {},
              ),
            ],
          ),
          const Spacer(),
          Row(
            children: const [Text('Restan 100 cartas')],
          ),
        ]),
      ),
    );
  }
}

class PlayingCard extends StatelessWidget {
  final Function() onTap;
  final IconData icon;
  final String number;
  final Color color;

  const PlayingCard({
    Key? key,
    required this.icon,
    required this.number,
    required this.color,
    required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      borderRadius: BorderRadius.all(
        Radius.circular(30),
      ),
      onTap: () {},
      onLongPress: () {},
      child: Container(
        width: MediaQuery.of(context).size.width * .7,
        height: MediaQuery.of(context).size.height * .5,
        decoration: BoxDecoration(
          // color: Colors.red,
          border: Border.all(color: Colors.black, width: 2),
          borderRadius: const BorderRadius.all(
            Radius.circular(30),
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                Padding(
                  padding: const EdgeInsets.all(20),
                  child: Column(
                    children: [
                      Text(
                        number,
                        style: Theme.of(context).textTheme.headlineSmall,
                      ),
                      Icon(icon, color: color, size: 30),
                    ],
                  ),
                ),
              ],
            ),
            Stack(
              alignment: Alignment.center,
              // mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(
                  icon,
                  color: color,
                  size: 140,
                ),
                Text(
                  number,
                  style: Theme.of(context).textTheme.displayLarge!.copyWith(
                      color: Theme.of(context).colorScheme.background,fontSize: 50),
                )
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Padding(
                  padding: const EdgeInsets.all(20),
                  child: Column(
                    children: [
                      Transform.rotate(
                          angle: 3.14159,
                          child: Icon(
                            icon,
                            color: color,
                            size: 30,
                          )),
                      Transform.rotate(
                          angle: 3.14159,
                          child: Text(
                            number,
                            style: Theme.of(context).textTheme.headlineSmall,
                          )),
                    ],
                  ),
                ),
                /*Padding(
                  padding: const EdgeInsets.all(20),
                  child: Transform.rotate(
                      angle: 3.14159,
                      child: const Icon(
                        Icons.fiber_manual_record_rounded,
                        color: Colors.black,
                        size: 40,
                      )),
                ),*/
              ],
            ),
          ],
        ),
      ),
    );
  }
}
