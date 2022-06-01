import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class PartyInfoPage extends StatelessWidget {
  final DocumentSnapshot partyDoc;

  const PartyInfoPage({Key? key, required this.partyDoc}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text('${partyDoc['name']}'),
      ),
      body: ListView(
        children: const [
          Text('lets go'),
        ],
      ),
    );
  }
}
