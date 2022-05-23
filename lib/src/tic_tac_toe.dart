import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:coati/src/utils/user_preferences.dart';
import 'package:flutter/material.dart';

class TTTPage extends StatefulWidget {
  const TTTPage({Key? key, required this.doc}) : super(key: key);

  @override
  State<TTTPage> createState() => _TTTPageState();

  final DocumentSnapshot doc;
}

class _TTTPageState extends State<TTTPage> {
  final UserPreferences _prefs = UserPreferences();

  bool onTurn = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Si')),
      body: StreamBuilder<DocumentSnapshot>(
          stream: FirebaseFirestore.instance
              .collection('sesions')
              .doc(widget.doc.id)
              .snapshots(),
          builder: (context, snapshot) {
            DocumentSnapshot<Object?>? session = snapshot.data;
            Map xPlayer = {}, oPlayer = {}, home = {}, outside = {};
            onTurn = session!['turn'] == _prefs.userID;

            for (var i = 0; i < session['players'].length; ++i) {
              if (session['players'][i]['uid'] == _prefs.userID) {
                home = session['players'][i];
              } else {
                outside = session['players'][i];
              }

              if (session['players'][i]['symbol'] == '0') {
                xPlayer = session['players'][i];
              } else {
                oPlayer = session['players'][i];
              }
            }

            return SafeArea(
              child: Column(children: [
                Container(
                  decoration: BoxDecoration(
                      color: Theme.of(context).colorScheme.secondaryContainer,
                      borderRadius:
                          const BorderRadius.all(Radius.circular(20))),
                  padding:
                      const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
                  margin: const EdgeInsets.all(20),
                  child: Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(bottom: 10),
                        child: Text(
                          'Partida #${session['round']}',
                          style: Theme.of(context).textTheme.displaySmall,
                        ),
                      ),
                      Row(
                        children: [
                          const Spacer(),
                          Column(children: [
                            Icon(Icons.clear_rounded,
                                size: 30,
                                color: Theme.of(context).colorScheme.secondary),
                            Text(
                              xPlayer['points'],
                              style: Theme.of(context).textTheme.titleLarge,
                            ),
                            Text(
                              xPlayer['user'],
                              style: Theme.of(context).textTheme.labelSmall,
                            ),
                          ]),
                          const Spacer(),
                          Container(
                            width: 3,
                            height: 40,
                            decoration: BoxDecoration(
                                color: Theme.of(context).colorScheme.secondary,
                                borderRadius: const BorderRadius.all(
                                    Radius.circular(20))),
                          ),
                          const Spacer(),
                          Column(children: [
                            Icon(
                              Icons.radio_button_unchecked_rounded,
                              size: 30,
                              color: Theme.of(context).colorScheme.secondary,
                            ),
                            Text(
                              oPlayer['points'],
                              style: Theme.of(context).textTheme.titleLarge,
                            ),
                            Text(
                              oPlayer['user'],
                              style: Theme.of(context).textTheme.labelSmall,
                            )
                          ]),
                          const Spacer(),
                        ],
                      ),
                    ],
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    TTTItem(session: session, x: xPlayer, position: 'AA'),
                    TTTItem(session: session, x: xPlayer, position: 'AB'),
                    TTTItem(session: session, x: xPlayer, position: 'AC'),
                  ],
                ),
                const SizedBox(height: 20),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    TTTItem(session: session, x: xPlayer, position: 'BA'),
                    TTTItem(session: session, x: xPlayer, position: 'BB'),
                    TTTItem(session: session, x: xPlayer, position: 'BC'),
                  ],
                ),
                const SizedBox(height: 20),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    TTTItem(session: session, x: xPlayer, position: 'CA'),
                    TTTItem(session: session, x: xPlayer, position: 'CB'),
                    TTTItem(session: session, x: xPlayer, position: 'CC'),
                  ],
                ),
                Container(
                  margin: EdgeInsets.all(20),
                  padding: EdgeInsets.symmetric(horizontal: 20, vertical: 15),
                  decoration: BoxDecoration(
                      color: onTurn
                          ? Theme.of(context).colorScheme.secondary
                          : Theme.of(context).colorScheme.secondaryContainer,
                      borderRadius:
                          const BorderRadius.all(Radius.circular(20))),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        onTurn
                            ? 'Es tu turno'
                            : 'Es turno de ${outside['user']}',
                        style: Theme.of(context)
                            .textTheme
                            .titleMedium
                            ?.copyWith(
                                color: onTurn
                                    ? Theme.of(context).colorScheme.onTertiary
                                    : Theme.of(context)
                                        .colorScheme
                                        .onTertiaryContainer),
                      )
                    ],
                  ),
                )
              ]),
            );
          }),
    );
  }
}

class TTTItem extends StatelessWidget {
  TTTItem({
    Key? key,
    required this.session,
    required this.position,
    required this.x,
  }) : super(key: key);

  final DocumentSnapshot session;
  final String position;
  final Map x;
  final UserPreferences _prefs = UserPreferences();

  @override
  Widget build(BuildContext context) {
    String xStr = x['uid'];
    double box = (MediaQuery.of(context).size.width - 80) * .33;
    return InkWell(
      onTap: () {
        FirebaseFirestore.instance.collection('sesions').doc(session.id).set({
          'state': {position: _prefs.userID}
        }, SetOptions(merge: true));

        FirebaseFirestore.instance
            .collection('sesions')
            .doc(session.id)
            .get()
            .then((value) {
          Map<String, dynamic> state = value.data()!['state'];
          if (state['AA'] == _prefs.userID &&
              state['AB'] == _prefs.userID &&
              state['AC'] == _prefs.userID) {
            print('YouWin');
          } else if (state['AA'] == _prefs.userID &&
              state['AB'] == _prefs.userID &&
              state['AC'] == _prefs.userID) {
            print('YouWin');
          } else if (state['AA'] == _prefs.userID &&
              state['AB'] == _prefs.userID &&
              state['AC'] == _prefs.userID) {
            print('YouWin');
          } else if (state['AA'] == _prefs.userID &&
              state['AB'] == _prefs.userID &&
              state['AC'] == _prefs.userID) {
            print('YouWin');
          } else if (state['AA'] == _prefs.userID &&
              state['AB'] == _prefs.userID &&
              state['AC'] == _prefs.userID) {
            print('YouWin');
          } else if (state['AA'] == _prefs.userID &&
              state['AB'] == _prefs.userID &&
              state['AC'] == _prefs.userID) {
            print('YouWin');
          } else if (state['AA'] == _prefs.userID &&
              state['AB'] == _prefs.userID &&
              state['AC'] == _prefs.userID) {
            print('YouWin');
          } else if (state['AA'] == _prefs.userID &&
              state['AB'] == _prefs.userID &&
              state['AC'] == _prefs.userID) {
            print('YouWin');
          }
        });
      },
      child: Container(
        decoration: BoxDecoration(
            color: Theme.of(context).colorScheme.tertiaryContainer,
            borderRadius: const BorderRadius.all(Radius.circular(20))),
        width: box,
        height: box,
        child: Visibility(
          visible: session['state'][position] != '',
          child: Icon(
            // Icons.radio_button_unchecked_rounded,
            session['state'][position] == xStr
                ? Icons.clear_rounded
                : Icons.radio_button_unchecked_rounded,
            size: 50,
          ),
        ),
      ),
    );
  }
}
