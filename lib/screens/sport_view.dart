import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';


String token =
    'AAAAAAAAAAAAAAAAAAAAADFhbQEAAAAA27dk1f9HiqIEKT9ji0ts4p1V1eU%3DY4G9hPONN9D1EVKmt2fqqmj9NP2EHL9YWwdz8WWushzWzXeAWP';

Future<List<Tweet>> fetchTweets() async {
  List<Tweet> tweets = [];
  final response = await http.get(
    Uri.parse('https://api.twitter.com/2/users/1474395836687822849/tweets'),
    headers: {
      "Content-Type": "application/json",
      'Authorization': 'Bearer $token',
    },
  );

  if (response.statusCode == 200) {
    var data = json.decode(response.body);
    var rest = data["data"] as List;
    for (int i = 0; i < rest.length; i++) {
      if (rest[i]["text"][0] == '@' ||
          rest[i]["text"][0] == '#' ||
          rest[i]["text"][0] == '!' ||
          rest[i]["text"][0] == '.' ||
          rest[i]["text"][0] == '?' ||
          rest[i]["text"][0] == ';' ||
          rest[i]["text"][0] == ':' ||
          rest[i]["text"][0] == ',' ||
          rest[i]["text"][0] == '\n' ||
          rest[i]["text"][0] == '\t' ||
          rest[i]["text"].length < 80 ||
          (rest[i]["text"][0] == 'R' && rest[i]["text"][1] == 'T' )){
        rest.removeAt(i);
        print(rest[0]["text"].length);
      }
    }
    print(rest[1]["text"]);
    print('longueur de liste : {$rest.length}');
    tweets = rest.map<Tweet>((json) => Tweet.fromJson(json)).toList();

    return tweets;
  } else {
    throw Exception('Failed to load tweets');
  }
}

class Tweet {
  final String id;
  final String text;

  const Tweet({required this.id, required this.text});

  factory Tweet.fromJson(Map<String, dynamic> json) {
    return Tweet(
      id: json['id'],
      text: json['text'],
    );
  }
}

class SportScreen extends StatefulWidget {
  const SportScreen({Key? key}) : super(key: key);

  @override
  State<SportScreen> createState() => _SportScreenState();
}

class _SportScreenState extends State<SportScreen> {
  late Future<List<Tweet>> futureTweet;

  @override
  void initState() {
    super.initState();
    futureTweet = fetchTweets();
  }

  Widget listViewWidget(List<Tweet> tweets) {
    return Scaffold(
      appBar: AppBar(
        leading: InkWell(
          onTap: () {
            Navigator.pop(context);
          },
          child: const Icon(Icons.arrow_back),
        ),
        title: const Text('RC SPORTS'),
      ),
      body: Container(
        child: ListView.builder(
            itemCount: tweets.length,
            padding: const EdgeInsets.all(2.0),
            itemBuilder: (context, position) {
              return Card(
                child: ListTile(
                  title: Text(
                    tweets[position].text,
                    style: const TextStyle(
                      fontSize: 18.0,
                      color: Colors.black,
                      //fontWeight: FontWeight.bold
                    ),
                  ),
                ),
              );
            }),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: FutureBuilder<List<Tweet>>(
          future: futureTweet,
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              return listViewWidget(snapshot.data!.toList());
            } else if (snapshot.hasError) {
              return Text("${snapshot.error}");
            }

            // By default, show a loading spinner.
            return const Center(child: CircularProgressIndicator());
          },
        ),
      ),
    );
  }
}
