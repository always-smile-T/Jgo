import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:jgo_exe/jgo_app/sign_up.dart';
import 'app_theme.dart';


class LoginByMailScreen extends StatefulWidget {
  const LoginByMailScreen({Key? key}) : super(key: key);

  @override
  _LoginByMailScreenState createState() => _LoginByMailScreenState();
}

class _LoginByMailScreenState extends State<LoginByMailScreen> {

  @override
  void initState() => super.initState();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: const EdgeInsets.fromLTRB(5, 0, 5, 0),
        constraints: const BoxConstraints.expand(),
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(30),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                margin: const EdgeInsets.all(5),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    IconButton(
                        onPressed: () {},
                        icon: Image.asset("assets/images/back.png")),
                    Center(
                      child: Stack(
                        children: <Widget>[
                          // Stroked text as border.
                          Text(
                            'Welcome back',
                            style: TextStyle(
                              fontSize: 30,
                              shadows: const [
                                Shadow(
                                  blurRadius: 3.0,
                                  color: Colors.black38,
                                  offset: Offset(-2, 5.0),
                                ),
                              ],
                              foreground: Paint()
                                ..style = PaintingStyle.stroke
                                ..strokeWidth = 3
                                ..color = Colors.black,
                            ),
                          ),
                          // Solid text as fill.
                          const Text(
                            'Welcome back',
                            style: TextStyle(
                              fontSize: 30,
                              color: AppTheme.greenPrimary,
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(
                      width: 10,
                    )
                  ],
                ),
              ),
              const SizedBox(
                width: 50,
              ),
              Container(
                padding: const EdgeInsets.all(30),
                child: Image.asset("assets/images/logo.png", width: 165, height: 165,),
              ),
              const SizedBox(
                width: 50,
              ),
              ElevatedButton(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      SizedBox(
                        width: 30,
                        height: 30,
                        child: Image.asset("assets/images/google.png"),
                      ),
                      const Text('Sign in by Google',style: TextStyle(
                          color: Colors.black, fontSize: 20
                      )
                      ),
                      const SizedBox(
                        width: 10,
                      )],
                  ),
                  onPressed: (){goSignUp();},
                  style: ButtonStyle(
                      shape: MaterialStateProperty.all<
                          RoundedRectangleBorder>(
                          RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(0.0),
                              side: const BorderSide(color: Colors.black))),
                      backgroundColor: MaterialStateProperty.all<Color>(
                          Colors.white70),
                      overlayColor:
                      MaterialStateProperty.all<Color>(Colors.white70),
                      foregroundColor:
                      MaterialStateProperty.all<Color>(Colors.white70),
                      elevation: MaterialStateProperty.resolveWith<double>(
                            (Set<MaterialState> states) {
                          if (states.contains(MaterialState.pressed) ||
                              states.contains(MaterialState.disabled)) {
                            return 0;
                          }
                          return 10;
                        },
                      ))
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget gotoSignUp(BuildContext context) {
    return const SignUpScreen();
  }

  goSignUp() {
    Navigator.of(context).pushAndRemoveUntil(
        MaterialPageRoute(builder: gotoSignUp), (route) => false);
  }
}
