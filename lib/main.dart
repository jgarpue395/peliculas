import 'package:flutter/material.dart';
import 'package:peliculas/screens/details_screen.dart';
import 'package:peliculas/screens/home_screen.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Material App',
      initialRoute: "home",
      routes: {
        "home": (context) => const HomeScreen(),
        "details": (context) => const DetailsScreen() 
      },
      theme: ThemeData.light().copyWith(
        appBarTheme: const AppBarTheme(
          color: Colors.indigo
        )
      ),
    );
  }
}