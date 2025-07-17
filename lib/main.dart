import 'package:flutter/material.dart';
import 'dart:math';

void main() => runApp(Boosty());

class Boosty extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Boosty',
      theme: ThemeData(primarySwatch: Colors.indigo),
      home: BoostyHomePage(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class BoostyHomePage extends StatefulWidget {
  @override
  _BoostyHomePageState createState() => _BoostyHomePageState();
}

class _BoostyHomePageState extends State<BoostyHomePage> {
  final List<String> quotes = [
    "💡 Believe in yourself and all that you are.",
    "🔥 Push harder than yesterday.",
    "🚀 Great things never come from comfort zones.",
    "💪 Don’t stop when you're tired. Stop when you're done.",
    "🎯 Success doesn’t just find you.",
    "🎯 Discipline beats motivation.",
    "🧠 Your only limit is your mind.",
    "📍 Start where you are. Use what you have. Do what you can.",
  ];

  String currentQuote = "";

  @override
  void initState() {
    super.initState();
    currentQuote = quotes[0];
  }

  void showNewQuote() {
    final random = Random();
    setState(() {
      currentQuote = quotes[random.nextInt(quotes.length)];
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.indigo[50],
      appBar: AppBar(title: Text("Boosty 🚀")),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Card(
            elevation: 8,
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
            child: Padding(
              padding: const EdgeInsets.all(24.0),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    currentQuote,
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.w500),
                    textAlign: TextAlign.center,
                  ),
                  SizedBox(height: 20),
                  ElevatedButton(
                    onPressed: showNewQuote,
                    child: Text("Inspire Me ✨"),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
