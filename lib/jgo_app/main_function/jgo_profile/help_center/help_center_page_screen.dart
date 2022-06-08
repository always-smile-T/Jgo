import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import '../../../app_theme.dart';
import '../../../jgo_home.dart';
import '../../../jgo_home_profile.dart';
import 'live_chat_page_screen.dart';

class HelpCenterPageScreen extends StatefulWidget {
  const HelpCenterPageScreen({Key? key}) : super(key: key);

  @override
  State<HelpCenterPageScreen> createState() => _HelpCenterPageScreenState();
}

late TextEditingController _searchController = TextEditingController();
final ScrollController _scrollController = ScrollController();
final List<Widget> _messages = <Widget>[];

class _HelpCenterPageScreenState extends State<HelpCenterPageScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Padding(padding:const EdgeInsets.fromLTRB(10, 50, 10, 10),
            child: SingleChildScrollView(
              child: Column(
                children: [
                  SizedBox(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        IconButton(
                            onPressed: () {
                              Navigator.of(context).pushAndRemoveUntil(
                                  MaterialPageRoute(
                                      builder: (BuildContext context) =>
                                      const JGoAppProfileScreen()),
                                      (route) => false);
                            },
                            icon: Image.asset("assets/images/back.png")),
                        Stack(
                          children: <Widget>[
                            // Stroked text as border.
                            Text(
                              'Help Center',
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
                              'Help Center',
                              style: TextStyle(
                                fontSize: 30,
                                color: AppTheme.greenPrimary,
                              ),
                            ),
                          ],
                        ),
                        IconButton(
                            onPressed: () {
                              Navigator.of(context).pushAndRemoveUntil(
                                  MaterialPageRoute(
                                      builder: (BuildContext context) =>
                                      const LiveChatScreen()),
                                      (route) => false);
                              /*PopupMenuButton<Menu>(
                        // Callback that sets the selected popup menu item.
                          onSelected: (Menu item) {
                           /* setState(() {
                              _selectedMenu = item.name ;
                            });*/
                          },
                          itemBuilder: (BuildContext context) => <PopupMenuEntry<Menu>>[
                            const PopupMenuItem<Menu>(
                              value: Menu.itemOne,
                              child: Text('Item 1'),
                            ),
                            const PopupMenuItem<Menu>(
                              value: Menu.itemTwo,
                              child: Text('Item 2'),
                            ),
                          ]);*/
                            }, // dung droplist
                            icon: Image.asset("assets/images/more_options.png")),
                      ],
                    ),
                  ),
                  Padding (padding: const EdgeInsets.fromLTRB(10, 30, 20, 20),
                    child: Stack(
                      alignment: AlignmentDirectional.centerEnd,
                      children: <Widget>[
                        Container(
                          margin: const EdgeInsets.fromLTRB(10, 0, 60, 0),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: TextField(
                            cursorColor: Colors.black,
                            style: const TextStyle(
                                fontSize: 18, color: Colors.black),
                            controller: _searchController,
                            decoration: const InputDecoration(
                                hintText: "Search",
                                focusedBorder: OutlineInputBorder(
                                  borderSide: BorderSide.none,
                                ),
                                labelStyle: TextStyle(
                                    color: Colors.black, fontSize: 15, fontWeight: FontWeight.w500)),
                          ),
                        ),
                        GestureDetector(
                          onTap: onToggleShowPass,
                          child: const Text("Cancel",
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: 13,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        )
                      ],
                    ),
                  ),


                  /////HERE


                  Container(
                    decoration: BoxDecoration(
                        color: AppTheme.grey2,
                        border: Border.all(
                            width: 2,
                            color: AppTheme.greenPrimary
                        )),
                    height: 450,
                    margin: const EdgeInsets.only(right: 10,left: 10,top: 30),
                    child: SingleChildScrollView(
                      child: Container(
                        margin: const EdgeInsets.all(10),
                        child: ListView.builder( //de hien thi tin nhan trong kho luu tru
                          itemCount: messages.length + _messages.length,
                          controller: _scrollController,
                          padding: const EdgeInsets.only(top: 10,bottom: 10),
                          reverse: true,
                          shrinkWrap: true,
                          physics: const NeverScrollableScrollPhysics(),
                          itemBuilder: (context, index){
                            return Container(
                              padding: const EdgeInsets.only(left: 10,right: 10,top: 5,bottom: 5),
                              child: Align(
                                alignment: Alignment.topLeft,
                                child: Container(
                                  padding: const EdgeInsets.all(5),
                                  child: Row(
                                    children: [
                                      SizedBox(
                                        height: messages[index].messageType  == "suggest"?24:0,
                                        width: messages[index].messageType  == "suggest"?24:0,
                                        child: Image.asset(messages[index].messageType  == "suggest"?'assets/images/book.png':''),
                                      ),
                                      SizedBox(
                                        height: messages[index].messageType  == "suggest"?5:0,
                                        width: messages[index].messageType  == "suggest"?5:0,
                                      ),
                                      Expanded(
                                        child: Text(messages[index].messageContent, style: TextStyle(
                                            fontSize: messages[index].messageType  == "suggest"?15:18,
                                            fontWeight: messages[index].messageType  == "suggest"?FontWeight.w400:FontWeight.bold),
                                          overflow: TextOverflow.clip,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            );
                          },
                          //children:  UnmodifiableListView(_messages),
                        ),
                      ),
                    ),
                  )
                ],
              ),
            ))
    );
  }
  void onToggleShowPass() {
    setState(() {
      _searchController.text = ''; //lay phu dinh
    });
  }
  Widget gotoHomePage(BuildContext context) {
    return const JGoAppHomeScreen();
  }
  List<ChatMessage> messages = [ // list message demo
    ChatMessage(messageContent: "why should i pay for this app?", messageType: "suggest"),
    ChatMessage(messageContent: "When is the monthly renewal?", messageType: "suggest"),
    ChatMessage(messageContent: "Can not receive", messageType: "suggest"),
    ChatMessage(messageContent: "Can i pay via e-wallet?", messageType: "suggest"),
    ChatMessage(messageContent: "How is the fee charged?", messageType: "suggest"),
    ChatMessage(messageContent: "Payment & Subscriptions (5)", messageType: "title"),
    ChatMessage(messageContent: "Quick Tips: Be a friend with JGo app", messageType: "suggest"),
    ChatMessage(messageContent: "How is JGo different from other apps?", messageType: "suggest"),
    ChatMessage(messageContent: "Do I have to sign up or sign in to use JGo?", messageType: "suggest"),
    ChatMessage(messageContent: "Getting Started with JGo(3)", messageType: "title"),
    ChatMessage(messageContent: "why should i pay for this app?", messageType: "suggest"),
    ChatMessage(messageContent: "When is the monthly renewal?", messageType: "suggest"),
    ChatMessage(messageContent: "Can not receive", messageType: "suggest"),
    ChatMessage(messageContent: "Can i pay via e-wallet?", messageType: "suggest"),
    ChatMessage(messageContent: "How is the fee charged?", messageType: "suggest"),
    ChatMessage(messageContent: "Payment & Subscriptions(5)", messageType: "title"),
    ChatMessage(messageContent: "Quick Tips: Be a friend with JGo app", messageType: "suggest"),
    ChatMessage(messageContent: "How is JGo different from other apps?", messageType: "suggest"),
    ChatMessage(messageContent: "Do I have to sign up or sign in to use JGo?", messageType: "suggest"),
    ChatMessage(messageContent: "Getting Started with JGo(3)", messageType: "title"),
  ];
}
class ChatMessage{ //component dor chat message demo
  String messageContent;
  String messageType;
  ChatMessage({required this.messageContent, required this.messageType});
}