import 'package:flutter/material.dart';
import 'dart:async';

class Cronometro extends StatefulWidget {
  const Cronometro({Key? key}) : super(key: key);

  @override
  _CronometroState createState() => _CronometroState();
}

class _CronometroState extends State<Cronometro> {
  Duration duration = Duration();
  Timer? timer;

  void addTime() {
    final addSeconds = 1;

    setState(() {
      final seconds = duration.inSeconds + addSeconds;

      duration = Duration(seconds: seconds);
    });
  }

  void startTimer() {
    timer = Timer.periodic(Duration(seconds: 1), (_) => addTime());
  }

  void resetTimer() {
    setState(() {
      duration = Duration();
    });
  }

  void stopTimer() {
    timer?.cancel();
  }

  @override
  Widget build(BuildContext context) {
    String twoDigits(int n) => n.toString().padLeft(2, '0');
    final hours = twoDigits(duration.inHours);
    final minutes = twoDigits(duration.inMinutes.remainder(60));
    final seconds = twoDigits(duration.inSeconds.remainder(60));

    return Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            '$hours:$minutes:$seconds',
            style: TextStyle(
              fontSize: 50,
            ),
          ),
          SizedBox(
            height: 12,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              ElevatedButton(
                onPressed: () {
                  startTimer();
                },
                child: const Text('Start'),
                style: ElevatedButton.styleFrom(
                  primary: Colors.purple.shade400,
                  padding:
                      const EdgeInsets.symmetric(horizontal: 30, vertical: 12),
                ),
              ),
              ElevatedButton(
                onPressed: () {
                  resetTimer();
                },
                child: const Text('Reset'),
                style: ElevatedButton.styleFrom(
                  primary: Colors.purple.shade400,
                  padding:
                      const EdgeInsets.symmetric(horizontal: 30, vertical: 12),
                ),
              ),
              ElevatedButton(
                onPressed: () {
                  stopTimer();
                },
                child: const Text('Stop'),
                style: ElevatedButton.styleFrom(
                  primary: Colors.purple.shade400,
                  padding:
                      const EdgeInsets.symmetric(horizontal: 30, vertical: 12),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
