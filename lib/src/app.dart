import 'package:flutter/material.dart';
import 'package:riverpod_stream_provider/src/pages/timer/timer_page.dart';

import 'pages/ticker/ticker_page.dart';
import 'widgets/cutom_button.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Stream Provider',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatelessWidget {
  const MyHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: ListView(
          padding: const EdgeInsets.all(20),
          shrinkWrap: true,
          children: const [
            CustomButton(
              title: 'Ticker',
              child: TickerPage(),
            ),
            CustomButton(
              title: 'Stream Timer',
              child: TimerPage(),
            ),
          ],
        ),
      ),
    );
  }
}
