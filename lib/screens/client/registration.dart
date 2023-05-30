import 'package:auto_nanny/style/theme.dart';
import 'package:auto_nanny/templates/appbar.dart';
import 'package:auto_nanny/templates/buttons.dart';
import 'package:auto_nanny/templates/texts.dart';
import 'package:flutter/material.dart';

class Registration extends StatefulWidget {
  const Registration({super.key});

  @override
  State<Registration> createState() => _RegistrationState();
}

late double WIDTH, HEIGHT, ADAPT;

class _RegistrationState extends State<Registration> {
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
            extendBodyBehindAppBar: true,
            appBar: CustomAppBar(
              context,
              HEIGHT,
            ),
            body: Center(
                child: Padding(
                  padding: const EdgeInsets.all(20),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [

                      AdaptText("Подтверждение номера", WIDTH, scale: .4, fontWeight: FontWeight.bold),
                      SizedBox(height: HEIGHT * .02),
                      AdaptText("Введите номер телефона и мы отправим вам код SMS", WIDTH, scale: .4),
                      SizedBox(height: HEIGHT * .06),
                      CustomTextForm(
                        labelText: "Номер телефона*",

                      ),
                      SizedBox(height: HEIGHT * .03),
                      RoundButton(
                        height: HEIGHT * .08,
                        width: WIDTH,
                        onPressed: () {

                        },
                        child: AdaptText("Отправить код подтверждения", WIDTH, scale: .4),
                      ),

                    ],
                  ),
                )
            )
        ),
      ),
    );
  }
}