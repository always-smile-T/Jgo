import 'package:flutter/material.dart';
import '../../app_theme.dart';

class CourseDetail extends StatelessWidget {
  const CourseDetail({Key? key, this.description, this.content, this.tag1, this.tag2, this.imageM, this.colorT1, this.liked}) : super(key: key);


  final description, content, tag1, tag2, imageM, colorT1, liked;

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
          Container(
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
                  onPressed: () {},
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
            alignment: Alignment.center,
            width: 100,
            height: 50,
            child: ElevatedButton(
                child: const Text(
                      'Start',
                      style: TextStyle(
                          fontSize: 24,
                        color: Colors.black
                      ),
                    ),
                onPressed: (){},
                style: ButtonStyle(
                    minimumSize: MaterialStateProperty.all<Size>(Size.infinite),
                    shape: MaterialStateProperty.all<
                        RoundedRectangleBorder>(
                        RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(15.0),)),
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
        ]),
      ),
    );
  }
}
