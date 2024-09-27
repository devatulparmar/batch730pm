import 'dart:async';

import 'package:flutter/material.dart';

class ClockScreen extends StatefulWidget {
  const ClockScreen({super.key});

  @override
  State<ClockScreen> createState() => _ClockScreenState();
}

class _ClockScreenState extends State<ClockScreen> {
  int _elapsedSeconds = 0;
  Timer? _timer;
  bool _isRunning = false;

  int countDownValue = 10;

  Timer? _stopWatchTimer;

  void _startTimer() {
    try {
      _timer = Timer.periodic(
        const Duration(seconds: 1),
        (Timer t) {
          if (countDownValue == 0) {
            _timer!.cancel();
          } else {
            countDownValue--;
          }
          setState(() {});
        },
      );
    } catch (e) {
      print(e);
    }
  }

  void _startStopWatchTimer() {
    _isRunning = true;
    _stopWatchTimer = Timer.periodic(const Duration(seconds: 1), (timer) {
      setState(() {
        _elapsedSeconds++;
      });
    });
  }

  void _stopTimer() {
    _isRunning = false;
    _stopWatchTimer?.cancel();
  }

  void _resetTimer() {
    _stopTimer();
    setState(() {
      _elapsedSeconds = 0;
    });
  }

  _formatDuration(int seconds) {
    final int hours = seconds ~/ 3600;
    final int minutes = (seconds % 3600) ~/ 60;
    final int secs = seconds % 60;

    return "${hours.toString().padLeft(2, '0')}:${minutes.toString().padLeft(2, '0')}:${secs.toString().padLeft(2, '0')}";
  }

  @override
  void dispose() {
    _timer!.cancel();
    _stopTimer();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Clock Screen'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(
            child: Text(
              _formatDuration(_elapsedSeconds),
              style: const TextStyle(fontSize: 48),
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              ElevatedButton(
                onPressed: _isRunning ? null : _startStopWatchTimer,
                child: const Text('Start'),
              ),
              const SizedBox(width: 20),
              ElevatedButton(
                onPressed: _isRunning ? _stopTimer : null,
                child: const Text('Stop'),
              ),
              const SizedBox(width: 20),
              ElevatedButton(
                onPressed: _resetTimer,
                child: const Text('Reset'),
              ),
            ],
          ),
          const SizedBox(height: 20),

          const Divider(color: Colors.black),
          const SizedBox(height: 50),
          Center(child: Text('Count Down Time: $countDownValue')),
          const SizedBox(height: 20),
          Center(
            child: ElevatedButton(
              onPressed: () {
                _startTimer();
              },
              child: const Text('Start'),
            ),
          ),
          const SizedBox(height: 20),
          Center(
            child: ElevatedButton(
              onPressed: () {
                countDownValue = 10;
                setState(() {});
              },
              child: const Text('Reset'),
            ),
          ),
        ],
      ),
    );
  }
}
