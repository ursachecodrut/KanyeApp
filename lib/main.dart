import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
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
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Center(
          child: ElevatedButton(
            onPressed: () {
              getKanyeQuote();
            },
            child: const Text('print Kanye'),
          ),
        ),
      ),
    );
  }
}
