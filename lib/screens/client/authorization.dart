import 'package:auto_nanny/screens/client/login.dart';
import 'package:auto_nanny/screens/client/registration.dart';
import 'package:auto_nanny/style/theme.dart';
import 'package:auto_nanny/templates/buttons.dart';
import 'package:auto_nanny/templates/texts.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class ClientAuth extends StatefulWidget {
  const ClientAuth({super.key});

  @override
  State<ClientAuth> createState() => _ClientAuthState();
}

class _ClientAuthState extends State<ClientAuth> {

  @override
  Widget build(BuildContext context) {
    var query = MediaQuery.of(context);
    final double WIDTH = query.size.width,
                 HEIGHT = query.size.height,
                 ADAPT = query.size.shortestSide;

    SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);

    return MaterialApp(
      theme: getMainTheme(),
      home: SafeArea(
        child: Scaffold(
          body: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [

                Icon(Icons.image, size: ADAPT * .3),
                SizedBox(height: ADAPT * .05),
                AdaptText("АВТОНЯНЯ", ADAPT, fontWeight: FontWeight.bold, fontColor: getMainTheme().primaryColor),
                SizedBox(height: ADAPT * .2),
                RoundButton(
                  width: ADAPT * .9,
                  height: ADAPT * .15,
                  borderRadius: 15,
                  onPressed: () => Navigator.push(context, MaterialPageRoute(builder: (context) => const Login())),
                  child: AdaptText("Войти", ADAPT, scale: .4),
                ),
                SizedBox(height: ADAPT * .05),
                RoundButton(
                  width: ADAPT * .9,
                  height: ADAPT * .15,
                  borderRadius: 15,
                  backgroundColor: Colors.white,
                  onPressed: () => Navigator.push(context, MaterialPageRoute(builder: (context) => const Registration())),
                  child: AdaptText("Зарегистрироваться", ADAPT, scale: .4, fontColor: Colors.black),
                ),

              ],
            ),
          ),
        ),
      ),
    );
  }

}
