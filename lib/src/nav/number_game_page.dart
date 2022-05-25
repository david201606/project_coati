import 'dart:math';

import 'package:flutter/material.dart';

import '../utils/card_obj.dart';

class NumbersGamePage extends StatefulWidget {
  const NumbersGamePage({Key? key}) : super(key: key);

  @override
  State<NumbersGamePage> createState() => _NumbersGamePageState();
}

class _NumbersGamePageState extends State<NumbersGamePage> {
  List<PlayCard> cardDeck = Deck().cards();
  List<String> cardsOrder = Deck().cardOrder();

  late PlayCard playingCard;

  @override
  void initState() {
    playingCard = PlayCard('S', Theme.of(context).colorScheme.primary,
        Icons.theater_comedy_rounded, 0);
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
        content: Text('Te echas un shot'),
        actions: [
          TextButton(
            onPressed: () {
              Navigator.pop(context);
            },
            child: Text('Listo'),
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
        content: Text('Todos se echan un shot'),
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
                  '1, 2, 3, ...',
                  style: Theme.of(context).textTheme.headlineSmall,
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 20),
                child: PlayingCard(
                  card: playingCard,
                ),
              ),
              SizedBox(
                width: (MediaQuery.of(context).size.width * .7) - 100,
                child: Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 15),
                      child: Text(
                        '',
                        style: Theme.of(context).textTheme.headlineSmall,
                      ),
                    ),
                    Expanded(
                      child: ElevatedButton(
                          onPressed: () {
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
                          style: ElevatedButton.styleFrom(
                              primary: Theme.of(context).colorScheme.primary,
                              onPrimary:
                                  Theme.of(context).colorScheme.onPrimary),
                          child: Text('Siguente Carta')),
                    ),
                  ],
                ),
              ),
            ],
          ),
          const Spacer(),
          Container(
            padding: EdgeInsets.symmetric(horizontal: 20),
            color: Colors.black87,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                IconButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    icon: const Icon(Icons.stop_rounded, color: Colors.white)),
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
          color: Colors.white,
          border: Border.all(color: Colors.black, width: 3),
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
                  size: 140,
                ),
                Text(
                  card.number,
                  style: Theme.of(context).textTheme.displayLarge!.copyWith(
                      color: Theme.of(context).colorScheme.background,
                      fontSize: 50),
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
