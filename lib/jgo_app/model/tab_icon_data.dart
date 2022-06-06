import 'package:flutter/material.dart';

class TabIconData {
  TabIconData({
    this.imagePath = '',
    this.index = 0,
    this.selectedImagePath = '',
    this.isSelected = false,
    this.animationController,
  });

  String imagePath;
  String selectedImagePath;
  bool isSelected;
  int index;

  AnimationController? animationController;

  static List<TabIconData> tabIconsList = <TabIconData>[
    TabIconData(
      imagePath: 'assets/images/home.png',
      selectedImagePath: 'assets/images/home1.png',
      index: 0,
      isSelected: true,
      animationController: null,
    ),
    TabIconData(
      imagePath: 'assets/images/book.png',
      selectedImagePath: 'assets/images/book1.png',
      index: 1,
      isSelected: false,
      animationController: null,
    ),
    TabIconData(
      imagePath: 'assets/images/my_course.png',
      selectedImagePath: 'assets/images/my_course1.png',
      index: 2,
      isSelected: false,
      animationController: null,
    ),
    TabIconData(
      imagePath: 'assets/images/user.png',
      selectedImagePath: 'assets/images/user1.png',
      index: 3,
      isSelected: false,
      animationController: null,
    ),
  ];
}
