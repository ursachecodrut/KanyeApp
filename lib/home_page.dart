import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:lma_dregos/about_page.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  String? _quote;
  final String _apiUrl = 'http://api.kanye.rest/';
  final Client _client = Client();

  Future<void> getKanyeQuote() async {
    final Uri uri = Uri.parse(_apiUrl);
    final Response response = await _client.get(uri);

    if (response.statusCode >= 300) {
      throw StateError(response.body);
    }

    final Map<String, dynamic> mapQuote = jsonDecode(response.body) as Map<String, dynamic>;
    _quote = mapQuote['quote'] as String;
    print(_quote);
  }

  @override
  void initState() {
    super.initState();
    Future.wait(<Future<void>>[getKanyeQuote()]).then((_) => <void>{setState(() {})});
  }

  @override
  Widget build(BuildContext context) {
    if (_quote == null)
      return Scaffold(
        appBar: AppBar(
          title: const Text('lma.exe'),
          centerTitle: true,
          actions: <Widget>[
            IconButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute<void>(builder: (BuildContext context) => const About()),
                );
              },
              icon: const Icon(Icons.more_horiz),
            ),
          ],
        ),
        body: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              colors: <Color>[
                Theme.of(context).primaryColor,
                Theme.of(context).accentColor,
              ],
            ),
          ),
          child: const Center(
            child: CircularProgressIndicator(),
          ),
        ),
      );
    return Scaffold(
      appBar: AppBar(
        title: const Text('lma.exe'),
        centerTitle: true,
        actions: <Widget>[
          IconButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute<void>(builder: (BuildContext context) => const About()),
              );
            },
            icon: const Icon(Icons.more_horiz),
          ),
        ],
      ),
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: <Color>[
              Theme.of(context).primaryColor,
              Theme.of(context).accentColor,
            ],
          ),
        ),
        child: Padding(
          padding: const EdgeInsetsDirectional.all(20.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text(
                _quote!,
                style: const TextStyle(fontSize: 25.0, fontWeight: FontWeight.w500),
              ),
              const SizedBox(
                height: 20,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: const <Widget>[
                  Text(
                    '- Kanye West',
                    style: TextStyle(
                      fontSize: 18.0,
                      fontStyle: FontStyle.italic,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Theme.of(context).primaryColor,
        onPressed: () {
          Future.wait(<Future<void>>[getKanyeQuote()]).then((_) => <void>{setState(() {})});
        },
        child: const Icon(Icons.refresh),
      ),
    );
  }
}
