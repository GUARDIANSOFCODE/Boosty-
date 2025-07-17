import 'package:flutter/material.dart';
import 'dart:math';

void main() => runApp(VibelyApp());

class VibelyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Vibely',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        scaffoldBackgroundColor: Colors.grey[100],
        fontFamily: 'Helvetica',
      ),
      home: QuoteFeed(),
    );
  }
}

class QuoteFeed extends StatefulWidget {
  @override
  _QuoteFeedState createState() => _QuoteFeedState();
}

class _QuoteFeedState extends State<QuoteFeed> {
  final List<String> quotes = [
    "🌟 You're capable of amazing things.",
    "🚀 Start now. Not tomorrow.",
    "🌈 One thought can change everything.",
    "🔥 Stay focused. Stay fierce.",
    "✨ Progress over perfection.",
    "💭 Think it. Want it. Get it.",
    "📸 Be the energy you want to attract.",
  ];

  String currentQuote = "";
  double opacity = 1.0;

  @override
  void initState() {
    super.initState();
    currentQuote = quotes[0];
  }

  void _nextQuote() {
    setState(() => opacity = 0.0);

    Future.delayed(Duration(milliseconds: 300), () {
      final random = Random();
      setState(() {
        currentQuote = quotes[random.nextInt(quotes.length)];
        opacity = 1.0;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Vibely",
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 24,
            color: Colors.deepPurple,
          ),
        ),
        centerTitle: true,
        backgroundColor: Colors.white,
        elevation: 1,
      ),
      body: Column(
        children: [
          Expanded(
            child: Center(
              child: AnimatedOpacity(
                duration: Duration(milliseconds: 500),
                opacity: opacity,
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 24.0),
                  child: Container(
                    padding: EdgeInsets.all(24),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(20),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black12,
                          blurRadius: 12,
                          offset: Offset(0, 6),
                        ),
                      ],
                    ),
                    child: Text(
                      currentQuote,
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 22,
                        fontWeight: FontWeight.w600,
                        color: Colors.black87,
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(bottom: 40),
            child: GestureDetector(
              onTap: _nextQuote,
              child: Column(
                children: [
                  Icon(Icons.keyboard_arrow_up_rounded,
                      size: 40, color: Colors.deepPurple),
                  Text(
                    "Next Vibe",
                    style: TextStyle(
                      fontSize: 18,
                      color: Colors.deepPurple,
                      fontWeight: FontWeight.w500,
                    ),
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
