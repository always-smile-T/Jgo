import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:jgo_exe/jgo_app/app_theme.dart';
import 'package:jgo_exe/jgo_app/main_function/jgo_home/post/post_detail_screen.dart';


class CourseScreen extends StatefulWidget {
  const CourseScreen({Key? key, this.animationController})
      : super(key: key);

  final AnimationController? animationController;

  @override
  _CourseScreenState createState() => _CourseScreenState();
}

class _CourseScreenState extends State<CourseScreen>
    with TickerProviderStateMixin {
  String? idFolder = "";
  String? search = "";
  Animation<double>? topBarAnimation;
  final ScrollController _scrollController = ScrollController();
  final TextEditingController _searchController = TextEditingController();
  bool _setState = true;
  List<Widget> listViews = <Widget>[];
  final ScrollController scrollController = ScrollController();
  double topBarOpacity = 0.0;

  @override
  void initState() {
    topBarAnimation = Tween<double>(begin: 0.0, end: 1.0).animate(
        CurvedAnimation(
            parent: widget.animationController!,
            curve: const Interval(0, 0.5, curve: Curves.fastOutSlowIn)));

    scrollController.addListener(() {
      if (scrollController.offset >= 24) {
        if (topBarOpacity != 1.0) {
          setState(() {
            topBarOpacity = 1.0;
          });
        }
      } else if (scrollController.offset <= 24 &&
          scrollController.offset >= 0) {
        if (topBarOpacity != scrollController.offset / 24) {
          setState(() {
            topBarOpacity = scrollController.offset / 24;
          });
        }
      } else if (scrollController.offset <= 0) {
        if (topBarOpacity != 0.0) {
          setState(() {
            topBarOpacity = 0.0;
          });
        }
      }
    });
    super.initState();
  }


  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
          backgroundColor: AppTheme.background,
          body: Container(
            color: AppTheme.background,
            child: Stack(
              children: [
                getMainListViewUI(),
                getAppBarUI(),
              ],
            ),
          )
      ),
    );
  }

  Widget getMainListViewUI() {
    return Positioned(
      child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.fromLTRB(10, 170, 10, 70),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    const Text('Starred', style: TextStyle(
                        fontSize: 26, fontWeight: FontWeight.w700
                    ),
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                    Image.asset('assets/images/ticked.png')
                  ],
                ),
                SizedBox(
                  height: 180,
                    child: GridView.builder(
                      gridDelegate:
                      const SliverGridDelegateWithMaxCrossAxisExtent(
                          maxCrossAxisExtent: 180,
                          childAspectRatio: 1,
                          crossAxisSpacing: 20,
                          mainAxisSpacing: 10),
                      scrollDirection: Axis.horizontal,
                      itemCount: myFCourse.length,
                      controller: _scrollController,
                      padding: const EdgeInsets.only(top: 10),
                      //reverse: true,
                      shrinkWrap: true,
                      itemBuilder: (context, index) {
                          return Container(
                            margin: const EdgeInsets.all(10),
                            height: 120,
                            width: 90,
                            child: Column(
                              children: [
                                Image.asset(
                                  myFCourse[index].bgImg,
                                  height: 90,
                                  width: 90,
                                ),
                                SizedBox(
                                  width: 90,
                                  child: Text(
                                    myFCourse[index].content,
                                    textAlign: TextAlign.center,
                                    style: const TextStyle(
                                      color: Colors.black,
                                      fontSize: 12, ),
                                    overflow: TextOverflow.ellipsis,
                                  ),
                                ),
                                Container(
                                  padding:const EdgeInsets.only(top: 5),
                                  width: 90,
                                  child: Row(
                                    children: [
                                      Container(
                                        width: 25,
                                        color: myFCourse[index].colorT1,
                                        child: Text(myFCourse[index].nameT1, textAlign: TextAlign.center),
                                      ),
                                      Container(
                                        width: 65,
                                        color: Colors.white,
                                        child: Text(myFCourse[index].nameT2, textAlign: TextAlign.center,
                                          style: const TextStyle(color: AppTheme.tagN5), ),
                                      ),
                                    ],
                                  ),
                                )
                              ],
                            ),
                          );
                      },
                      //children:  UnmodifiableListView(_messages),
                    ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    const Text('Top Choices', style: TextStyle(
                        fontSize: 26, fontWeight: FontWeight.w700
                    ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 180,
                  child: GridView.builder(
                    gridDelegate:
                    const SliverGridDelegateWithMaxCrossAxisExtent(
                        maxCrossAxisExtent: 180,
                        childAspectRatio: 1,
                        crossAxisSpacing: 20,
                        mainAxisSpacing: 10),
                    scrollDirection: Axis.horizontal,
                    itemCount: course.length,
                    controller: _scrollController,
                    padding: const EdgeInsets.only(top: 10),
                    //reverse: true,
                    shrinkWrap: true,
                    itemBuilder: (context, index) {
                      return Container(
                        margin: const EdgeInsets.all(10),
                        height: 120,
                        width: 90,
                        child: Column(
                          children: [
                            Image.asset(
                              course[index].bgImg,
                              height: 90,
                              width: 90,
                            ),
                            SizedBox(
                              width: 90,
                              child: Text(
                                course[index].content,
                                textAlign: TextAlign.center,
                                style: const TextStyle(
                                  color: Colors.black,
                                  fontSize: 12, ),
                                overflow: TextOverflow.ellipsis,
                              ),
                            ),
                            Container(
                              padding:const EdgeInsets.only(top: 5),
                              width: 90,
                              child: Row(
                                children: [
                                  Container(
                                    width: 25,
                                    color: course[index].colorT1,
                                    child: Text(course[index].nameT1, textAlign: TextAlign.center),
                                  ),
                                  Container(
                                    width: 65,
                                    color: Colors.white,
                                    child: Text(course[index].nameT2, textAlign: TextAlign.center,
                                      style: const TextStyle(color: AppTheme.tagN5), ),
                                  ),
                                ],
                              ),
                            )
                          ],
                        ),
                      );
                    },
                    //children:  UnmodifiableListView(_messages),
                  ),
                )
              ],
            ),
          )
          ),
    );
  }

  Widget getAppBarUI() {
    return Container(
        height: 160,
        color: AppTheme.background,
        child: Column(
          children: [
            const SizedBox(
              height: 40,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              verticalDirection: VerticalDirection.down,
              children: [
                const SizedBox(
                  width: 10,
                ),
                const Text('Courses', style: TextStyle(
                  fontWeight: FontWeight.bold, fontSize: 36
                ),),
                IconButton(onPressed: (){},
                    icon: Image.asset(('assets/images/filter.png')))
              ],
            ),
            const SizedBox(
              height: 20,
            ),
            Stack(
              alignment: AlignmentDirectional.centerEnd,
              children: <Widget>[
                Container(
                  height: 40,
                  margin: const EdgeInsets.fromLTRB(10, 0, 60, 0),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(30),
                  ),
                  child: TextField(
                    textAlignVertical: TextAlignVertical.center,
                    cursorColor: Colors.black,
                    style: const TextStyle(
                        fontSize: 18, color: Colors.black),
                    controller: _searchController,
                    decoration: const InputDecoration(
                        hintText: "Search",
                        border: OutlineInputBorder(
                          borderSide:
                          BorderSide(color: Colors.black),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderSide:
                          BorderSide(color: AppTheme.greenPrimary),
                        ),
                        labelStyle: TextStyle(
                            color: Colors.black, fontSize: 15, fontWeight: FontWeight.w500)),
                  ),
                ),
                SizedBox(
                  height: 34,
                  width: 34,
                  child: IconButton(
                    onPressed: () {},
                    icon:  Image.asset("assets/images/search.png"),),
                ),
              ],
            ),
          ],
        )
    );
  }
  List<TheCourses> course = [ // list message demo
    TheCourses(courseId: '1', content: 'Learning \nJapanese N5 1', bgImg: 'assets/images/j8.png',liked: false, nameT1: 'N5', nameT2: 'Country', colorT1: AppTheme.tagN5),
    TheCourses(courseId: '2', content: 'Learning \nJapanese N5 2', bgImg: 'assets/images/j1.png',liked: false, nameT1: 'N5', nameT2: 'People', colorT1: AppTheme.tagN5),
    TheCourses(courseId: '3', content: 'Learning \nJapanese N4 1', bgImg: 'assets/images/j9.png',liked: true, nameT1: 'N4', nameT2: 'Number', colorT1: AppTheme.tagN4),
    TheCourses(courseId: '4', content: 'Learning \nJapanese N4 2', bgImg: 'assets/images/j3.png',liked: true, nameT1: 'N4', nameT2: 'Week', colorT1: AppTheme.tagN4),
    TheCourses(courseId: '5', content: 'Learning \nJapanese N3 1', bgImg: 'assets/images/j4.png',liked: false, nameT1: 'N3', nameT2: 'Number', colorT1: AppTheme.tagN3),
    TheCourses(courseId: '6', content: 'Learning \nJapanese N2 1', bgImg: 'assets/images/j5.png',liked: true, nameT1: 'N2', nameT2: 'Week', colorT1: AppTheme.tagN2),
    TheCourses(courseId: '7', content: 'Learning \nJapanese N1 1', bgImg: 'assets/images/j10.png',liked: false, nameT1: 'N1', nameT2: 'Country', colorT1: AppTheme.tagN1),
    TheCourses(courseId: '8', content: 'Learning \nJapanese N3 2', bgImg: 'assets/images/j6.png',liked: false, nameT1: 'N3', nameT2: 'People', colorT1: AppTheme.tagN3),
    TheCourses(courseId: '9', content: 'Learning \nJapanese N2 2', bgImg: 'assets/images/j7.png',liked: false, nameT1: 'N2', nameT2: 'People', colorT1: AppTheme.tagN2),
    TheCourses(courseId: '10', content: 'Learning \nJapanese N1 2', bgImg: 'assets/images/j2.png',liked: true, nameT1: 'N1', nameT2: 'Week', colorT1: AppTheme.tagN1),
  ];
  List<TheCourses> myFCourse = [
    TheCourses(courseId: '3', content: 'Learning \nJapanese N4 1', bgImg: 'assets/images/j9.png',liked: true, nameT1: 'N4', nameT2: 'Number', colorT1: AppTheme.tagN4),
    TheCourses(courseId: '4', content: 'Learning \nJapanese N4 2', bgImg: 'assets/images/j3.png',liked: true, nameT1: 'N4', nameT2: 'Week', colorT1: AppTheme.tagN4),
    TheCourses(courseId: '6', content: 'Learning \nJapanese N2 1', bgImg: 'assets/images/j5.png',liked: true, nameT1: 'N2', nameT2: 'Week', colorT1: AppTheme.tagN2),
    TheCourses(courseId: '10', content: 'Learning \nJapanese N1 2', bgImg: 'assets/images/j2.png',liked: true, nameT1: 'N1', nameT2: 'Week', colorT1: AppTheme.tagN1),
  ];
  }
class TheCourses{ //component dor chat message demo
  String courseId;
  String content;
  String bgImg;
  bool liked;
  String nameT1;
  String nameT2;
  Color colorT1;
  TheCourses({required this.courseId,required this.content,required this.bgImg,required this.liked,required this.colorT1,required this.nameT1,required this.nameT2});
}