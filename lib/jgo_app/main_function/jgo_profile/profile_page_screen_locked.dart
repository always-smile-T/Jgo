import 'package:flutter/material.dart';

import 'package:jgo_exe/jgo_app/payment/subcription_fee.dart';
import '../../app_theme.dart';
import '../../login_by_mail.dart';
import '../../sign_up.dart';
import 'help_center/help_center_page_screen.dart';

class ProfileLockScreen extends StatefulWidget {
  const ProfileLockScreen({Key? key}) : super(key: key);

  @override
  _ProfileLockScreenState createState() => _ProfileLockScreenState();
}

class _ProfileLockScreenState extends State<ProfileLockScreen>
    with SingleTickerProviderStateMixin {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SingleChildScrollView(
      child: Container(
          color: Colors.white70,
          child: Column(
            children: <Widget>[
              Container(
                  padding: const EdgeInsets.only(top: 20),
                  height: 175,
                  color: AppTheme.greenPrimary,
                  child: Row(
                    children: [
                      Expanded(
                          flex: 1,
                          child: Stack(
                            alignment: Alignment.topCenter,
                            clipBehavior: Clip.none,
                            children: <Widget>[
                              Positioned(
                                top: 40,
                                left: 35,
                                child: Container(
                                  decoration: BoxDecoration(
                                      shape: BoxShape.circle,
                                      border: Border.all(
                                          width: 3, color: Colors.white)),
                                  width: 70,
                                  height: 70,
                                  child: const CircleAvatar(
                                    backgroundColor: AppTheme.green3,
                                    radius: 15,
                                    backgroundImage: AssetImage(
                                        "assets/images/avatar_big.png"),
                                  ),
                                ),
                              ),
                              Positioned(
                                top: 95,
                                left: 80,
                                child: Container(
                                  decoration: BoxDecoration(
                                      color: AppTheme.green2,
                                      shape: BoxShape.circle,
                                      border: Border.all(
                                          width: 3, color: Colors.white)),
                                  width: 20,
                                  height: 20,
                                  child: const CircleAvatar(
                                    backgroundColor: AppTheme.green3,
                                    radius: 15,
                                    backgroundImage:
                                        AssetImage("assets/images/lock.png"),
                                  ),
                                ),
                              ),
                            ],
                          )),
                      Expanded(
                          flex: 2,
                          child: Stack(
                            children: [
                              Positioned(
                                top: 25,
                                right: 20,
                                child: Container(
                                  alignment: Alignment.center,
                                  width: 200,
                                  height: 30,
                                  child: ElevatedButton(
                                      child: Image.asset(
                                          "assets/images/friends_button.png"),
                                      onPressed: () {},
                                      style: ButtonStyle(
                                          shape:
                                              MaterialStateProperty.all<RoundedRectangleBorder>(
                                                  RoundedRectangleBorder(
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              10.0),
                                                      side: const BorderSide(
                                                          color: AppTheme
                                                              .greenPrimary))),
                                          backgroundColor:
                                              MaterialStateProperty.all<Color>(
                                                  AppTheme.green3),
                                          overlayColor:
                                              MaterialStateProperty.all<Color>(
                                                  Colors.white70),
                                          foregroundColor:
                                              MaterialStateProperty.all<Color>(Colors.white70),
                                          elevation: MaterialStateProperty.resolveWith<double>(
                                            (Set<MaterialState> states) {
                                              if (states.contains(
                                                      MaterialState.pressed) ||
                                                  states.contains(
                                                      MaterialState.disabled)) {
                                                return 0;
                                              }
                                              return 10;
                                            },
                                          ))),
                                ),
                              ),
                              Positioned(
                                top: 65,
                                right: 20,
                                child: Container(
                                  alignment: Alignment.center,
                                  width: 220,
                                  height: 30,
                                  child: ElevatedButton(
                                      child: Image.asset(
                                          "assets/images/voucher_button.png"),
                                      onPressed: () {},
                                      style: ButtonStyle(
                                          shape:
                                              MaterialStateProperty.all<RoundedRectangleBorder>(
                                                  RoundedRectangleBorder(
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              10.0),
                                                      side: const BorderSide(
                                                          color: AppTheme
                                                              .greenPrimary))),
                                          backgroundColor:
                                              MaterialStateProperty.all<Color>(
                                                  AppTheme.green2),
                                          overlayColor:
                                              MaterialStateProperty.all<Color>(
                                                  Colors.white70),
                                          foregroundColor:
                                              MaterialStateProperty.all<Color>(Colors.white70),
                                          elevation: MaterialStateProperty.resolveWith<double>(
                                            (Set<MaterialState> states) {
                                              if (states.contains(
                                                      MaterialState.pressed) ||
                                                  states.contains(
                                                      MaterialState.disabled)) {
                                                return 0;
                                              }
                                              return 10;
                                            },
                                          ))),
                                ),
                              ),
                              Positioned(
                                top: 105,
                                right: 20,
                                child: Container(
                                  alignment: Alignment.center,
                                  width: 240,
                                  height: 30,
                                  child: ElevatedButton(
                                      child: Image.asset(
                                          "assets/images/month_button.png"),
                                      onPressed: () {
                                        Navigator.of(context)
                                            .pushAndRemoveUntil(
                                                MaterialPageRoute(
                                                    builder: (BuildContext
                                                            context) =>
                                                        const SubcriptionFee()),
                                                (route) => false);
                                      },
                                      style: ButtonStyle(
                                          shape:
                                              MaterialStateProperty.all<RoundedRectangleBorder>(
                                                  RoundedRectangleBorder(
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              10.0),
                                                      side: const BorderSide(
                                                          color: AppTheme
                                                              .greenPrimary))),
                                          backgroundColor:
                                              MaterialStateProperty.all<Color>(
                                                  AppTheme.green1),
                                          overlayColor:
                                              MaterialStateProperty.all<Color>(
                                                  Colors.white70),
                                          foregroundColor:
                                              MaterialStateProperty.all<Color>(Colors.white70),
                                          elevation: MaterialStateProperty.resolveWith<double>(
                                            (Set<MaterialState> states) {
                                              if (states.contains(
                                                      MaterialState.pressed) ||
                                                  states.contains(
                                                      MaterialState.disabled)) {
                                                return 0;
                                              }
                                              return 10;
                                            },
                                          ))),
                                ),
                              ),
                            ],
                          ))
                    ],
                  )),
              /////////////////////////////////////////////////////////////////////Row1
              Padding(
                  padding: const EdgeInsets.all(10),
                  child: Column(
                    children: [
                      SizedBox(
                        height: 175,
                        child: Row(
                          children: [
                            Expanded(
                                flex: 1,
                                child: Container(
                                  margin: const EdgeInsets.only(right: 5),
                                  height: 175,
                                  decoration: BoxDecoration(
                                      color: AppTheme.green1,
                                      border: Border.all(
                                          width: 5,
                                          color: AppTheme.greenPrimary)),
                                  child: Column(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Expanded(
                                        flex: 1,
                                        child: Container(
                                            margin: const EdgeInsets.all(5),
                                            decoration: BoxDecoration(
                                                color: AppTheme.green3,
                                                border: Border.all(
                                                    width: 2,
                                                    color:
                                                        AppTheme.greenPrimary)),
                                            child: const Center(
                                              child: Text(
                                                'Favourite Words',
                                                style: TextStyle(
                                                    fontSize: 16,
                                                    color:
                                                        AppTheme.greenPrimary),
                                              ),
                                            )),
                                      ),
                                      Expanded(
                                        flex: 3,
                                        child: Container(
                                            padding: const EdgeInsets.fromLTRB(
                                                5, 5, 5, 5),
                                            margin: const EdgeInsets.fromLTRB(
                                                5, 0, 5, 0),
                                            child: Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.spaceEvenly,
                                              children: [
                                                Column(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment
                                                          .spaceEvenly,
                                                  children: [
                                                    Container(
                                                      height: 15,
                                                      width: 50,
                                                      decoration: BoxDecoration(
                                                          color: AppTheme
                                                              .greyblock,
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(5)),
                                                    ),
                                                    Container(
                                                      height: 15,
                                                      width: 50,
                                                      decoration: BoxDecoration(
                                                          color: AppTheme
                                                              .greyblock,
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(5)),
                                                    ),
                                                    Container(
                                                      height: 15,
                                                      width: 50,
                                                      decoration: BoxDecoration(
                                                          color: AppTheme
                                                              .greyblock,
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(5)),
                                                    ),
                                                  ],
                                                ),
                                                Column(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment
                                                          .spaceEvenly,
                                                  children: [
                                                    Container(
                                                      height: 15,
                                                      width: 50,
                                                      decoration: BoxDecoration(
                                                          color: AppTheme
                                                              .greyblock,
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(5)),
                                                    ),
                                                    Container(
                                                      height: 15,
                                                      width: 50,
                                                      decoration: BoxDecoration(
                                                          color: AppTheme
                                                              .greyblock,
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(5)),
                                                    ),
                                                    Container(
                                                      height: 15,
                                                      width: 50,
                                                      decoration: BoxDecoration(
                                                          color: AppTheme
                                                              .greyblock,
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(5)),
                                                    ),
                                                  ],
                                                ),
                                              ],
                                            )),
                                      ),
                                      Expanded(
                                          flex: 1,
                                          child: Padding(
                                            padding: const EdgeInsets.fromLTRB(
                                                10, 5, 10, 5),
                                            child: Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment
                                                      .spaceBetween,
                                              children: [
                                                const SizedBox(
                                                  width: 20,
                                                ),
                                                ElevatedButton(
                                                    child: const Text('View all',
                                                        style: TextStyle(
                                                            color: AppTheme
                                                                .greenPrimary,
                                                            fontSize: 12)),
                                                    onPressed: () {},
                                                    style: ButtonStyle(
                                                        shape: MaterialStateProperty.all<
                                                                RoundedRectangleBorder>(
                                                            const RoundedRectangleBorder(
                                                                side: BorderSide(
                                                                    color: AppTheme
                                                                        .greenPrimary))),
                                                        backgroundColor: MaterialStateProperty.all<Color>(
                                                            AppTheme.green3),
                                                        overlayColor: MaterialStateProperty.all<Color>(
                                                            AppTheme.green3),
                                                        foregroundColor:
                                                            MaterialStateProperty.all<Color>(AppTheme.green3),
                                                        elevation: MaterialStateProperty.resolveWith<double>(
                                                          (Set<MaterialState>
                                                              states) {
                                                            if (states.contains(
                                                                    MaterialState
                                                                        .pressed) ||
                                                                states.contains(
                                                                    MaterialState
                                                                        .disabled)) {
                                                              return 0;
                                                            }
                                                            return 10;
                                                          },
                                                        ))),
                                                Image.asset(
                                                    'assets/images/lock.png')
                                              ],
                                            ),
                                          ))
                                    ],
                                  ),
                                )),
                            Expanded(
                                flex: 1,
                                child: Container(
                                  margin: const EdgeInsets.only(left: 5),
                                  height: 175,
                                  decoration: BoxDecoration(
                                      color: AppTheme.green1,
                                      border: Border.all(
                                          width: 5,
                                          color: AppTheme.greenPrimary)),
                                  child: Column(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Expanded(
                                        flex: 1,
                                        child: Container(
                                            margin: const EdgeInsets.all(5),
                                            decoration: BoxDecoration(
                                                color: AppTheme.green3,
                                                border: Border.all(
                                                    width: 2,
                                                    color:
                                                        AppTheme.greenPrimary)),
                                            child: const Center(
                                              child: Text(
                                                'Bookcase',
                                                style: TextStyle(
                                                    fontSize: 16,
                                                    color:
                                                        AppTheme.greenPrimary),
                                              ),
                                            )),
                                      ),
                                      Expanded(
                                        flex: 3,
                                        child: Container(
                                          padding: const EdgeInsets.fromLTRB(
                                              5, 5, 5, 5),
                                          margin: const EdgeInsets.fromLTRB(
                                              0, 5, 0, 5),
                                          child: Stack(
                                            alignment: Alignment.center,
                                            clipBehavior: Clip.none,
                                            children: [
                                              Positioned(
                                                  left: 1,
                                                  bottom: 20,
                                                  child: SizedBox(
                                                    height: 70,
                                                    width: 70,
                                                    child: Image.asset(
                                                        'assets/images/bookdecor.png'),
                                                  )),
                                              Positioned(
                                                  left: 1,
                                                  bottom: 1,
                                                  child: Stack(
                                                    children: <Widget>[
                                                      // Stroked text as border.
                                                      Text(
                                                        "Let's get started!",
                                                        style: TextStyle(
                                                          fontWeight:
                                                              FontWeight.bold,
                                                          fontSize: 12,
                                                          shadows: const [
                                                            Shadow(
                                                              blurRadius: 3.0,
                                                              color: Colors
                                                                  .black38,
                                                              offset: Offset(
                                                                  -2, 5.0),
                                                            ),
                                                          ],
                                                          foreground: Paint()
                                                            ..style =
                                                                PaintingStyle
                                                                    .stroke
                                                            ..strokeWidth = 2
                                                            ..color = AppTheme
                                                                .greenPrimary,
                                                        ),
                                                      ),
                                                      // Solid text as fill.
                                                      const Text(
                                                        "Let's get started!",
                                                        style: TextStyle(
                                                          fontWeight:
                                                              FontWeight.bold,
                                                          fontSize: 12,
                                                          color: Colors.white,
                                                        ),
                                                      ),
                                                    ],
                                                  )),
                                              Positioned(
                                                  right: 1,
                                                  bottom: 5,
                                                  child: SizedBox(
                                                    height: 95,
                                                    width: 95,
                                                    child: Image.asset(
                                                      'assets/images/unlocked.png',
                                                    ),
                                                  )),
                                            ],
                                          ),
                                        ),
                                      ),
                                      Expanded(
                                          flex: 1,
                                          child: Padding(
                                            padding: const EdgeInsets.fromLTRB(
                                                10, 5, 10, 5),
                                            child: Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment
                                                      .spaceBetween,
                                              children: [
                                                const SizedBox(
                                                  width: 20,
                                                ),
                                                ElevatedButton(
                                                    child: const Text('0',
                                                        style: TextStyle(
                                                            color: AppTheme
                                                                .greenPrimary,
                                                            fontSize: 12)),
                                                    onPressed: () {},
                                                    style: ButtonStyle(
                                                        shape: MaterialStateProperty.all<
                                                                RoundedRectangleBorder>(
                                                            const RoundedRectangleBorder(
                                                                side: BorderSide(
                                                                    color: AppTheme
                                                                        .greenPrimary))),
                                                        backgroundColor: MaterialStateProperty.all<Color>(
                                                            AppTheme.green3),
                                                        overlayColor: MaterialStateProperty.all<Color>(
                                                            AppTheme.green3),
                                                        foregroundColor:
                                                            MaterialStateProperty.all<Color>(AppTheme.green3),
                                                        elevation: MaterialStateProperty.resolveWith<double>(
                                                          (Set<MaterialState>
                                                              states) {
                                                            if (states.contains(
                                                                    MaterialState
                                                                        .pressed) ||
                                                                states.contains(
                                                                    MaterialState
                                                                        .disabled)) {
                                                              return 0;
                                                            }
                                                            return 10;
                                                          },
                                                        ))),
                                                Stack(
                                                  children: <Widget>[
                                                    // Stroked text as border.
                                                    Text(
                                                      'Books',
                                                      style: TextStyle(
                                                        fontSize: 12,
                                                        shadows: const [
                                                          Shadow(
                                                            blurRadius: 3.0,
                                                            color: AppTheme
                                                                .greenPrimary,
                                                            offset:
                                                                Offset(-2, 5.0),
                                                          ),
                                                        ],
                                                        foreground: Paint()
                                                          ..style =
                                                              PaintingStyle
                                                                  .stroke
                                                          ..strokeWidth = 1
                                                          ..color =
                                                              Colors.black,
                                                      ),
                                                    ),
                                                    // Solid text as fill.
                                                    const Text(
                                                      'Books',
                                                      style: TextStyle(
                                                        fontSize: 12,
                                                        color: Colors.black,
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                                Image.asset(
                                                    'assets/images/lock.png')
                                              ],
                                            ),
                                          )),
                                    ],
                                  ),
                                )),
                          ],
                        ),
                      ),

/////////////////////////////////////////////////////////////////////////////////////////////////////////////Row2
                      Container(
                        padding: const EdgeInsets.only(top: 10),
                        height: 185,
                        child: Row(
                          children: [
                            Expanded(
                                flex: 1,
                                child: Container(
                                  height: 185,
                                  decoration: BoxDecoration(
                                      color: AppTheme.green2,
                                      border: Border.all(
                                          width: 5,
                                          color: AppTheme.greenPrimary)),
                                  child: Column(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Expanded(
                                        flex: 1,
                                        child: Container(
                                            margin: const EdgeInsets.all(5),
                                            decoration: BoxDecoration(
                                                color: AppTheme.green3,
                                                border: Border.all(
                                                    width: 2,
                                                    color:
                                                        AppTheme.greenPrimary)),
                                            child: const Center(
                                              child: Text(
                                                'Favourite Courses',
                                                style: TextStyle(
                                                    fontSize: 16,
                                                    color:
                                                        AppTheme.greenPrimary),
                                              ),
                                            )),
                                      ),
                                      Expanded(
                                        flex: 2,
                                        child: Container(
                                            padding: const EdgeInsets.fromLTRB(
                                                5, 5, 5, 5),
                                            margin: const EdgeInsets.fromLTRB(
                                                40, 0, 40, 0),
                                            child: Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.spaceEvenly,
                                              children: [
                                                Container(
                                                  height: 60,
                                                  width: 60,
                                                  decoration: BoxDecoration(
                                                      color: AppTheme.greyblock,
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              5)),
                                                ),
                                                Container(
                                                  height: 60,
                                                  width: 60,
                                                  decoration: BoxDecoration(
                                                      color: AppTheme.greyblock,
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              5)),
                                                ),
                                                Container(
                                                  height: 60,
                                                  width: 60,
                                                  decoration: BoxDecoration(
                                                      color: AppTheme.greyblock,
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              5)),
                                                ),
                                              ],
                                            )),
                                      ),
                                      Expanded(
                                          flex: 1,
                                          child: Padding(
                                            padding: const EdgeInsets.fromLTRB(
                                                10, 5, 10, 5),
                                            child: Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment
                                                      .spaceBetween,
                                              children: [
                                                const SizedBox(
                                                  width: 20,
                                                ),
                                                ElevatedButton(
                                                    child: const Text('View all',
                                                        style: TextStyle(
                                                            color: AppTheme
                                                                .greenPrimary,
                                                            fontSize: 12)),
                                                    onPressed: () {},
                                                    style: ButtonStyle(
                                                        shape: MaterialStateProperty.all<
                                                                RoundedRectangleBorder>(
                                                            const RoundedRectangleBorder(
                                                                side: BorderSide(
                                                                    color: AppTheme
                                                                        .greenPrimary))),
                                                        backgroundColor: MaterialStateProperty.all<Color>(
                                                            AppTheme.green3),
                                                        overlayColor: MaterialStateProperty.all<Color>(
                                                            AppTheme.green3),
                                                        foregroundColor:
                                                            MaterialStateProperty.all<Color>(AppTheme.green3),
                                                        elevation: MaterialStateProperty.resolveWith<double>(
                                                          (Set<MaterialState>
                                                              states) {
                                                            if (states.contains(
                                                                    MaterialState
                                                                        .pressed) ||
                                                                states.contains(
                                                                    MaterialState
                                                                        .disabled)) {
                                                              return 0;
                                                            }
                                                            return 10;
                                                          },
                                                        ))),
                                                Image.asset(
                                                    'assets/images/lock.png')
                                              ],
                                            ),
                                          ))
                                    ],
                                  ),
                                )),
                          ],
                        ),
                      ),
/////////////////////////////////////////////////////////////////////////////////////////////////////////////Row3
                      Container(
                        padding: const EdgeInsets.only(top: 10),
                        height: 195,
                        child: Row(
                          children: [
                            Expanded(
                                flex: 1,
                                child: Container(
                                  height: 195,
                                  decoration: BoxDecoration(
                                      color: AppTheme.green3,
                                      border: Border.all(
                                          width: 5,
                                          color: AppTheme.greenPrimary)),
                                  child: Column(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Expanded(
                                        flex: 3,
                                        child: Container(
                                            padding: const EdgeInsets.fromLTRB(
                                                5, 10, 5, 10),
                                            margin: const EdgeInsets.fromLTRB(
                                                5, 0, 5, 0),
                                            child: Column(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.spaceEvenly,
                                              children: [
                                                Row(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment
                                                          .spaceEvenly,
                                                  children: [
                                                    Container(
                                                      height: 50,
                                                      width: 130,
                                                      decoration: BoxDecoration(
                                                          color: AppTheme
                                                              .greyblock,
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(
                                                                      45)),
                                                      child: ElevatedButton(
                                                          child: Row(
                                                            mainAxisAlignment:
                                                                MainAxisAlignment
                                                                    .spaceAround,
                                                            children: [
                                                              SizedBox(
                                                                width: 28,
                                                                height: 28,
                                                                child: Image.asset(
                                                                    "assets/images/settings.png"),
                                                              ),
                                                              SizedBox(
                                                                width: 70,
                                                                child: Stack(
                                                                  children: <
                                                                      Widget>[
                                                                    // Stroked text as border.
                                                                    Text(
                                                                      'Setting',
                                                                      style:
                                                                          TextStyle(
                                                                        fontSize:
                                                                            16,
                                                                        foreground:
                                                                            Paint()
                                                                              ..style = PaintingStyle.stroke
                                                                              ..strokeWidth = 2
                                                                              ..color = Colors.black,
                                                                      ),
                                                                    ),
                                                                    // Solid text as fill.
                                                                    const Text(
                                                                      'Setting',
                                                                      style:
                                                                          TextStyle(
                                                                        fontSize:
                                                                            16,
                                                                        color: Colors
                                                                            .white,
                                                                      ),
                                                                    ),
                                                                  ],
                                                                ),
                                                              ),
                                                            ],
                                                          ),
                                                          onPressed: () {},
                                                          style: ButtonStyle(
                                                              backgroundColor:
                                                                  MaterialStateProperty.all<
                                                                          Color>(
                                                                      AppTheme
                                                                          .greenPrimary),
                                                              foregroundColor:
                                                                  MaterialStateProperty.all<
                                                                          Color>(
                                                                      Colors
                                                                          .white70),
                                                              elevation:
                                                                  MaterialStateProperty
                                                                      .resolveWith<
                                                                          double>(
                                                                (Set<MaterialState>
                                                                    states) {
                                                                  if (states.contains(
                                                                          MaterialState
                                                                              .pressed) ||
                                                                      states.contains(
                                                                          MaterialState
                                                                              .disabled)) {
                                                                    return 0;
                                                                  }
                                                                  return 10;
                                                                },
                                                              ))),
                                                    ),
                                                    Container(
                                                      height: 50,
                                                      width: 130,
                                                      decoration: BoxDecoration(
                                                          color: AppTheme
                                                              .greyblock,
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(
                                                                      45)),
                                                      child: ElevatedButton(
                                                          child: Row(
                                                            mainAxisAlignment:
                                                                MainAxisAlignment
                                                                    .spaceAround,
                                                            children: [
                                                              SizedBox(
                                                                width: 28,
                                                                height: 28,
                                                                child: Image.asset(
                                                                    "assets/images/facebook.png"),
                                                              ),
                                                              SizedBox(
                                                                width: 70,
                                                                child: Stack(
                                                                  children: <
                                                                      Widget>[
                                                                    // Stroked text as border.
                                                                    Text(
                                                                      'Social',
                                                                      style:
                                                                          TextStyle(
                                                                        fontSize:
                                                                            16,
                                                                        foreground:
                                                                            Paint()
                                                                              ..style = PaintingStyle.stroke
                                                                              ..strokeWidth = 2
                                                                              ..color = Colors.black,
                                                                      ),
                                                                    ),
                                                                    // Solid text as fill.
                                                                    const Text(
                                                                      'Social',
                                                                      style:
                                                                          TextStyle(
                                                                        fontSize:
                                                                            16,
                                                                        color: Colors
                                                                            .white,
                                                                      ),
                                                                    ),
                                                                  ],
                                                                ),
                                                              )
                                                            ],
                                                          ),
                                                          onPressed: () {},
                                                          style: ButtonStyle(
                                                              backgroundColor:
                                                                  MaterialStateProperty.all<
                                                                          Color>(
                                                                      AppTheme
                                                                          .greenPrimary),
                                                              foregroundColor:
                                                                  MaterialStateProperty.all<
                                                                          Color>(
                                                                      Colors
                                                                          .white70),
                                                              elevation:
                                                                  MaterialStateProperty
                                                                      .resolveWith<
                                                                          double>(
                                                                (Set<MaterialState>
                                                                    states) {
                                                                  if (states.contains(
                                                                          MaterialState
                                                                              .pressed) ||
                                                                      states.contains(
                                                                          MaterialState
                                                                              .disabled)) {
                                                                    return 0;
                                                                  }
                                                                  return 10;
                                                                },
                                                              ))),
                                                    ),
                                                  ],
                                                ),
                                                Row(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment
                                                          .spaceEvenly,
                                                  children: [
                                                    Container(
                                                      height: 50,
                                                      decoration: BoxDecoration(
                                                          color: AppTheme
                                                              .greyblock,
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(
                                                                      45)),
                                                      child: ElevatedButton(
                                                          child: Row(
                                                            mainAxisAlignment:
                                                                MainAxisAlignment
                                                                    .spaceAround,
                                                            children: [
                                                              SizedBox(
                                                                width: 28,
                                                                height: 28,
                                                                child: Image.asset(
                                                                    "assets/images/report.png"),
                                                              ),
                                                              SizedBox(
                                                                width: 70,
                                                                child: Stack(
                                                                  children: <
                                                                      Widget>[
                                                                    // Stroked text as border.
                                                                    Text(
                                                                      'Report',
                                                                      style:
                                                                          TextStyle(
                                                                        fontSize:
                                                                            16,
                                                                        foreground:
                                                                            Paint()
                                                                              ..style = PaintingStyle.stroke
                                                                              ..strokeWidth = 2
                                                                              ..color = Colors.black,
                                                                      ),
                                                                    ),
                                                                    // Solid text as fill.
                                                                    const Text(
                                                                      'Report',
                                                                      style:
                                                                          TextStyle(
                                                                        fontSize:
                                                                            16,
                                                                        color: Colors
                                                                            .white,
                                                                      ),
                                                                    ),
                                                                  ],
                                                                ),
                                                              )
                                                            ],
                                                          ),
                                                          onPressed: () {},
                                                          style: ButtonStyle(
                                                              backgroundColor:
                                                                  MaterialStateProperty.all<
                                                                          Color>(
                                                                      AppTheme
                                                                          .greenPrimary),
                                                              foregroundColor:
                                                                  MaterialStateProperty.all<
                                                                          Color>(
                                                                      Colors
                                                                          .white70),
                                                              elevation:
                                                                  MaterialStateProperty
                                                                      .resolveWith<
                                                                          double>(
                                                                (Set<MaterialState>
                                                                    states) {
                                                                  if (states.contains(
                                                                          MaterialState
                                                                              .pressed) ||
                                                                      states.contains(
                                                                          MaterialState
                                                                              .disabled)) {
                                                                    return 0;
                                                                  }
                                                                  return 10;
                                                                },
                                                              ))),
                                                    ),
                                                    Container(
                                                      height: 50,
                                                      decoration: BoxDecoration(
                                                          color: AppTheme
                                                              .greyblock,
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(
                                                                      45)),
                                                      child: ElevatedButton(
                                                          child: Row(
                                                            mainAxisAlignment:
                                                                MainAxisAlignment
                                                                    .spaceAround,
                                                            children: [
                                                              SizedBox(
                                                                width: 28,
                                                                height: 28,
                                                                child: Image.asset(
                                                                    "assets/images/help_center.png"),
                                                              ),
                                                              SizedBox(
                                                                width: 70,
                                                                child: Stack(
                                                                  children: <
                                                                      Widget>[
                                                                    // Stroked text as border.
                                                                    Text(
                                                                      'Help Center',
                                                                      style:
                                                                          TextStyle(
                                                                        fontSize:
                                                                            13,
                                                                        foreground:
                                                                            Paint()
                                                                              ..style = PaintingStyle.stroke
                                                                              ..strokeWidth = 2
                                                                              ..color = Colors.black,
                                                                      ),
                                                                    ),
                                                                    // Solid text as fill.
                                                                    const Text(
                                                                      'Help Center',
                                                                      style:
                                                                          TextStyle(
                                                                        fontSize:
                                                                            13,
                                                                        color: Colors
                                                                            .white,
                                                                      ),
                                                                    ),
                                                                  ],
                                                                ),
                                                              )
                                                            ],
                                                          ),
                                                          onPressed: () {
                                                            Navigator.of(
                                                                    context)
                                                                .pushAndRemoveUntil(
                                                                    MaterialPageRoute(
                                                                        builder:
                                                                            gotoHelpCenter),
                                                                    (route) =>
                                                                        false);
                                                          },
                                                          style: ButtonStyle(
                                                              backgroundColor:
                                                                  MaterialStateProperty.all<
                                                                          Color>(
                                                                      AppTheme
                                                                          .greenPrimary),
                                                              foregroundColor:
                                                                  MaterialStateProperty.all<
                                                                          Color>(
                                                                      Colors
                                                                          .white70),
                                                              elevation:
                                                                  MaterialStateProperty
                                                                      .resolveWith<
                                                                          double>(
                                                                (Set<MaterialState>
                                                                    states) {
                                                                  if (states.contains(
                                                                          MaterialState
                                                                              .pressed) ||
                                                                      states.contains(
                                                                          MaterialState
                                                                              .disabled)) {
                                                                    return 0;
                                                                  }
                                                                  return 10;
                                                                },
                                                              ))),
                                                    ),
                                                  ],
                                                )
                                              ],
                                            )),
                                      ),
                                    ],
                                  ),
                                )),
                          ],
                        ),
                      ),

//////// ///////////// Row4
                      Container(
                        padding: const EdgeInsets.only(top: 10),
                        margin: const EdgeInsets.only(top: 10),
                        height: 100,
                        decoration: BoxDecoration(
                            color: Colors.white,
                            border: Border.all(
                                width: 5, color: AppTheme.greenPrimary)),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Stack(
                              children: <Widget>[
                                // Stroked text as border.
                                Text(
                                  'You need an account JGo to save and unlock some features',
                                  style: TextStyle(
                                    fontSize: 12,
                                    foreground: Paint()
                                      ..style = PaintingStyle.stroke
                                      ..strokeWidth = 2
                                      ..color = Colors.black,
                                  ),
                                ),
                                // Solid text as fill.
                                const Text(
                                  'You need an account JGo to save and unlock some features',
                                  style: TextStyle(
                                    fontSize: 12,
                                    color: AppTheme.greenPrimary,
                                  ),
                                ),
                              ],
                            ),
                            Row(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                ElevatedButton(
                                    child: Center(
                                      child: Stack(
                                        children: <Widget>[
                                          // Stroked text as border.
                                          Text(
                                            'Sign In',
                                            style: TextStyle(
                                              fontSize: 16,
                                              foreground: Paint()
                                                ..style = PaintingStyle.stroke
                                                ..strokeWidth = 2
                                                ..color = Colors.black,
                                            ),
                                          ),
                                          // Solid text as fill.
                                          const Text(
                                            'Sign In',
                                            style: TextStyle(
                                              fontSize: 16,
                                              color: Colors.white,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                    onPressed: () {
                                      Navigator.of(context).pushAndRemoveUntil(
                                          MaterialPageRoute(
                                              builder: gotoSignIn),
                                          (route) => false);
                                    },
                                    style: ButtonStyle(
                                        shape: MaterialStateProperty.all<
                                                RoundedRectangleBorder>(
                                            RoundedRectangleBorder(
                                                borderRadius:
                                                    BorderRadius.circular(45.0),
                                                side: const BorderSide(
                                                    color: AppTheme
                                                        .greenPrimary))),
                                        backgroundColor:
                                            MaterialStateProperty.all<Color>(
                                                AppTheme.greenPrimary),
                                        foregroundColor:
                                            MaterialStateProperty.all<Color>(
                                                Colors.white70),
                                        elevation:
                                            MaterialStateProperty.resolveWith<double>(
                                          (Set<MaterialState> states) {
                                            if (states.contains(
                                                    MaterialState.pressed) ||
                                                states.contains(
                                                    MaterialState.disabled)) {
                                              return 0;
                                            }
                                            return 10;
                                          },
                                        ))),
                                ElevatedButton(
                                    child: Center(
                                      child: Stack(
                                        children: <Widget>[
                                          // Stroked text as border.
                                          Text(
                                            'Register',
                                            style: TextStyle(
                                              fontSize: 16,
                                              foreground: Paint()
                                                ..style = PaintingStyle.stroke
                                                ..strokeWidth = 2
                                                ..color = Colors.black,
                                            ),
                                          ),
                                          // Solid text as fill.
                                          const Text(
                                            'Register',
                                            style: TextStyle(
                                              fontSize: 16,
                                              color: Colors.white,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                    onPressed: () {
                                      Navigator.of(context).pushAndRemoveUntil(
                                          MaterialPageRoute(
                                              builder: gotoRegister),
                                          (route) => false);
                                    },
                                    style: ButtonStyle(
                                        shape: MaterialStateProperty.all<
                                                RoundedRectangleBorder>(
                                            RoundedRectangleBorder(
                                                borderRadius:
                                                    BorderRadius.circular(45.0),
                                                side: const BorderSide(
                                                    color: AppTheme
                                                        .greenPrimary))),
                                        backgroundColor:
                                            MaterialStateProperty.all<Color>(
                                                AppTheme.greenPrimary),
                                        foregroundColor:
                                            MaterialStateProperty.all<Color>(
                                                Colors.white70),
                                        elevation:
                                            MaterialStateProperty.resolveWith<double>(
                                          (Set<MaterialState> states) {
                                            if (states.contains(
                                                    MaterialState.pressed) ||
                                                states.contains(
                                                    MaterialState.disabled)) {
                                              return 0;
                                            }
                                            return 10;
                                          },
                                        ))),
                              ],
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(
                        height: 60,
                      )
                    ],
                  ))
            ],
          )),
    ));
  }

  Widget gotoHelpCenter(BuildContext context) {
    return const HelpCenterPageScreen();
  }

  Widget gotoSignIn(BuildContext context) {
    return const LoginByMailScreen();
  }

  Widget gotoRegister(BuildContext context) {
    return const SignUpScreen();
  }
}
