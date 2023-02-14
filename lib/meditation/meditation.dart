import 'package:flutter/material.dart';
import 'package:playground/meditation/provider/meditation_provider.dart';
import 'package:provider/provider.dart';

class MeditationScreen extends StatefulWidget {
  const MeditationScreen({Key? key}) : super(key: key);
  @override
  State<MeditationScreen> createState() => _MeditationScreenState();
}

class _MeditationScreenState extends State<MeditationScreen> {
  MeditationProvider? _meditationProvider;
  @override
  void initState() {
    Provider.of<MeditationProvider>(context, listen: false);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    _meditationProvider =
        Provider.of<MeditationProvider>(context, listen: true);
    return Scaffold(
      appBar: AppBar(),
      body: Column(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          _statusText(),
          const SizedBox(height: 30),
          if (_meditationProvider!.isActivityStart!) _endButton(),
          if (!_meditationProvider!.isActivityStart!) _startButton(),
        ],
      ),
    );
  }

  Widget _endButton() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 38.0),
      child: MaterialButton(
        color: Colors.red,
        onPressed: () {
          _meditationProvider!.cancelActivity();
        },
        child: const Center(
          child: Text('End'),
        ),
      ),
    );
  }

  Widget _startButton() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 38.0),
      child: MaterialButton(
        color: Colors.greenAccent,
        onPressed: () {
          _meditationProvider!.startActivity();
        },
        child: const Center(
          child: Text('Start'),
        ),
      ),
    );
  }

  Align _statusText() {
    return Align(
      alignment: Alignment.center,
      child: Text(
        _meditationProvider?.status ?? 'Start',
        style: const TextStyle(
          fontSize: 20,
        ),
      ),
    );
  }
}
