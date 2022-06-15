import 'package:flutter/material.dart';
import '../../../app_theme.dart';
import 'help_center_page_screen.dart';

class LiveChatScreen extends StatefulWidget {
  const LiveChatScreen({Key? key}) : super(key: key);

  @override
  _LiveChatScreenState createState() => _LiveChatScreenState();
}

class _LiveChatScreenState extends State<LiveChatScreen> {
  late TextEditingController _messageController = TextEditingController();
  final ScrollController _scrollController = ScrollController();
  final List<Widget> _messages = <Widget>[];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: <Widget>[
          Column(
            children: [
              Container(
                padding: const EdgeInsets.only(top: 30),
                height: 120,
                decoration: const BoxDecoration(
                  borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(30),
                    bottomRight: Radius.circular(30),
                  ),
                  color: AppTheme.green2,
                ),
                child: Row(
                  children: [
                    const SizedBox(
                      width: 20,
                    ),
                    IconButton(
                      onPressed: () {
                        Navigator.of(context).pushAndRemoveUntil(
                            MaterialPageRoute(
                                builder: (BuildContext context) =>
                                    const HelpCenterPageScreen()),
                            (route) => false);
                      },
                      icon: Image.asset('assets/images/back.png'),
                    ),
                    const SizedBox(
                      width: 20,
                    ),
                    Stack(
                      children: <Widget>[
                        // Stroked text as border.
                        Text(
                          'Live Chat',
                          style: TextStyle(
                            fontSize: 16,
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
                          'Live Chat',
                          style: TextStyle(
                            fontSize: 16,
                            color: AppTheme.greenPrimary,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(
                      width: 20,
                    ),
                    Container(
                      alignment: Alignment.center,
                      width: 50,
                      height: 50,
                      child: Image.asset('assets/images/f_q.png'),
                    ),
                    const SizedBox(
                      width: 5,
                    ),
                    Container(
                      alignment: Alignment.center,
                      width: 50,
                      height: 50,
                      child: Image.asset('assets/images/payment_q.png'),
                    ),
                    const SizedBox(
                      width: 5,
                    ),
                    Container(
                      alignment: Alignment.center,
                      width: 50,
                      height: 50,
                      child: Image.asset('assets/images/a_q.png'),
                    ),
                  ],
                ),
              ),
              Flexible(
                child: ListView.builder(
                  //de hien thi tin nhan trong kho luu tru
                  itemCount: messages.length + _messages.length,
                  controller: _scrollController,
                  padding: const EdgeInsets.only(top: 10, bottom: 10),
                  reverse: true,
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  //children:  UnmodifiableListView(_messages),
                  itemBuilder: (context, index) {
                    return Container(
                      padding: const EdgeInsets.only(
                          left: 14, right: 14, top: 10, bottom: 10),
                      child: Align(
                        alignment: (messages[index].messageType == "receiver"
                            ? Alignment.topLeft
                            : Alignment.topRight),
                        child: Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                            color: (messages[index].messageType == "receiver"
                                ? Colors.grey.shade200
                                : Colors.blue[200]),
                          ),
                          padding: const EdgeInsets.all(16),
                          child: Text(
                            messages[index].messageContent,
                            style: const TextStyle(fontSize: 15),
                          ),
                        ),
                      ),
                    );
                  },
                ),
              ),
              const SizedBox(
                height: 59,
              ),
            ],
          ),
          Align(
            alignment: Alignment.bottomLeft,
            child: Container(
              padding: const EdgeInsets.only(left: 10, bottom: 10, top: 10),
              height: 60,
              width: double.infinity,
              color: Colors.white,
              child: Row(
                children: <Widget>[
                  GestureDetector(
                    onTap: () {},
                    child: Container(
                      height: 40,
                      width: 40,
                      decoration: BoxDecoration(
                        color: AppTheme.greenPrimary,
                        borderRadius: BorderRadius.circular(30),
                      ),
                      child: const Icon(
                        Icons.add,
                        color: Colors.white,
                        size: 20,
                      ),
                    ),
                  ),
                  const SizedBox(
                    width: 12,
                  ),
                  Expanded(
                      child: Container(
                    padding: const EdgeInsets.fromLTRB(10, 0, 10, 0),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(45),
                      border: Border.all(
                        width: 1,
                        color: Colors.grey,
                      ),
                      color: AppTheme.grey1,
                    ),
                    child: TextField(
                      cursorColor: Colors.black38,
                      controller: _messageController,
                      decoration: const InputDecoration(
                          hintText: "Message here...",
                          hintStyle: TextStyle(color: Colors.black54),
                          border: InputBorder.none),
                    ),
                  )),
                  const SizedBox(
                    width: 12,
                  ),
                  FloatingActionButton(
                    onPressed: () {
                      setState(() {
                        if (_messageController.text != '') {
                          _messages.insert(
                              0,
                              Container(
                                padding: const EdgeInsets.only(
                                    left: 14, right: 14, top: 10, bottom: 10),
                                child: Align(
                                  alignment: Alignment.topRight,
                                  child: Container(
                                      decoration: const BoxDecoration(
                                        borderRadius: BorderRadius.only(
                                          topLeft: Radius.circular(30),
                                          topRight: Radius.circular(30),
                                          bottomLeft: Radius.circular(30),
                                        ),
                                        color: AppTheme.greenPrimary,
                                      ),
                                      padding: const EdgeInsets.all(16),
                                      child: Text(
                                        _messageController.text,
                                        style: const TextStyle(
                                            color: Colors.white),
                                      )),
                                ),
                              ));
                          _messageController = TextEditingController(text: '');
                        } else {
                          //do nothing
                        }
                      });
                      _scrollController.animateTo(
                        0.0,
                        curve: Curves.easeOut,
                        duration: const Duration(milliseconds: 300),
                      );
                    },
                    child: const Icon(
                      Icons.send,
                      color: Colors.white,
                      size: 15,
                    ),
                    backgroundColor: AppTheme.greenPrimary,
                    elevation: 0,
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  List<ChatMessage> messages = [
    // list message demo
    ChatMessage(messageContent: "Hello, Will", messageType: "receiver"),
    ChatMessage(messageContent: "How have you been?", messageType: "receiver"),
    ChatMessage(
        messageContent: "Hey Kriss, I am doing fine dude. wbu?",
        messageType: "sender"),
    ChatMessage(messageContent: "ehhhh, doing OK.", messageType: "receiver"),
    ChatMessage(
        messageContent: "Is there any thing wrong?", messageType: "sender"),
    ChatMessage(messageContent: "Hello, Will", messageType: "receiver"),
    ChatMessage(messageContent: "How have you been?", messageType: "receiver"),
    ChatMessage(
        messageContent: "Hey Kriss, I am doing fine dude. wbu?",
        messageType: "sender"),
    ChatMessage(messageContent: "ehhhh, doing OK.", messageType: "receiver"),
    ChatMessage(
        messageContent: "Is there any thing wrong?", messageType: "sender"),
  ];
}

class ChatMessage {
  //component dor chat message demo
  String messageContent;
  String messageType;
  ChatMessage({required this.messageContent, required this.messageType});
}
