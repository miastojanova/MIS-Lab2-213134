import 'package:flutter/material.dart';
import '../service/api_services.dart';

class Home extends StatefulWidget {
  const Home({super.key});
  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  List<String> joke_types = [];
  bool isLoading = true;

  @override
  void initState() {
    super.initState();
    getJokeTypes();
  }

  void getJokeTypes() async {
    ApiServices.getJokeTypes().then((response) {
      setState(() {
        joke_types = List<String>.from(response);
        isLoading = false;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.deepPurple,
        title: const Text(
          "Jokes",
          style: TextStyle(
              color: Colors.white, fontSize: 24, fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
      ),
      body: isLoading
          ? const Center(child: CircularProgressIndicator())
          : Column(
              children: [
                Expanded(
                  child: ListView.builder(
                    itemCount: joke_types.length,
                    itemBuilder: (context, index) => ListTile(
                      title: Text(joke_types[index]),
                      trailing: const Icon(Icons.arrow_forward),
                      onTap: () {
                        Navigator.pushNamed(context, '/joke',
                            arguments: joke_types[index]);
                      },
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: ElevatedButton(
                    onPressed: () {
                      Navigator.pushNamed(context, '/random-joke');
                    },
                    child: const Text("Randomize Joke"),
                  ),
                ),
              ],
            ),
    );
  }
}
