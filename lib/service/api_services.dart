import 'package:http/http.dart' as http;
import 'dart:convert';

import '../models/joke.dart';

class ApiServices {
  static Future<List<String>> getJokeTypes() async {
    const url = 'https://official-joke-api.appspot.com/types';

    final response = await http.get(Uri.parse(url));

    if (response.statusCode == 200) {
      return List<String>.from(json.decode(response.body));
    } else {
      throw Exception('Failed to load. Tru again');
    }
  }

  static Future<List<Joke>> getJokesByType(String type) async {
    final url = 'https://official-joke-api.appspot.com/jokes/$type/ten';
    final response = await http.get(Uri.parse(url));

    if (response.statusCode == 200) {
      final List jokesJson = json.decode(response.body);
      return jokesJson.map((joke) => Joke.fromJson(joke)).toList();
    } else {
      throw Exception('Failed to load. Try again');
    }
  }

  static Future<Joke> getRandomJoke() async {
    const url = 'https://official-joke-api.appspot.com/random_joke';
    final response = await http.get(Uri.parse(url));

    if (response.statusCode == 200) {
      return Joke.fromJson(json.decode(response.body));
    } else {
      throw Exception('Failed to load try again');
    }
  }
}
