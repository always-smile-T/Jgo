import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:jgo_exe/jgo_app/main_function/jgo_profile/profile_page_screen_locked.dart';
import 'package:jgo_exe/jgo_app/main_function/jgo_profile/profile_page_screen_unlocked.dart';
import 'main_function/jgo_course/course_page_screen.dart';
import 'main_function/jgo_home/home_page_screen.dart';
import 'model/bottom_bar_view.dart';
import 'model/tab_icon_data.dart';

class JGoAppHomeScreen extends StatefulWidget {
  const JGoAppHomeScreen({Key? key}) : super(key: key);

  @override
  _DoMaAppHomeScreenState createState() => _DoMaAppHomeScreenState();
}

class _DoMaAppHomeScreenState extends State<JGoAppHomeScreen>
    with TickerProviderStateMixin {
  AnimationController? animationController;

  late User user;
  bool isNull = true;

  List<TabIconData> tabIconsList = TabIconData.tabIconsList;

  Widget tabBody = Container(
    color: Colors.white, //bo
  );

  @override
  void initState() {
    for (var tab in tabIconsList) {
      tab.isSelected = false;
    }
    tabIconsList[0].isSelected = true;

    animationController = AnimationController(
        duration: const Duration(milliseconds: 600), vsync: this);
    tabBody = const HomePageScreen();

    try {
      user = FirebaseAuth.instance.currentUser!;
      isNull = false;
    } catch (e) {
      isNull = true;
      print(e);
    }

    super.initState();
  }

  @override
  void dispose() {
    animationController?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: FutureBuilder<bool>(
          future: getData(),
          builder: (BuildContext context, AsyncSnapshot<bool> snapshot) {
            if (!snapshot.hasData) {
              return const SizedBox();
            } else {
              return Stack(
                children: <Widget>[
                  tabBody,
                  bottomBar(),
                ],
              );
            }
          },
        ),
      ),
    );
  }

  Future<bool> getData() async {
    await Future<dynamic>.delayed(const Duration(milliseconds: 200));
    return true;
  }

  Widget bottomBar() {
    return Column(
      children: <Widget>[
        const Expanded(
          child: SizedBox(),
        ),
        BottomBarView(
          tabIconsList: tabIconsList,
          addClick: () {},
          changeIndex: (int index) {
            if (index == 0) {
              animationController?.reverse().then<dynamic>((data) {
                if (!mounted) {
                  return;
                }
                setState(() {
                  tabBody = const HomePageScreen();
                });
              });
            } else if (index == 1) {
              animationController?.reverse().then<dynamic>((data) {
                if (!mounted) {
                  return;
                }
                setState(() {
                  tabBody = const CourseScreen();
                });
              });
            }else if (index == 2) {
              animationController?.reverse().then<dynamic>((data) {
                if (!mounted) {
                  return;
                }
                setState(() {
                  tabBody = isNull ? const ProfileLockScreen() : const ProfileScreen();
                });
              });
            }
          },
        ),
      ],
    );
  }
}
