import 'package:flutter/material.dart';
import 'package:jgo_exe/jgo_app/main_function/jgo_course/lesson/grammar.dart';
import 'package:jgo_exe/jgo_app/main_function/jgo_course/lesson/quiz.dart';
import 'package:jgo_exe/jgo_app/main_function/jgo_course/lesson/vocabulary.dart';
import '../../app_theme.dart';

class CourseDetail extends StatefulWidget {
  const CourseDetail({Key? key,this.id, this.description, this.content, this.tag1, this.tag2, this.imageM, this.colorT1, this.liked}) : super(key: key);
  final id, description, content, tag1, tag2, imageM, colorT1, liked;
  @override
  _CourseDetailState createState() => _CourseDetailState(id, description, content, tag1, tag2, imageM, colorT1, liked);
}

class  _CourseDetailState extends State<CourseDetail> with TickerProviderStateMixin{
  final id, description, content, tag1, tag2, imageM, colorT1;
  late bool liked;
  _CourseDetailState(this.id, this.description, this.content, this.tag1, this.tag2, this.imageM, this.colorT1, this.liked);

  @override
  void initState() {
    super.initState();
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppTheme.background,
      body: Padding(
        padding: const EdgeInsets.all(10),
        child: ListView(children: [
          const SizedBox(
            height: 30,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              IconButton(
                icon: const Icon(Icons.arrow_back),
                onPressed: () {
                  Navigator.of(context).pop();
                },
              ),
              Text(content, style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold, overflow: TextOverflow.clip),),
              const SizedBox(width: 10,),
            ],
          ),
          const SizedBox(height: 30.0),
          SizedBox(
            height: 220,
            child: Stack(
              clipBehavior: Clip.none,
              children: [
                Positioned(
                  height: 200,
                  top: 0,
                  right: 0,
                  left: 0,
                  child: Hero(
                    tag: imageM,
                    child: Image.asset(imageM,
                        height: 200.0, fit: BoxFit.fill)),),
                Positioned(
                  bottom: 0,
                  right: 30,
                  child: IconButton(
                  icon: Image.asset( (liked == true) ? 'assets/images/ticked.png' : 'assets/images/untick.png' , height: 50, width: 50, fit: BoxFit.fill,),
                  onPressed: () {
                    setState(() {
                      liked = !liked;
                    });
                  },
                ),)
              ],
            ),
          ),
          const SizedBox(height: 10.0),
          const Text('Description', textAlign: TextAlign.start,
            style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),),
          const SizedBox(height: 10.0),
          Text(description, textAlign: TextAlign.start,),
          const SizedBox(height: 10.0),
          const Text('Tags', textAlign: TextAlign.start,
            style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),),
          const SizedBox(height: 10.0),
          Row(
            children: [
              Container(
                width: 65,
                color: colorT1,
                child: Text(tag1, textAlign: TextAlign.center, style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w600),),
              ),
              const SizedBox(width: 10.0),
              Container(
                width: 65,
                color: AppTheme.green1,
                child: Text(tag2, textAlign: TextAlign.center,
                  style: const TextStyle(color: Colors.black, fontSize: 16, fontWeight: FontWeight.w600), ),
              ),
            ],
          ),
          const SizedBox(height: 10.0),
          const Text('Milestones', textAlign: TextAlign.start,
            style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),),
          const SizedBox(height: 10.0),
          Image.asset('assets/images/milestones.png', fit: BoxFit.fitWidth),
          const SizedBox(height: 20.0),
          Container(
            margin: const EdgeInsets.only(top: 20, bottom: 70),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                ElevatedButton(
                    child: const SizedBox(
                      width: 70,
                      child: Text(
                        'Vocabulary',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            fontSize: 12,
                            color: Colors.black
                        ),
                      ),
                    ),
                    onPressed: (){
                      Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) => VocabularyPage(
                            id: id,)));
                    },
                    style: ButtonStyle(
                      shape: MaterialStateProperty.all<
                          RoundedRectangleBorder>(
                          RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(15.0),)),
                      backgroundColor: MaterialStateProperty.all<Color>(
                          AppTheme.green1),
                      overlayColor:
                      MaterialStateProperty.all<Color>(Colors.white70),)),
                ElevatedButton(
                    child: const SizedBox(
                      width: 70,
                      child: Text(
                        'Grammar',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            fontSize: 12,
                            color: Colors.black
                        ),
                      ),
                    ),
                    onPressed: (){
                      Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) => GrammarPage(
                            id: id,)));
                    },
                    style: ButtonStyle(
                      shape: MaterialStateProperty.all<
                          RoundedRectangleBorder>(
                          RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(15.0),)),
                      backgroundColor: MaterialStateProperty.all<Color>(
                          AppTheme.green2),
                      overlayColor:
                      MaterialStateProperty.all<Color>(Colors.white70),)),
                ElevatedButton(
                    child: const SizedBox(
                      width: 70,
                      child: Text(
                        'Quiz',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            fontSize: 12,
                            color: Colors.black
                        ),
                      ),
                    ),
                    onPressed: (){
                      Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) => QuizPage(
                            id: id,)));
                    },
                    style: ButtonStyle(
                      shape: MaterialStateProperty.all<
                          RoundedRectangleBorder>(
                          RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(15.0),)),
                      backgroundColor: MaterialStateProperty.all<Color>(
                          AppTheme.green3),
                      overlayColor:
                      MaterialStateProperty.all<Color>(Colors.white70),)),
              ],
            ),
          )
        ]),
      ),
    );
  }
}
