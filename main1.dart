import 'package:flutter/material.dart';
import 'dart:math';

void main() => runApp(BoostyApp());

class BoostyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Boosty Quotes',
      theme: ThemeData(
        fontFamily: 'Arial',
        scaffoldBackgroundColor: Colors.grey[100],
      ),
      debugShowCheckedModeBanner: false,
      home: BoostyHomePage(),
    );
  }
}

class BoostyHomePage extends StatefulWidget {
  @override
  _BoostyHomePageState createState() => _BoostyHomePageState();
}

class _BoostyHomePageState extends State<BoostyHomePage> {
  final List<String> quotes = [
    "✨ Believe in your grind.",
    "💥 Hustle in silence, let success make the noise.",
    "🌿 Breathe. Believe. Receive.",
    "🔥 Keep showing up.",
    "🚀 Dreams don’t work unless you do.",
    "💫 Your vibe attracts your tribe.",
    "🎯 Focus. Manifest. Win.",
  ];

  String currentQuote = "";
  double opacityLevel = 1.0;

  @override
  void initState() {
    super.initState();
    currentQuote = quotes[0];
  }

  void showNewQuote() {
    final random = Random();
    setState(() {
      opacityLevel = 0.0;
    });

    Future.delayed(Duration(milliseconds: 200), () {
      setState(() {
        currentQuote = quotes[random.nextInt(quotes.length)];
        opacityLevel = 1.0;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            // Top "Instagram-style" header
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
              child: Row(
                children: [
                  CircleAvatar(
                    radius: 28,
                    backgroundColor: Colors.deepPurple,
                    child: Text(
                      "B",
                      style: TextStyle(
                        fontSize: 26,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                  ),
                  SizedBox(width: 14),
                  Text(
                    "boosty_quotes",
                    style: TextStyle(
                      fontSize: 22,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ],
              ),
            ),

            // Quote display area
            Expanded(
              child: Center(
                child: AnimatedOpacity(
                  duration: Duration(milliseconds: 400),
                  opacity: opacityLevel,
                  child: Container(
                    margin: EdgeInsets.symmetric(horizontal: 24),
                    padding: EdgeInsets.all(24),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(18),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black12,
                          blurRadius: 8,
                          offset: Offset(2, 4),
                        ),
                      ],
                    ),
                    child: Text(
                      currentQuote,
                      style: TextStyle(
                        fontSize: 22,
                        fontWeight: FontWeight.w500,
                        color: Colors.black87,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ),
                ),
              ),
            ),

            // Button
            Padding(
              padding: const EdgeInsets.only(bottom: 30),
              child: ElevatedButton(
                onPressed: showNewQuote,
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.deepPurple,
                  shape: StadiumBorder(),
                  padding: EdgeInsets.symmetric(horizontal: 32, vertical: 14),
                ),
                child: Text(
                  "Next Post 💬",
                  style: TextStyle(fontSize: 18),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
