import 'package:auto_nanny/style/theme.dart';
import 'package:auto_nanny/templates/texts.dart';
import 'package:flutter/material.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

late double WIDTH, HEIGHT, ADAPT;

class _MainScreenState extends State<MainScreen> {
  @override
  Widget build(BuildContext context) {
    var query = MediaQuery.of(context);
    WIDTH = query.size.width;
    HEIGHT = query.size.height;
    ADAPT = query.size.shortestSide;

    return MaterialApp(
      theme: getMainTheme(),
      home: SafeArea(
        child: Scaffold(
          body: Center(
            child: AdaptText("Главный экран клиента", ADAPT, scale: .5),
          ),
        ),
      ),
    );
  }
}
