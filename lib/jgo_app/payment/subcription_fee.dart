import 'package:flutter/material.dart';
import '../app_theme.dart';
import '../jgo_home.dart';

class SubcriptionFee extends StatefulWidget {
  const SubcriptionFee({Key? key}) : super(key: key);

  @override
  State<SubcriptionFee> createState() => _SubcriptionFeeState();
}

class _SubcriptionFeeState extends State<SubcriptionFee>
    with SingleTickerProviderStateMixin{

  String _setState = '0';

  final ScrollController _scrollController = ScrollController();

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
        length: 3,
        child: Scaffold(
            body: Container(
                color: Colors.white70,
                child: Column(
                  children: [
                    Container(
                      margin: const EdgeInsets.only(top: 50, bottom: 30),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          IconButton(
                              onPressed: () {
                                Navigator.of(context).pop();
                              },
                              icon: Image.asset("assets/images/back.png")),
                          SizedBox(
                            width: 50,
                            height: 50,
                            child: Image.asset("assets/images/logo.png"),
                          ),
                          const SizedBox(
                            width: 30,
                          ),
                          Stack(
                            children: <Widget>[
                              // Stroked text as border.
                              Text(
                                'Subscription Fee',
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
                                'Subscription Fee',
                                style: TextStyle(
                                  fontSize: 30,
                                  color: AppTheme.greenPrimary,
                                ),
                              ),
                            ],
                          )
                        ],
                      ),
                    ),
                    Expanded(
                      child: TabBarView(
                        children: [
                          // first tab bar view widget
                          Flexible(
                            child: ListView.builder(
                              itemCount: first.length,
                              controller: _scrollController,
                              padding:
                              const EdgeInsets.only(top: 10, bottom: 10),
                              reverse: true,
                              shrinkWrap: true,
                              itemBuilder: (context, index) {
                                return Center(
                                  child: Container(
                                      padding: const EdgeInsets.all(10),
                                      decoration: BoxDecoration(
                                        borderRadius:
                                        BorderRadius.circular(10),
                                      ),
                                      child: Container(
                                        height: 350,
                                        padding: const EdgeInsets.all(20),
                                        child: Image.asset(first[index].image),
                                      )
                                  ),
                                );
                              },
                              //children:  UnmodifiableListView(_messages),
                            ),
                          ),
                          // second tab bar viiew widget
                          Flexible(
                            child: ListView.builder(
                              itemCount: second.length,
                              controller: _scrollController,
                              padding:
                              const EdgeInsets.only(top: 10, bottom: 10),
                              reverse: true,
                              shrinkWrap: true,
                              itemBuilder: (context, index) {
                                return Center(
                                  child: Container(
                                      padding: const EdgeInsets.all(10),
                                      decoration: BoxDecoration(
                                        borderRadius:
                                        BorderRadius.circular(10),
                                      ),
                                      child: Container(
                                        height: 350,
                                        padding: const EdgeInsets.all(20),
                                        child: Image.asset(second[index].image),
                                      )
                                  ),
                                );
                              },
                              //children:  UnmodifiableListView(_messages),
                            ),
                          ),
                          Flexible(
                            child: ListView.builder(
                              itemCount: third.length,
                              controller: _scrollController,
                              padding:
                              const EdgeInsets.only(top: 10, bottom: 10),
                              reverse: true,
                              shrinkWrap: true,
                              itemBuilder: (context, index) {
                                return Center(
                                  child: Container(
                                      padding: const EdgeInsets.all(10),
                                      decoration: BoxDecoration(
                                        borderRadius:
                                        BorderRadius.circular(10),
                                      ),
                                      child: Container(
                                        height: 350,
                                        padding: const EdgeInsets.all(20),
                                        child: Image.asset(third[index].image),
                                      )
                                  ),
                                );
                              },
                              //children:  UnmodifiableListView(_messages),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Container(
                      margin: const EdgeInsets.all(20),
                      height: 50,
                      child: TabBar(
                        //controller: _controller,
                        onTap: (value) {
                          if (value == 0) {
                            setState(() {
                              _setState = '0';
                            });
                          }else if (value == 1) {
                            setState(() {
                              _setState = '1';
                            });
                          }else {
                            setState(() {
                              _setState = '2';
                            });
                          }
                        },
                        unselectedLabelColor: Colors.grey,
                        labelColor: AppTheme.greenPrimary,
                        indicator: const UnderlineTabIndicator(
                            borderSide: BorderSide.none),
                        tabs: [
                          Container(
                            color:_setState == '0' ?  AppTheme.greenPrimary  : Colors.white,
                            child: const Center(
                              child: Text("Trial",style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 15
                              ),),
                            ),
                          ),
                          Container(
                            color:
                            _setState == '1' ?  AppTheme.greenPrimary  : Colors.white,
                            child: const Center(
                              child: Text("Premium",style: TextStyle(
                                  color: Colors.black,fontSize: 15
                              ),),
                            ),
                          ),
                          Container(
                            color: _setState == '2' ?  AppTheme.greenPrimary : Colors.white,
                            child: const Center(
                              child: Text("VIP",style: TextStyle(
                                  color: Colors.black,fontSize: 15
                              ),),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Container(
                      margin: const EdgeInsets.only(top: 20, bottom: 70),
                      alignment: Alignment.center,
                      width: 100,
                      height: 50,
                      child: ElevatedButton(
                          child: Stack(
                            children: [
                              Text(
                                'Next',
                                style: TextStyle(
                                    fontSize: 24,
                                    foreground: Paint()
                                      ..style = PaintingStyle.stroke
                                      ..strokeWidth = 2
                                      ..color = Colors.black
                                ),
                              ),
                              const Text(
                                'Next',
                                style: TextStyle(
                                  fontSize: 24,
                                  color: Colors.white,
                                ),
                              ),
                            ],
                          ),
                          onPressed: (){
                            setState(() {
                              // print(_setState);
                              if(_setState=='2'){
                                ScaffoldMessenger.of(context).showSnackBar(
                                    const SnackBar(content: Text("You Have 1 year to enjoy this moment.")));
                                Navigator.of(context).pushAndRemoveUntil(
                                    MaterialPageRoute(
                                        builder: (BuildContext context) =>
                                        const JGoAppHomeScreen()),
                                        (route) => false);
                              }else if(_setState=='1'){
                                ScaffoldMessenger.of(context).showSnackBar(
                                    const SnackBar(content: Text("You Have 3 months to enjoy this moment.")));
                                Navigator.of(context).pushAndRemoveUntil(
                                    MaterialPageRoute(
                                        builder: (BuildContext context) =>
                                        const JGoAppHomeScreen()),
                                        (route) => false);
                              }
                              ScaffoldMessenger.of(context).showSnackBar(
                                  const SnackBar(content: Text("You Have 14 days to enjoy this moment.")));
                              Navigator.of(context).pushAndRemoveUntil(
                                  MaterialPageRoute(
                                      builder: (BuildContext context) =>
                                      const JGoAppHomeScreen()),
                                      (route) => false);
                            });
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
                ))));
  }

  List<First> first = [
    First(
      image: "assets/images/14d.png",),

  ];
  List<Second> second = [
    Second(image: "assets/images/month.png"),
  ];
  List<Third> third = [
    Third(
      image: "assets/images/year.png",),

  ];
}

class First {
  //component dor chat message demo
  String image;
  First({required this.image});
}

class Second {
  //component dor chat message demo
  String image;
  Second({required this.image});
}
class Third {
  //component dor chat message demo
  String image;
  Third({required this.image});
}

