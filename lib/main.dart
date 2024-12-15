import 'package:flutter/material.dart';
import 'screens/home.dart';
import 'screens/joke_screen.dart';
import 'screens/random_joke.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Joke App',
      // initialRoute: '/',
      routes: {
        '/': (context) => const Home(),
        '/joke': (context) => JokeScreen(
            type: ModalRoute.of(context)!.settings.arguments as String),
        '/random-joke': (context) => RandomJoke(),
      },
    );
  }
}
