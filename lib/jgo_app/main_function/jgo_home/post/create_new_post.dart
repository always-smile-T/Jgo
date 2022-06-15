import 'package:flutter/material.dart';
import 'package:jgo_exe/jgo_app/jgo_home.dart';
import '../../../app_theme.dart';
//setState 210

class CreatePostScreen extends StatefulWidget {
  const CreatePostScreen({Key? key}) : super(key: key);

  @override
  _CreatePostScreenState createState() => _CreatePostScreenState();
}

class _CreatePostScreenState extends State<CreatePostScreen> {
  //bool _value = false;
  final TextEditingController _titleController = TextEditingController();
  final TextEditingController _postController = TextEditingController();

  @override
  void initState() => super.initState();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: const EdgeInsets.fromLTRB(5, 0, 5, 0),
        constraints: const BoxConstraints.expand(),
        color: Colors.white,
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(30),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                margin: const EdgeInsets.all(15),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    IconButton(
                        onPressed: () {
                          Navigator.of(context).pushAndRemoveUntil(
                              MaterialPageRoute(
                                  builder: (BuildContext context) =>
                                  const JGoAppHomeScreen()),
                                  (route) => false);
                        },
                        icon: Image.asset("assets/images/back.png")),
                    Center(
                      child: Stack(
                        children: <Widget>[
                          // Stroked text as border.
                          Text(
                            'New post',
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
                            'New post',
                            style: TextStyle(
                              fontSize: 30,
                              color: AppTheme.greenPrimary,
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(
                      width: 20,
                    )
                  ],
                ),
              ),
              SizedBox(
                  height: 100,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: const [
                      CircleAvatar(
                        radius: 35,
                        backgroundImage:
                        AssetImage("assets/images/shizuka.png"),
                      ),
                      Text(
                        "Minamoto Shizuka",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.w400,
                          fontSize: 20,),
                      ),
                      SizedBox(
                        width: 50,
                      ),
                    ],
                  )),
              Padding(
                padding: const EdgeInsets.fromLTRB(0, 10, 0, 0),
                child: Container(
                  height: 88,
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
                    controller: _titleController,
                    decoration: const InputDecoration(
                        border: OutlineInputBorder(borderSide: BorderSide.none),
                        hintText: "Write your title ...",
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
                  height: 226,
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
                    controller: _postController,
                    decoration: const InputDecoration(
                        border: OutlineInputBorder(borderSide: BorderSide.none),
                        hintText: "What’s on your mind?",
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
                height: 40,
              ),
              Container(
                alignment: Alignment.center,
                child: SizedBox(
                  width: 135,
                  height: 50,
                  child: ElevatedButton(
                      child:
                      Stack(
                        children: <Widget>[
                          // Stroked text as border.
                          Text(
                            'Post',
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
                            'Post',
                            style: TextStyle(
                              fontSize: 30,
                              color: Colors.white,
                            ),
                          ),
                        ],
                      ),
                      onPressed: notEmpty,
                      style: ButtonStyle(
                          alignment: Alignment.center,
                          shape: MaterialStateProperty.all<
                              RoundedRectangleBorder>(
                              RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(45.0),
                                  side: const BorderSide(color: Colors.black))),
                          backgroundColor: MaterialStateProperty.resolveWith<Color>(
                                  (Set<MaterialState> states) {
                                if (_titleController.text.isNotEmpty
                                    && _postController.text.isNotEmpty){
                                  AppTheme.greenPrimary;
                                }  return Colors.grey;
                              }),
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
              ),
              const SizedBox(
                height: 10,
              ),
            ],
          ),
        ),
      ),
    );
  }


  /*Widget CreatePost(BuildContext context) {
    return const HomePageScreen();
  }*/

  notEmpty() {
    if (_titleController.text.isNotEmpty && _postController.text.isNotEmpty) {
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text("cannot be blank")));
    }
  }
}
