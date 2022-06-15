import 'package:flutter/material.dart';
import 'package:jgo_exe/jgo_app/app_theme.dart';
import 'package:jgo_exe/jgo_app/main_function/jgo_course/course_detail.dart';

class CourseScreen extends StatefulWidget {
  const CourseScreen({Key? key}) : super(key: key);

  @override
  _CourseScreenState createState() => _CourseScreenState();
}

class _CourseScreenState extends State<CourseScreen>
    with TickerProviderStateMixin {
  final ScrollController _scrollController = ScrollController();
  final TextEditingController _searchController = TextEditingController();

  @override
  void initState() {
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
          )),
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
                const Text(
                  'Starred',
                  style: TextStyle(fontSize: 26, fontWeight: FontWeight.w700),
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
                gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
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
                              fontSize: 12,
                            ),
                            overflow: TextOverflow.ellipsis,
                          ),
                        ),
                        Container(
                          padding: const EdgeInsets.only(top: 5),
                          width: 90,
                          child: Row(
                            children: [
                              Container(
                                width: 25,
                                color: myFCourse[index].colorT1,
                                child: Text(myFCourse[index].nameT1,
                                    textAlign: TextAlign.center),
                              ),
                              Container(
                                width: 65,
                                color: Colors.white,
                                child: Text(
                                  myFCourse[index].nameT2,
                                  textAlign: TextAlign.center,
                                  style: const TextStyle(color: AppTheme.tagN5),
                                ),
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
              children: const [
                Text(
                  'All Course',
                  style: TextStyle(fontSize: 26, fontWeight: FontWeight.w700),
                ),
              ],
            ),
            SizedBox(
              height: 180,
              child: GridView.count(
                scrollDirection: Axis.horizontal,
                crossAxisCount: 1,
                primary: false,
                children: <Widget>[
                  _buildCourse(
                      0,
                      'This is the first course of Learning Japanese N5. In this course, you will learn vocabulary with topics: Country. Furthermore, you learn the grammar N5 in this course.',
                      'Learning Japanese N5 1',
                      'N5',
                      'Country',
                      'assets/images/j8.png',
                      AppTheme.tagN5,
                      false,
                      context),
                  _buildCourse(
                      1,
                      'This is the second course of Learning Japanese N5. In this course, you will learn vocabulary with topics: People. Furthermore, you learn the grammar N5 in this course.',
                      'Learning Japanese N5 2',
                      'N5',
                      'People',
                      'assets/images/j1.png',
                      AppTheme.tagN5,
                      false,
                      context),
                  _buildCourse(
                      2,
                      'This is the first course of Learning Japanese N4. In this course, you will learn vocabulary with topics: Number and The Week. Furthermore, you learn the grammar N4 in this course.',
                      'Learning Japanese N4 1',
                      'N4',
                      'Number',
                      'assets/images/j9.png',
                      AppTheme.tagN4,
                      true,
                      context),
                  _buildCourse(
                      3,
                      'This is the second course of Learning Japanese N4. In this course, you will learn vocabulary with topics: The Week. Furthermore, you learn the grammar N4 in this course.',
                      'Learning Japanese N4 2',
                      'N4',
                      'Week',
                      'assets/images/j3.png',
                      AppTheme.tagN4,
                      true,
                      context),
                  _buildCourse(
                      4,
                      '...updating',
                      'Learning Japanese N3 1',
                      'N3',
                      'Number',
                      'assets/images/j4.png',
                      AppTheme.tagN3,
                      false,
                      context),
                  _buildCourse(
                      5,
                      '...updating',
                      'Learning Japanese N2 1',
                      'N2',
                      'Week',
                      'assets/images/j5.png',
                      AppTheme.tagN2,
                      true,
                      context),
                  _buildCourse(
                      6,
                      '...updating',
                      'Learning Japanese N1 1',
                      'N1',
                      'Country',
                      'assets/images/j10.png',
                      AppTheme.tagN1,
                      false,
                      context),
                  _buildCourse(
                      7,
                      '...updating',
                      'Learning Japanese N3 1',
                      'N3',
                      'People',
                      'assets/images/j6.png',
                      AppTheme.tagN3,
                      false,
                      context),
                  _buildCourse(
                      8,
                      '...updating',
                      'Learning Japanese N2 1',
                      'N2',
                      'People',
                      'assets/images/j7.png',
                      AppTheme.tagN2,
                      false,
                      context),
                  _buildCourse(
                      9,
                      '...updating',
                      'Learning Japanese N1 2',
                      'N1',
                      'Week',
                      'assets/images/j2.png',
                      AppTheme.tagN1,
                      true,
                      context),
                ],
              ),
            )
          ],
        ),
      )),
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
                const Text(
                  'Courses',
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 36),
                ),
                IconButton(
                    onPressed: () {},
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
                    style: const TextStyle(fontSize: 18, color: Colors.black),
                    controller: _searchController,
                    decoration: const InputDecoration(
                        hintText: "Search",
                        border: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.black),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: AppTheme.greenPrimary),
                        ),
                        labelStyle: TextStyle(
                            color: Colors.black,
                            fontSize: 15,
                            fontWeight: FontWeight.w500)),
                  ),
                ),
                SizedBox(
                  height: 34,
                  width: 34,
                  child: IconButton(
                    onPressed: () {},
                    icon: Image.asset("assets/images/search.png"),
                  ),
                ),
              ],
            ),
          ],
        ));
  }

  Widget _buildCourse(int id, String description, String content, String tag1,
      String tag2, String image, Color colorT1, bool? liked, context) {
    return Padding(
        padding:
            const EdgeInsets.only(top: 5.0, bottom: 5.0, left: 5.0, right: 5.0),
        child: InkWell(
            onTap: () {
              Navigator.of(context).push(MaterialPageRoute(
                  builder: (context) => CourseDetail(
                        id: id,
                        description: description,
                        content: content,
                        tag1: tag1,
                        tag2: tag2,
                        imageM: image,
                        colorT1: colorT1,
                        liked: liked,
                      )));
            },
            child: Container(
              margin: const EdgeInsets.all(10),
              height: 120,
              width: 90,
              child: Column(
                children: [
                  Image.asset(
                    image,
                    height: 90,
                    width: 90,
                  ),
                  SizedBox(
                    width: 90,
                    child: Text(
                      content,
                      textAlign: TextAlign.center,
                      style: const TextStyle(
                        color: Colors.black,
                        fontSize: 12,
                      ),
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                  Container(
                    padding: const EdgeInsets.only(top: 5),
                    width: 90,
                    child: Row(
                      children: [
                        Container(
                          width: 25,
                          color: colorT1,
                          child: Text(tag1, textAlign: TextAlign.center),
                        ),
                        Container(
                          width: 65,
                          color: Colors.white,
                          child: Text(
                            tag2,
                            textAlign: TextAlign.center,
                            style: const TextStyle(color: AppTheme.tagN5),
                          ),
                        ),
                      ],
                    ),
                  )
                ],
              ),
            )));
  }

  List<TheCourses> myFCourse = [
    TheCourses(
        courseId: '3',
        content: 'Learning \nJapanese N4 1',
        bgImg: 'assets/images/j9.png',
        liked: true,
        nameT1: 'N4',
        nameT2: 'Number',
        colorT1: AppTheme.tagN4),
    TheCourses(
        courseId: '4',
        content: 'Learning \nJapanese N4 2',
        bgImg: 'assets/images/j3.png',
        liked: true,
        nameT1: 'N4',
        nameT2: 'Week',
        colorT1: AppTheme.tagN4),
    TheCourses(
        courseId: '6',
        content: 'Learning \nJapanese N2 1',
        bgImg: 'assets/images/j5.png',
        liked: true,
        nameT1: 'N2',
        nameT2: 'Week',
        colorT1: AppTheme.tagN2),
    TheCourses(
        courseId: '10',
        content: 'Learning \nJapanese N1 2',
        bgImg: 'assets/images/j2.png',
        liked: true,
        nameT1: 'N1',
        nameT2: 'Week',
        colorT1: AppTheme.tagN1),
  ];
}

class TheCourses {
  //component dor chat message demo
  String courseId;
  String content;
  String bgImg;
  bool liked;
  String nameT1;
  String nameT2;
  Color colorT1;
  TheCourses(
      {required this.courseId,
      required this.content,
      required this.bgImg,
      required this.liked,
      required this.colorT1,
      required this.nameT1,
      required this.nameT2});
}
