import 'package:auto_nanny/screens/client/main_screen.dart';
import 'package:auto_nanny/style/theme.dart';
import 'package:auto_nanny/templates/appbar.dart';
import 'package:auto_nanny/templates/bottom_sheet.dart';
import 'package:auto_nanny/templates/buttons.dart';
import 'package:auto_nanny/templates/texts.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

late double WIDTH, HEIGHT, ADAPT;

class _LoginState extends State<Login> {
  String phone = "";
  String password = "";
  bool isCorrect = true;
  bool showPass = false;
  final _formKey = GlobalKey<FormState>();

  var phoneFormatter = MaskTextInputFormatter(
                                mask: "+# (###) ###-##-##",
                                filter: {"#": RegExp(r"[0-9]")},
                                type: MaskAutoCompletionType.lazy
                              );

  @override
  Widget build(BuildContext context) {
    var query = MediaQuery.of(context);
    WIDTH = query.size.width;
    HEIGHT = query.size.height;
    ADAPT = query.size.shortestSide;

    SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);

    return MaterialApp(
      theme: getMainTheme(),
      home: SafeArea(
        child: Scaffold(
          extendBodyBehindAppBar: true,
          appBar: CustomAppBar(context, HEIGHT),
          body: Stack(
            children: [
              Padding(
                padding: const EdgeInsets.all(0),
                child: Align(
                  alignment: Alignment.topCenter,
                  child: Image.asset(
                    "assets/images/Saly-10.png", 
                    height: HEIGHT * .35,
                    fit: BoxFit.cover,
                    ),
                ),
              ),

              StaticBottomSheet(
                height: HEIGHT * .65,
                child: Form(
                  key: _formKey,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [

                      AdaptText("Вход в аккаунт", ADAPT, scale: .4, fontWeight: FontWeight.bold),
                      SizedBox(height: HEIGHT *.05),
                      CustomTextForm(
                        keyboardType: TextInputType.phone,
                        inputFormatters: [phoneFormatter],
                        labelText: "Номер телефона*",
                        onChanged: (text) => phone = text,
                      ),
                      SizedBox(height: HEIGHT *.02),
                      CustomTextForm(
                        labelText: "Пароль*",
                        onChanged: (pass) => password = pass,
                        obscureText: !showPass,
                        suffixIcon: IconButton(
                          padding: EdgeInsets.only(right: WIDTH * .04),
                          icon: Icon( showPass ? Icons.visibility : Icons.visibility_off ),
                          onPressed: () => setState(() {
                            showPass = !showPass;
                          }),
                        ),
                      ),
                      Visibility(
                        visible: !isCorrect,
                        child: Padding(
                          padding: EdgeInsets.only(top: HEIGHT * .02),
                          child: AdaptText("Введенный номер или пароль не верны.", WIDTH, scale: .3, fontColor: Colors.red),
                        ),
                      ),
                      SizedBox(height: HEIGHT *.04),
                      RoundButton(
                        width: WIDTH,
                        height: HEIGHT * .08,
                        onPressed: () {
                          // TODO: Нормальная авторизация
                          var data = phoneFormatter.getUnmaskedText();
                          setState(() {
                            if( (data.isEmpty || data.length < 11) || password.length < 8)
                              isCorrect = false;
                            else
                              Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => const MainScreen()));
                          });

                        },
                        child: AdaptText("Войти", WIDTH, scale: .4, fontWeight: FontWeight.normal,),
                      ),
                      Visibility(
                        visible: !isCorrect,
                        child: Padding(
                          padding: EdgeInsets.only(top: HEIGHT * .02),
                          child: GestureDetector(
                            onTap: () {
                              // TODO: Забыли пароль?
                            },
                            child: AdaptText("Забыли пароль?", WIDTH, scale: .3),
                          )
                        ),
                      ),
                      SizedBox(height: HEIGHT *.03),
                      AdaptText(
                        "Или зарегистрируйтесь через соц сети",
                        WIDTH,
                        scale: .25,
                      ),
                      SizedBox(height: HEIGHT *.01),
                      Image.asset("assets/images/SocialNetworks.png", width: WIDTH * .45),

                    ],
                  ),
                ),
              ),
            ],
          )
        ),
      ),
    );
  }
}
