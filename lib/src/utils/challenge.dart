import 'dart:math';

class Challenge {
  List<String> challenges() => [
        '1 shot',
        '2 shots',
        'Shot a quien tu quieras',
      ];

  String randomizedChallenge() {
    return challenges()[Random().nextInt(challenges().length)];
  }
}
