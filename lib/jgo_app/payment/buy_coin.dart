import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:jgo_exe/jgo_app/jgo_home_profile.dart';
import '../app_theme.dart';


class BuyCoinPageScreen extends StatefulWidget {
  const BuyCoinPageScreen({Key? key}) : super(key: key);

  @override
  State<BuyCoinPageScreen> createState() => _BuyCoinPageScreenState();
}

class _BuyCoinPageScreenState extends State<BuyCoinPageScreen> {
  int choosePackage = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Column(
          children: [
            Container(
              margin: const EdgeInsets.fromLTRB(30, 30, 10, 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Row(
                    children: [
                      IconButton(
                          onPressed: () {
                            Navigator.of(context).pop();},
                          icon: Image.asset("assets/images/back.png")),
                      SizedBox(
                        width: 50,
                        height: 50,
                        child: Image.asset("assets/images/logo.png"),
                      ),
                    ],
                  ),
                  Stack(
                    children: <Widget>[
                      // Stroked text as border.
                      Text(
                        'Buy Coin',
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
                        'Buy Coin',
                        style: TextStyle(
                          fontSize: 30,
                          color: AppTheme.greenPrimary,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 30,
            ),
            Padding(padding: const EdgeInsets.all(10),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text("Common package",
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                    ),),
                  Padding(padding: const EdgeInsets.all(10),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Container(
                          alignment: Alignment.center,
                          width: 140,
                          height: 70,
                          child: ElevatedButton(
                              child: const Text('50 cents / 22.000 VND ',style: TextStyle(
                                  color: Colors.black, fontSize: 16
                              )
                              ),
                              onPressed: (){
                                setState(() {
                                  choosePackage = 1;
                                });
                                print(choosePackage);
                              },
                              style: ButtonStyle(
                                  shape: MaterialStateProperty.all<
                                      RoundedRectangleBorder>(
                                      RoundedRectangleBorder(
                                          borderRadius: BorderRadius.circular(10.0),
                                          side: const BorderSide(color: AppTheme.greenPrimary))),
                                  backgroundColor: MaterialStateProperty.all<Color>(

                                      choosePackage == 1 ? AppTheme.greenPrimary:Colors.white70),
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
                        ),
                        Container(
                          alignment: Alignment.center,
                          width: 140,
                          height: 70,
                          child: ElevatedButton(
                              child: const Text('200 cents / 45.000 VND',style: TextStyle(
                                  color: Colors.black, fontSize: 16
                              )
                              ),
                              onPressed: (){
                                setState(() {
                                  choosePackage = 2;
                                });
                                print(choosePackage);
                              },
                              style: ButtonStyle(
                                  shape: MaterialStateProperty.all<
                                      RoundedRectangleBorder>(
                                      RoundedRectangleBorder(
                                          borderRadius: BorderRadius.circular(10.0),
                                          side: const BorderSide(color: AppTheme.greenPrimary))),
                                  backgroundColor: MaterialStateProperty.all<Color>(
                                      choosePackage == 2 ? AppTheme.greenPrimary:Colors.white70),
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
                      ],
                    ),),
                  const SizedBox(
                    height: 20,
                  ),
                  const Text("Month Package",
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                    ),),
                  Padding(padding: const EdgeInsets.all(10),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Container(
                          alignment: Alignment.center,
                          width: 160,
                          height: 70,
                          child: ElevatedButton(
                              child: const Text('1000 cents / 199.000 VND',style: TextStyle(
                                  color: Colors.black, fontSize: 16
                              )
                              ),
                              onPressed: (){
                                setState(() {
                                  choosePackage = 3;
                                });
                                print(choosePackage);
                              },
                              style: ButtonStyle(
                                  shape: MaterialStateProperty.all<
                                      RoundedRectangleBorder>(
                                      RoundedRectangleBorder(
                                          borderRadius: BorderRadius.circular(10.0),
                                          side: const BorderSide(color: AppTheme.yellowMonth))),
                                  backgroundColor: MaterialStateProperty.all<Color>(
                                      choosePackage == 3 ? AppTheme.yellowMonth:Colors.white70),
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
                        ),
                        Container( // dung posioned
                          alignment: Alignment.center,
                          width: 160,
                          height: 70,
                          child: ElevatedButton(
                              child: const Text('2000 cents / 419.000 VND',style: TextStyle(
                                  color: Colors.black, fontSize: 16
                              )
                              ),
                              onPressed: (){
                                setState(() {
                                  choosePackage = 4;
                                });
                                print(choosePackage);
                              },
                              style: ButtonStyle(
                                  shape: MaterialStateProperty.all<
                                      RoundedRectangleBorder>(
                                      RoundedRectangleBorder(
                                          borderRadius: BorderRadius.circular(10.0),
                                          side: const BorderSide(color: AppTheme.yellowMonth))),
                                  backgroundColor: MaterialStateProperty.all<Color>(
                                      choosePackage == 4 ? AppTheme.yellowMonth:Colors.white70),
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
                        ),
                      ],
                    ),),
                  const SizedBox(
                    height: 20,
                  ),
                  const Text("Diamond Package",
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                    ),),
                  Padding(padding: const EdgeInsets.fromLTRB(20, 10, 10, 10),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Container(
                          alignment: Alignment.center,
                          width: 160,
                          height: 70,
                          child: ElevatedButton(
                              child:  const Text('9000 cents / 1099.000 VND',style: TextStyle(
                                  color: Colors.black, fontSize: 16
                              )
                              ),
                              onPressed: (){
                                setState(() {
                                  choosePackage = 5;
                                });
                                print(choosePackage);
                              },
                              style: ButtonStyle(
                                  shape: MaterialStateProperty.all<
                                      RoundedRectangleBorder>(
                                      RoundedRectangleBorder(
                                          borderRadius: BorderRadius.circular(10.0),
                                          side: const BorderSide(color: AppTheme.redDiamond))),
                                  backgroundColor: MaterialStateProperty.all<Color>(
                                      choosePackage == 5 ? AppTheme.redDiamond:Colors.white70),
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
                      ],
                    ),)
                ],
              ),),
            Container(
              margin: const EdgeInsets.only(top: 20),
              alignment: Alignment.center,
              width: 160,
              height: 40,
              child: ElevatedButton(
                  child: Stack(
                    children: [
                      Text(
                        'Purchase',
                        style: TextStyle(
                            fontSize: 24,
                            foreground: Paint()
                              ..style = PaintingStyle.stroke
                              ..strokeWidth = 2
                              ..color = Colors.black
                        ),
                      ),
                      const Text(
                        'Purchase',
                        style: TextStyle(
                          fontSize: 24,
                          color: Colors.white,
                        ),
                      ),
                    ],
                  ),
                  onPressed: (){
                    setState(() {
                      if(choosePackage == 1){
                        ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(content: Text("Well, you receive 50 cents!.")));
                      } else if(choosePackage == 2) {
                        ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(content: Text("Well, you receive 200 cents!.")));
                      }else if(choosePackage == 3){
                        ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(content: Text("Well, you receive 1000 cents!.")));
                      }
                      else if(choosePackage == 4){
                        ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(content: Text("Well, you receive 2000 cents!.")));
                      }else {
                        ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(content: Text(
                                "Well, you receive 9000 cents!.")));
                      }
                    });
                    Navigator.of(context).pop();
                  },
                  style: ButtonStyle(
                      minimumSize: MaterialStateProperty.all<Size>(Size.infinite),
                      shape: MaterialStateProperty.all<
                          RoundedRectangleBorder>(
                          RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(45.0),
                              side: const BorderSide(color: Colors.black))),
                      backgroundColor: MaterialStateProperty.all<Color>(
                          AppTheme.greenPrimary),
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
            )
          ],
        ));
  }


}
