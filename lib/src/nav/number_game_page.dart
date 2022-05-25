import 'dart:math';

import 'package:coati/src/nav/upOrDownPage.dart';
import 'package:flutter/material.dart';

import '../utils/card_obj.dart';
import '../utils/challenge.dart';

class NumbersGamePage extends StatefulWidget {
  const NumbersGamePage({Key? key}) : super(key: key);

  @override
  State<NumbersGamePage> createState() => _NumbersGamePageState();
}

class _NumbersGamePageState extends State<NumbersGamePage> {
  List<PlayCard> cardDeck = Deck().cards();
  List<String> cardsOrder = Deck().cardOrder();
  int position = 0;
  late PlayCard playingCard;

  bool starting = true;

  @override
  void initState() {
    playingCard = PlayCard('', Colors.green, Icons.play_arrow_rounded, 0);
    super.initState();
  }

  nextPosition() {
    setState(() {
      if (position == (cardsOrder.length - 1)) {
        position = 0;
      } else {
        position++;
      }
    });
  }

  mixDeck() {
    setState(() {
      if (cardDeck.isEmpty) {
        cardDeck = Deck().cards();
      }

      int position = Random().nextInt(cardDeck.length);
      playingCard = cardDeck[position];
      cardDeck.removeAt(position);
    });
  }

  shotDialog() {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text('¡Shot!'),
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
              Navigator.pop(context);
            },
            child: Text('Continuar'),
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
                  'A, 2, ..., Q, K',
                  style: Theme.of(context).textTheme.headlineSmall,
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 20),
                child: PlayingCard(
                  card: playingCard,
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(bottom: 10),
                child: Text(
                  starting ? '' : cardsOrder[position],
                  style: Theme.of(context).textTheme.headlineSmall,
                ),
              ),
              SizedBox(
                width: (MediaQuery.of(context).size.width * .7),
                child: ElevatedButton(
                    onPressed: () {
                      mixDeck();
                      if (!starting) nextPosition();

                      if (playingCard.number == '') {
                        allShotDialog();
                      } else {
                        if (playingCard.number == cardsOrder[position]) {
                          shotDialog();
                        }
                      }

                      setState(() {
                        starting = false;
                      });
                    },
                    style: ElevatedButton.styleFrom(
                        primary: Theme.of(context).colorScheme.primary,
                        onPrimary: Theme.of(context).colorScheme.onPrimary),
                    child: Text(starting ? 'Empezar' : 'Siguente Carta')),
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
                  'Juego sin fin',
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
