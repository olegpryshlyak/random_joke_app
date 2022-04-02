import 'package:flutter/material.dart';
import 'package:random_joke_app/ui/joke/joke_page.dart';

void main() {
  runApp(const RandomJokeApp());
}

class RandomJokeApp extends StatelessWidget {
  const RandomJokeApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Random Joke App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const JokePage(),
    );
  }
}
