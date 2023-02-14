import 'package:flutter/material.dart';
import 'package:playground/meditation/meditation.dart';
import 'package:provider/provider.dart';

import 'meditation/provider/meditation_provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<MeditationProvider>(
            create: (_) => MeditationProvider()),
      ],
      child: MaterialApp(
        title: 'Flutter Demo',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: SafeArea(
          child: MeditationScreen(),
        ),
      ),
    );
  }
}
