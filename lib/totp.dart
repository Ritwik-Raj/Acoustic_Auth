import 'dart:async';
import 'package:flutter/material.dart';
import 'package:totp/totp.dart';

class TOTPGenerator{
  static String generateTOTP(String secret,
      {int timeStep = 30, int digits = 6, int? currentTime}) {
    String otpStr = Totp.fromBase32(secret:"2MQA54AHI2QPDSRDVJXPROXSZWSNWGK6",digits: 6, algorithm: Algorithm.sha1).now();
    return otpStr;
  }
}
class TotpAuthentication extends StatelessWidget {
  const TotpAuthentication({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'TOTP',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'TOTP Authentication'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  late Timer timer;
  int timercountdown = 30;

  void startTimer() {
    timercountdown = getTimeUntilNextStep();
    Timer.periodic(Duration(seconds: 1), (timer) {
      if (timercountdown <= 0) {
        setState(() {
          timercountdown = getTimeUntilNextStep();
        });
      } else {
        setState(() {
          timercountdown--;
        });
      }
    });
  }

  void initState() {
    super.initState();
    startTimer();
  }

  int getTimeUntilNextStep({int timeStep = 30}) {
    final currentTime = DateTime.now().millisecondsSinceEpoch ~/ 1000;
    return timeStep - ((currentTime + 3) % timeStep);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(timercountdown.toString()),
            SizedBox(
              height: 10,
            ),
            Text(
              TOTPGenerator.generateTOTP("2MQA54AHI2QPDSRDVJXPROXSZWSNWGK6"),
              style: TextStyle(fontSize: 20),
            )
          ],
        ),
      ),
    );
  }
}