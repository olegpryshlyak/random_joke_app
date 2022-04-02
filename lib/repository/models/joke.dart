class Joke {
  const Joke({
    required this.id,
    required this.type,
    required this.setup,
    required this.punchline,
  });

  final int id;
  final String type;
  final String setup;
  final String punchline;

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'type': type,
      'setup': setup,
      'punchline': punchline,
    };
  }

  factory Joke.fromMap(Map<String, dynamic> map) {
    return Joke(
      id: map['id'] as int,
      type: map['type'] as String,
      setup: map['setup'] as String,
      punchline: map['punchline'] as String,
    );
  }
}
