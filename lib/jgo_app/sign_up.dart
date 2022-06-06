import 'package:flutter/material.dart';
import 'app_theme.dart';
import 'jgo_home.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({Key? key}) : super(key: key);

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  final TextEditingController _fullName = TextEditingController();
  final TextEditingController _phoneNumber = TextEditingController();
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
                                  'Sign Up',
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
                                  'Sign Up',
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
                      child: Image.asset("assets/images/avatar_big.png", width: 165, height: 165,),
                    ),
                    const SizedBox(
                      width: 50,
                    ),
                    Padding(
                      padding: const EdgeInsets.fromLTRB(0, 10, 0, 0),
                      child: Container(
                        height: 50,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          border: Border.all(
                            width: 1,
                            color: AppTheme.greenPrimary,
                          ),
                          color: AppTheme.grey1,
                        ),
                        child: TextField(
                          cursorColor: Colors.black,
                          style: const TextStyle(fontSize: 18, color: Colors.black),
                          controller: _fullName,
                          decoration: const InputDecoration(
                              border: OutlineInputBorder(borderSide: BorderSide.none),
                              hintText: "Full Name",
                              focusedBorder: OutlineInputBorder(
                                borderSide: BorderSide.none,
                              ),
                              labelStyle: TextStyle(
                                  color: Colors.black,
                                  fontSize: 15,
                                  fontWeight: FontWeight.w500)),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.fromLTRB(0, 10, 0, 0),
                      child: Container(
                        height: 50,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          border: Border.all(
                            width: 1,
                            color: AppTheme.greenPrimary,
                          ),
                          color: AppTheme.grey1,
                        ),
                        child: TextField(
                          cursorColor: Colors.black,
                          style: const TextStyle(fontSize: 18, color: Colors.black),
                          controller: _phoneNumber,
                          decoration: const InputDecoration(
                              border: OutlineInputBorder(borderSide: BorderSide.none),
                              hintText: "Phone Number (optional)",
                              focusedBorder: OutlineInputBorder(
                                borderSide: BorderSide.none,
                              ),
                              labelStyle: TextStyle(
                                  color: Colors.black,
                                  fontSize: 15,
                                  fontWeight: FontWeight.w500)),
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 100,
                    ),

                    SizedBox(
                      width: 370,
                      height: 50,
                      child: ElevatedButton(
                          child:
                          Stack(
                            children: <Widget>[
                              // Stroked text as border.
                              Text(
                                'Done',
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
                                    ..strokeWidth = 2
                                    ..color = Colors.black,
                                ),
                              ),
                              // Solid text as fill.
                              const Text(
                                'Done',
                                style: TextStyle(
                                  fontSize: 30,
                                  color: Colors.white,
                                ),
                              ),
                            ],
                          ),
                          onPressed: goHome,
                          style: ButtonStyle(
                              alignment: Alignment.center,
                              shape: MaterialStateProperty.all<
                                  RoundedRectangleBorder>(
                                  RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(45.0),
                                      side: const BorderSide(color: Colors.black))),
                              backgroundColor: MaterialStateProperty.all<Color>(AppTheme.greenPrimary),
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
                              ))),
                    ),
                  ]
              )
          )),
    );
  }

  Widget gotoHome(BuildContext context) {
    return const JGoAppHomeScreen();
  }

  goHome() {
    Navigator.of(context).pushAndRemoveUntil(
        MaterialPageRoute(builder: gotoHome), (route) => false);
  }

}
