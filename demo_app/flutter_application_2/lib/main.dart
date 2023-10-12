import 'package:flutter/material.dart';
import 'package:flutter_application_2/proj.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    // double screenwidth = MediaQuery.of(context).size.width;

    return MaterialApp(
      theme: ThemeData(
          // scaffoldBackgroundColor: Colors.black,
          // colorScheme: ColorScheme.fromSeed(
          //     seedColor: Colors.brown, background: Colors.black)
          ),
      debugShowCheckedModeBanner: false,
      title: 'Movie App',
      home: const MovieListings(),
    );
  }
}
