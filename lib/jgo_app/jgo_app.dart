import 'package:flutter/material.dart';
import 'package:jgo_exe/jgo_app/jgo_home.dart';
import 'package:jgo_exe/jgo_app/mini_function/change_layout.dart';
import 'main_function/jgo_course/course_page_screen.dart';
import 'main_function/jgo_home/home_page_screen.dart';
import 'main_function/jgo_home/post/post_detail_screen.dart';


class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: ChangeLayout(),
    );
  }
}
