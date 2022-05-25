import 'package:flutter/material.dart';

class Deck {
  List<PlayCard> cards() {
    return [
      PlayCard('A', Colors.red, Icons.favorite_rounded, 1),
      PlayCard('2', Colors.red, Icons.favorite_rounded, 2),
      PlayCard('3', Colors.red, Icons.favorite_rounded, 3),
      PlayCard('4', Colors.red, Icons.favorite_rounded, 4),
      PlayCard('5', Colors.red, Icons.favorite_rounded, 5),
      PlayCard('6', Colors.red, Icons.favorite_rounded, 6),
      PlayCard('7', Colors.red, Icons.favorite_rounded, 7),
      PlayCard('8', Colors.red, Icons.favorite_rounded, 8),
      PlayCard('9', Colors.red, Icons.favorite_rounded, 9),
      PlayCard('10', Colors.red, Icons.favorite_rounded, 10),
      PlayCard('J ', Colors.red, Icons.favorite_rounded, 11),
      PlayCard('Q', Colors.red, Icons.favorite_rounded, 12),
      PlayCard('K', Colors.red, Icons.favorite_rounded, 13),
      PlayCard('A', Colors.red, Icons.square_rounded, 1),
      PlayCard('2', Colors.red, Icons.square_rounded, 2),
      PlayCard('3', Colors.red, Icons.square_rounded, 3),
      PlayCard('4', Colors.red, Icons.square_rounded, 4),
      PlayCard('5', Colors.red, Icons.square_rounded, 5),
      PlayCard('6', Colors.red, Icons.square_rounded, 6),
      PlayCard('7', Colors.red, Icons.square_rounded, 7),
      PlayCard('8', Colors.red, Icons.square_rounded, 8),
      PlayCard('9', Colors.red, Icons.square_rounded, 9),
      PlayCard('10', Colors.red, Icons.square_rounded, 10),
      PlayCard('J ', Colors.red, Icons.square_rounded, 11),
      PlayCard('Q', Colors.red, Icons.square_rounded, 12),
      PlayCard('K', Colors.red, Icons.square_rounded, 13),
      PlayCard('A', Colors.black, Icons.hexagon_rounded, 1),
      PlayCard('2', Colors.black, Icons.hexagon_rounded, 2),
      PlayCard('3', Colors.black, Icons.hexagon_rounded, 3),
      PlayCard('4', Colors.black, Icons.hexagon_rounded, 4),
      PlayCard('5', Colors.black, Icons.hexagon_rounded, 5),
      PlayCard('6', Colors.black, Icons.hexagon_rounded, 6),
      PlayCard('7', Colors.black, Icons.hexagon_rounded, 7),
      PlayCard('8', Colors.black, Icons.hexagon_rounded, 8),
      PlayCard('9', Colors.black, Icons.hexagon_rounded, 9),
      PlayCard('10', Colors.black, Icons.hexagon_rounded, 10),
      PlayCard('J ', Colors.black, Icons.hexagon_rounded, 11),
      PlayCard('Q', Colors.black, Icons.hexagon_rounded, 12),
      PlayCard('K', Colors.black, Icons.hexagon_rounded, 13),
      PlayCard('A', Colors.black, Icons.fiber_manual_record_rounded, 1),
      PlayCard('2', Colors.black, Icons.fiber_manual_record_rounded, 2),
      PlayCard('3', Colors.black, Icons.fiber_manual_record_rounded, 3),
      PlayCard('4', Colors.black, Icons.fiber_manual_record_rounded, 4),
      PlayCard('5', Colors.black, Icons.fiber_manual_record_rounded, 5),
      PlayCard('6', Colors.black, Icons.fiber_manual_record_rounded, 6),
      PlayCard('7', Colors.black, Icons.fiber_manual_record_rounded, 7),
      PlayCard('8', Colors.black, Icons.fiber_manual_record_rounded, 8),
      PlayCard('9', Colors.black, Icons.fiber_manual_record_rounded, 9),
      PlayCard('10', Colors.black, Icons.fiber_manual_record_rounded, 10),
      PlayCard('J ', Colors.black, Icons.fiber_manual_record_rounded, 11),
      PlayCard('Q', Colors.black, Icons.fiber_manual_record_rounded, 12),
      PlayCard('K', Colors.black, Icons.fiber_manual_record_rounded, 13),
      PlayCard('', Colors.black, Icons.theater_comedy_rounded, 100),
      PlayCard('', Colors.red, Icons.theater_comedy_rounded, 100),
      PlayCard('', Colors.black, Icons.theater_comedy_rounded, 100),
      PlayCard('', Colors.red, Icons.theater_comedy_rounded, 100),
    ];
  }

  List<String> cardOrder() =>
      ['A', '2', '3', '4', '5', '6', '7', '8', '9', '10', 'J', 'Q', 'K'];
}

class PlayCard {
  String _number;
  Color _color;
  IconData _icon;
  int _weight;

  PlayCard(this._number, this._color, this._icon, this._weight);

  int get weight => _weight;

  set weight(int value) {
    _weight = value;
  }

  IconData get icon => _icon;

  set icon(IconData value) {
    _icon = value;
  }

  Color get color => _color;

  set color(Color value) {
    _color = value;
  }

  String get number => _number;

  set number(String value) {
    _number = value;
  }
}
