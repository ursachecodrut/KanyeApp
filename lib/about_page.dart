import 'package:flutter/material.dart';

class About extends StatefulWidget {
  const About({Key? key}) : super(key: key);

  @override
  _AboutState createState() => _AboutState();
}

class _AboutState extends State<About> {
  late final String _happyBirthdayString = 'La multi ani domnule Dregos! Bun venit '
      'pe cea mai simpla si handicapata aplicatie ever. Dar stii ce este cool '
      'la ea? Ca este facuta special pentru tine! Atunci cand esti trist '
      'si vrei sa te simti inspirat, poti sa o deschizi si sa generezi un citat '
      'random din marele filosof al secolului, Kanye West. Te pup sper sa iti '
      'placa! La multi ani, Lolec!';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('La multi ani, Dregos!'),
        centerTitle: true,
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
                _happyBirthdayString,
                style: const TextStyle(
                  fontSize: 22.0,
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: const <Widget>[
                  Text(
                    '- Codrutel (Bolec)',
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
    );
  }
}
