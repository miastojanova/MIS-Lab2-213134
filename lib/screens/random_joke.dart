import 'package:flutter/material.dart';
import '../service/api_services.dart';
import '../models/joke.dart';

class RandomJoke extends StatefulWidget {
  //const JokeScreen({super.key});

  @override
  _RandomJokeState createState() => _RandomJokeState();
}

class _RandomJokeState extends State<RandomJoke> {
  Joke? randomJoke;
  bool isLoading = true;

  @override
  void initState() {
    super.initState();
    getRandomJoke();
  }

  void getRandomJoke() async {
    try {
      final joke = await ApiServices.getRandomJoke();
      setState(() {
        randomJoke = joke;
        isLoading = false;
      });
    } catch (e) {
      setState(() {
        isLoading = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Random Joke'),
      ),
      body: isLoading
          ? Center(child: CircularProgressIndicator())
          : Center(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    randomJoke!.setup,
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                    textAlign: TextAlign.center,
                  ),
                  SizedBox(height: 10),
                  Text(
                    randomJoke!.punchline,
                    style: TextStyle(fontSize: 16),
                    textAlign: TextAlign.center,
                  ),
                ],
              ),
            ),
    );
  }
}
