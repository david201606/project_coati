import 'dart:math';

import 'package:animate_do/animate_do.dart';
import 'package:coati/src/utils/challenge.dart';
import 'package:flutter/material.dart';

import '../../utils/card_obj.dart';

class UpOrDown extends StatefulWidget {
  const UpOrDown({Key? key}) : super(key: key);

  @override
  State<UpOrDown> createState() => _UpOrDownState();
}

class _UpOrDownState extends State<UpOrDown> {
  List<PlayCard> cardDeck = Deck().cards();
  AnimationController? animateController;
  late PlayCard playingCard;

  @override
  void initState() {
    mixDeck();

    super.initState();
  }

  mixDeck() {
    setState(() {
      int position = Random().nextInt(cardDeck.length);
      playingCard = cardDeck[position];
      cardDeck.removeAt(position);
    });
  }

  shotDialog() {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text('Oops'),
        content: Text(Challenge().randomizedChallenge()),
        actions: [
          TextButton(
            onPressed: () {
              Navigator.pop(context);
            },
            child: const Text('Listo'),
          ),
        ],
      ),
    );
  }

  allShotDialog() {
    showDialog(
      barrierDismissible: false,
      context: context,
      builder: (context) => AlertDialog(
        title: Text('¡JA-JA!'),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text('Todos hacen esto'),
            Text(Challenge().randomizedChallenge()),
          ],
        ),
        actions: [
          TextButton(
            onPressed: () {
              mixDeck();
              Navigator.pop(context);
            },
            child: Text('Listo'),
          ),
        ],
      ),
    );
  }

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
                  '¿Mayor o Menor?',
                  style: Theme.of(context).textTheme.headlineSmall,
                ),
              ),
              SizedBox(
                width: MediaQuery.of(context).size.width * .7,
                child: ElevatedButton(
                  onPressed: () async {
                    animateController!.repeat();
                    await Future.delayed(const Duration(milliseconds: 300));

                    PlayCard pastCard = playingCard;
                    mixDeck();

                    if (playingCard.weight == 100) {
                      allShotDialog();
                    } else {
                      if (playingCard.weight < pastCard.weight) {
                        shotDialog();
                      }
                    }
                  },
                  child: Text('Mayor'),
                  style: ElevatedButton.styleFrom(
                      padding: EdgeInsets.symmetric(vertical: 25),
                      primary: Theme.of(context).colorScheme.primary,
                      onPrimary: Theme.of(context).colorScheme.onPrimary),
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 20),
                child: Spin(
                  manualTrigger: true,
                  controller: (controller) => animateController = controller,
                  child: PlayingCard(
                    card: playingCard,
                  ),
                ),
              ),
              SizedBox(
                width: MediaQuery.of(context).size.width * .7,
                child: ElevatedButton(
                  onPressed: () async {
                    animateController!.repeat();
                    await Future.delayed(const Duration(milliseconds: 300));
                    PlayCard pastCard = playingCard;
                    mixDeck();

                    if (playingCard.weight == 100) {
                      allShotDialog();
                    } else {
                      if (playingCard.weight > pastCard.weight) {
                        shotDialog();
                      }
                    }
                  },
                  child: Text('Menor'),
                  style: ElevatedButton.styleFrom(
                      padding: EdgeInsets.symmetric(vertical: 25),
                      primary: Theme.of(context).colorScheme.primary,
                      onPrimary: Theme.of(context).colorScheme.onPrimary),
                ),
              ),
            ],
          ),
          const Spacer(),
          Container(
            padding: EdgeInsets.symmetric(horizontal: 20),
            color: Theme.of(context).colorScheme.onBackground,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                IconButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    icon: Icon(Icons.cancel_rounded,
                        color: Theme.of(context).colorScheme.background)),
                Text(
                  'Restan ${cardDeck.length} cartas',
                  style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                      color: Theme.of(context).colorScheme.background),
                ),
              ],
            ),
          ),
        ]),
      ),
    );
  }
}

class PlayingCard extends StatelessWidget {
  final PlayCard card;

  const PlayingCard({
    Key? key,
    required this.card,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      borderRadius: const BorderRadius.all(
        Radius.circular(30),
      ),
      child: Container(
        width: MediaQuery.of(context).size.width * .7,
        height: MediaQuery.of(context).size.height * .5,
        decoration: BoxDecoration(
          color: Theme.of(context).colorScheme.background,
          border: Border.all(
              color: Theme.of(context).colorScheme.onBackground, width: 3),
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
                        card.number,
                        style: Theme.of(context).textTheme.headlineSmall,
                      ),
                      Icon(card.icon, color: card.color, size: 30),
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
                  card.icon,
                  color: card.color,
                  size: 100,
                ),
                Text(
                  card.number,
                  style: Theme.of(context).textTheme.displayLarge!.copyWith(
                      color: Theme.of(context).colorScheme.background,
                      fontSize: 40),
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
                            card.icon,
                            color: card.color,
                            size: 30,
                          )),
                      Transform.rotate(
                          angle: 3.14159,
                          child: Text(
                            card.number,
                            style: Theme.of(context).textTheme.headlineSmall,
                          )),
                    ],
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
