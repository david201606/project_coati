import 'dart:math';

class Challenge {
  List<String> challenges() => [
        '1 shot',
        '2 shots',
        'Shot a quien tu quieras',
        'Shot y 10 vueltas',
        '¿A quién te gustaría besar de este grupo?',
        'Háblale sucio a otro jugador',
        'Canta una canción a elección de los demas (a todo pulmón)',
        'Toma cualquier alimento y comelo sensualmente',
        '',
      ];

  String randomizedChallenge() {
    return challenges()[Random().nextInt(challenges().length)];
  }
}
