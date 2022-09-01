import 'package:flutter/material.dart';

import 'explicit_animations/translated_container.dart';

void main(List<String> args) {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: Scaffold(
        body: Center(
          child: TranslatedContainer(),
        ),
      ),
    );
  }
}
