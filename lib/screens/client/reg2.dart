import 'package:auto_nanny/templates/appbar.dart';
import 'package:flutter/material.dart';

class Reg2 extends StatefulWidget {
  const Reg2({Key? key}) : super(key: key);

  @override
  State<Reg2> createState() => _Reg2State();
}

late double WIDTH, HEIGHT, ADAPT;

class _Reg2State extends State<Reg2> {
  @override
  Widget build(BuildContext context) {
    var query = MediaQuery.of(context);
    WIDTH = query.size.width;
    HEIGHT = query.size.height;
    ADAPT = query.size.shortestSide;

    return SafeArea(
      child: MaterialApp(
        home: Scaffold(
          appBar: CustomAppBar(context, HEIGHT),
          body: Center(
            
          ),
        ),
      ),
    );
  }
}
