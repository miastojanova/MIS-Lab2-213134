import 'package:flutter/material.dart';
import '../service/api_services.dart';
import '../models/joke.dart';
import '../widgets/card.dart';

class JokeScreen extends StatefulWidget {
  final String type;

  const JokeScreen({required this.type, super.key});

  @override
  _JokeScreenState createState() => _JokeScreenState();
}

class _JokeScreenState extends State<JokeScreen> {
  List<Joke> jokes = [];

  void getJokes() async {
    final getJokes =
        await ApiServices.getJokesByType(widget.type); //zima tip preku api
    setState(() {
      jokes = getJokes;
    });
  }

  @override
  void initState() {
    super.initState();
    getJokes();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('${widget.type} Jokes'),
      ),
      body: jokes.isEmpty
          ? const Center(child: CircularProgressIndicator())
          : ListView.builder(
              itemCount: jokes.length,
              itemBuilder: (context, index) {
                return JokeCard(joke: jokes[index]);
              },
            ),
    );
  }
}
