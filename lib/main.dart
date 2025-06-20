import 'package:ecg_analysis2/Screens/home_screen.dart';
import 'package:ecg_analysis2/Screens/result-screen.dart';
import 'package:flutter/material.dart';

void main() async {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
      ),
      initialRoute: "/",
      routes: {
        HomeScreen.path: (context) => const HomeScreen(),
        ResultScreen.path: (context) => const ResultScreen(),
      },
    );
  }
}
