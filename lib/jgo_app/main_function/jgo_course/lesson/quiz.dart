import 'package:flutter/material.dart';

import '../../../app_theme.dart';

class QuizPage extends StatefulWidget {
  const QuizPage({Key? key,this.id}) : super(key: key);
  final id;
  @override
  _QuizPageState createState() => _QuizPageState(id);
}

class  _QuizPageState extends State<QuizPage> with TickerProviderStateMixin{
  final id;
  late String check = quiz[id].answer[numOrder].q1.toString();
  int n = 0;
  int numQ = 1;
  int numA = 0;
  int isCorrect = 0;
  late int numOrder = 0;
  final ScrollController _scrollController = ScrollController();
  _QuizPageState(this.id);

  @override
  void initState() {
    super.initState();
  }


  @override
  Widget build(BuildContext context) {
    n = id;
    return Scaffold(
      backgroundColor: AppTheme.green3,
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
              const Text('Complete the quiz', style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold, overflow: TextOverflow.clip),),
              const SizedBox(width: 10,),
            ],
          ),
          Container(
            margin: const EdgeInsets.all(10),
            padding: const EdgeInsets.all(10),
            child: ListView.builder(
              scrollDirection: Axis.vertical,
              itemCount: 1,
              controller: _scrollController,
              padding: const EdgeInsets.all(10),
              shrinkWrap: true,
              itemBuilder: (context, index) {
                return Column(
                  //mainAxisAlignment: MainAxisAlignment.start,
                  //crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(
                      height: 10,
                    ),
                    Text('Question $numQ', style: const TextStyle(fontSize: 20, fontWeight: FontWeight.w700),),
                    Hero(
                        tag: quiz[n].image[numOrder],
                        child: Image.asset(quiz[n].image[numOrder],
                            height: 200.0, fit: BoxFit.fill)),
                    const SizedBox(
                      height: 10,
                    ),
                    Text(quiz[n].question[numOrder],style: const TextStyle(fontSize: 20),),
                        ListView(
                           scrollDirection: Axis.vertical,
                           controller: _scrollController,
                            padding: const EdgeInsets.all(10),
                            shrinkWrap: true,
                          children: [
                            ListTile(
                              title: Text(quiz[n].answer[numOrder].q1),
                              leading: Radio(
                                value: 0,
                                groupValue: numA,
                                onChanged: (index){
                                  setState(() {
                                    numA = 0;
                                    check = quiz[n].answer[numOrder].q1.toString();
                                    isCorrect = 0;
                                  });
                                },
                              ),
                            ),
                            ListTile(
                              title: Text(quiz[n].answer[numOrder].q2),
                              leading: Radio(
                                value: 1,
                                groupValue: numA,
                                onChanged: (index){
                                  setState(() {
                                    numA = 1;
                                    check = quiz[n].answer[numOrder].q2.toString();
                                    isCorrect = 0;
                                  });
                                },
                              ),
                            ),
                            ListTile(
                              title: Text(quiz[n].answer[numOrder].q3),
                              leading: Radio(
                                value: 2,
                                groupValue: numA,
                                onChanged: (index){
                                  setState(() {
                                    numA = 2;
                                    check = quiz[n].answer[numOrder].q3.toString();
                                    isCorrect = 0;
                                  });
                                },
                              ),
                            ),
                            ListTile(
                              title: Text(quiz[n].answer[numOrder].q4),
                              leading: Radio(
                                value: 3,
                                groupValue: numA,
                                onChanged: (index){
                                  setState(() {
                                    numA = 3;
                                    check = quiz[n].answer[numOrder].q4.toString();
                                    isCorrect = 0;
                                  });
                                },
                              ),
                            )
                          ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween
                      ,children: [
                        ElevatedButton(
                            child: SizedBox(
                              width: 100,
                              child: Text( isCorrect == 0 ?'Check': isCorrect == 1? 'Correct' : 'Incorrect',
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  fontSize: 12,
                                  color: isCorrect == 0 ? Colors.black : isCorrect == 1? AppTheme.greenPrimary : Colors.red,
                                ),
                              ),
                            ),
                            onPressed: (){
                              setState(() {
                                if(check == quiz[n].correctAnswer[numOrder].toString()){
                                  isCorrect = 1;
                                } else {
                                  isCorrect = 2;
                                }
                              });
                            },
                            style: ButtonStyle(
                              shape: MaterialStateProperty.all<
                                  RoundedRectangleBorder>(
                                RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(15.0),),),
                              backgroundColor: MaterialStateProperty.all<Color>(
                                  AppTheme.green2),
                              overlayColor:
                              MaterialStateProperty.all<Color>(Colors.white70),)),
                        ElevatedButton(
                            child: SizedBox(
                              width: 100,
                              child: Text( isCorrect == 1 ? 'Next' : 'check please!',
                                textAlign: TextAlign.center,
                                style: const TextStyle(
                                  fontSize: 12,
                                  color: Colors.black,
                                ),
                              ),
                            ),
                            onPressed: (){
                              if(isCorrect == 1){
                                setState(() {
                                  if(numOrder < 4) {
                                    numOrder = numOrder + 1;
                                    isCorrect = 0;
                                    numQ = numQ + 1;
                                  } else if (numOrder == 4){
                                    _showDialog();
                                  }
                                });
                              }
                            },
                            style: ButtonStyle(
                              shape: MaterialStateProperty.all<
                                  RoundedRectangleBorder>(
                                RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(15.0),),),
                              backgroundColor: MaterialStateProperty.all<Color>(
                                  isCorrect == 1 ? AppTheme.greenPrimary : AppTheme.greyblock),
                              overlayColor:
                              MaterialStateProperty.all<Color>(Colors.white70),)),
                      ],
                    )
                  ],
                );
              },
              //children:  UnmodifiableListView(_messages),
            ),
          ),
          const SizedBox(height: 20,)
        ]),
      ),
    );
  }
  _showDialog() async {
    await showDialog<String>(
      context: context,
      builder: (context) => _SystemPadding(
        child:  AlertDialog(
          contentPadding: const EdgeInsets.all(16.0),
          content:  Row(
            children: const <Widget>[
              Text('Awesome, you get all!'),
            ],
          ),
          actions: <Widget>[
            ElevatedButton(
                child: const Text('Try it again'),
                onPressed: () {
                  setState(() {
                    numOrder = 0;
                    isCorrect = 0;
                  });
                  Navigator.pop(context);
                },
                style: ButtonStyle(
                  shape: MaterialStateProperty.all<
                      RoundedRectangleBorder>(
                    RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15.0),),),
                  backgroundColor: MaterialStateProperty.all<Color>(
                      AppTheme.greenPrimary),
                  overlayColor:
                  MaterialStateProperty.all<Color>(Colors.white70),)),
            ElevatedButton(
                child: const Text('Back to this course'),
                onPressed: () {
                  Navigator.pop(context);
                  Navigator.pop(context);
                },
          style: ButtonStyle(
            shape: MaterialStateProperty.all<
                RoundedRectangleBorder>(
              RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(15.0),),),
            backgroundColor: MaterialStateProperty.all<Color>(
                AppTheme.greenPrimary),
            overlayColor:
            MaterialStateProperty.all<Color>(Colors.white70),)),]
      ),),
    );
  }

  List <TheQuiz> quiz = [ // list message demo
    TheQuiz(
        question: ['私は。。。です。\nI am Japanese',' 私は中国人です。', 'たなかさんは　。。。です。',
        'まいさんは韓国人です。', 'Which word is same meaning with "アメリカ人"？'],
        answer: [ TheAnswer(q1: '日本人（にほんじん）', q2: 'アメリカ人（ アメリカじん）',q3: '中国人（ちゅうごくじん）',q4: '韓国人（かんこくじん）'),
  TheAnswer(q1: 'I am Vietnamese', q2: 'I am American',q3: 'I am Korean',q4: 'I am Chinese'),
  TheAnswer(q1: '中国人（ちゅうごくじん）',q2: '日本人（にほんじん）',q3: 'アメリカ人（あめりかじん）',q4: 'イギリス人（いぎりすじん）'),
  TheAnswer(q1: 'Mai is American',q2: 'Mai is French',q3: 'Mai is Korean',q4: 'Mai is Japanese'),
  TheAnswer(q1: 'イギリスじん',q2: 'にほんじん',q3: 'アメリカじん',q4: 'ベトナムじん'),],
        image: ['assets/images/j1.png','assets/images/j2.png','assets/images/j3.png','assets/images/j4.png','assets/images/j5.png'],
        correctAnswer: ['日本人（にほんじん）','I am Chinese','中国人（ちゅうごくじん）','Mai is Korean','ベトナムじん']),
    TheQuiz(
        question: ['私は。。。ではありません。\nI am not Korean','私はベトナム人ではありません。','マイさんは姉ではありません。',
          'Which word is Kanji of "そふ"?','Which word is same meaning with "夫"？'],
        answer: [ TheAnswer(q1: '日本人（にほんじん）',q2: 'アメリカ人（ アメリカじん）',q3: '中国人（ちゅうごくじん）',q4: '韓国人（かんこくじん）'),
          TheAnswer(q1: 'I am Vietnamese', q2: 'I am American',q3: 'I am Korean',q4: 'I am Chinese'),
          TheAnswer(q1: '中国人（ちゅうごくじん）',q2: '日本人（にほんじん）',q3: 'アメリカ人（あめりかじん）',q4: 'イギリス人（いぎりすじん）'),
          TheAnswer(q1: 'Mai is American',q2: 'Mai is French',q3: 'Mai is Korean',q4: 'Mai is Japanese'),
          TheAnswer(q1: 'イギリスじん',q2: 'にほんじん',q3: 'アメリカじん',q4: 'ベトナムじん'),],
        image: ['assets/images/j1.png','assets/images/j2.png','assets/images/j3.png','assets/images/j4.png','assets/images/j5.png'],
        correctAnswer: ['韓国人（かんこくじん）','I am Vietnamese','日本人（にほんじん）','Mai is American','イギリスじん']),
    TheQuiz(
        question: ['One','Twenty two', 'Nine',
          '英語 (えいご) を話す (はなす) ことができます', 'すしを。。。\nI can eat Sushi'],
        answer: [ TheAnswer(q1: 'ニ',q2: '十一',q3: '一',q4: '十'),
          TheAnswer(q1: 'じゅう',q2: 'きゅう',q3: 'まん',q4: 'にじゅうに'),
          TheAnswer(q1: 'ひゃく',q2: 'きゅう',q3: 'きゅ',q4: 'なな'),
          TheAnswer(q1: 'I can eat Sushi',q2: 'I can swim',q3: 'I can speak English',q4: 'I can cook'),
          TheAnswer(q1: '食べることができる。',q2: '作ることができる。',q3: '買うことができる。',q4: '飲むことができる。'),],
        image: ['assets/images/j1.png','assets/images/j2.png','assets/images/j3.png','assets/images/j4.png','assets/images/j5.png'],
        correctAnswer: ['一','にじゅうに','きゅう','I can speak English','食べることができる。']),
    TheQuiz(
        question: ['Today is Tuesday','Today is not Friday','Which word is Kanji of "どようび"?',
          '英語（えいご）の勉強（べんきょう）ができません。','I cannot write Kanji'],
        answer: [ TheAnswer(q1: '今日は火曜日（きょうはかようび）。',q2: '明日は火曜日（あしたはかようび）。',q3: '今日は日曜日。（きょうはにちようび）。',q4: '今日は水曜日（きょうはすいようび）。'),
          TheAnswer(q1: '今日は火曜日（きょうはかようび）。',q2: '明日は火曜日ではありません（あしたはかようびではありません）。',
              q3: '今日は金曜日ではありません。（きょうはきんようびではありません）。',q4: '今日は水曜日（きょうはすいようび）。'),
          TheAnswer(q1:'日曜日',q2:'土曜日',q3: '月曜日',q4: '水曜日'),
          TheAnswer(q1: 'I can learn English', q2: 'I can cook',q3: 'I cannot go to school',q4: 'I cannot learn English'),
          TheAnswer(q1:'漢字（かんじ)を書く (かく)ことができません。',q2: '英語 (えいご) を話す (はなす) ことができません。',
            q3: '漢字（かんじ)を書く (かく)ことができます。',q4: 'すしを食べることができる'),],
        image: ['assets/images/j1.png','assets/images/j2.png','assets/images/j3.png','assets/images/j4.png','assets/images/j5.png'],
        correctAnswer: ['今日は火曜日（きょうはかようび）。','今日は金曜日ではありません。（きょうはきんようびではありません）。',
          '土曜日','I cannot learn English','漢字（かんじ)を書く (かく)ことができません。']),
    TheQuiz(
        question: ['私は。。。です。\nI am Japanese',' 私は中国人です。', 'たなかさんは　。。。です。',
          'まいさんは韓国人です。', 'Which word is same meaning with "アメリカ人"？'],
        answer: [ TheAnswer(q1: '日本人（にほんじん）', q2: 'アメリカ人（ アメリカじん）',q3: '中国人（ちゅうごくじん）',q4: '韓国人（かんこくじん）'),
          TheAnswer(q1: 'I am Vietnamese', q2: 'I am American',q3: 'I am Korean',q4: 'I am Chinese'),
          TheAnswer(q1: '中国人（ちゅうごくじん）',q2: '日本人（にほんじん）',q3: 'アメリカ人（あめりかじん）',q4: 'イギリス人（いぎりすじん）'),
          TheAnswer(q1: 'Mai is American',q2: 'Mai is French',q3: 'Mai is Korean',q4: 'Mai is Japanese'),
          TheAnswer(q1: 'イギリスじん',q2: 'にほんじん',q3: 'アメリカじん',q4: 'ベトナムじん'),],
        image: ['assets/images/j1.png','assets/images/j2.png','assets/images/j3.png','assets/images/j4.png','assets/images/j5.png'],
        correctAnswer: ['日本人（にほんじん）','I am Chinese','中国人（ちゅうごくじん）','Mai is Korean','ベトナムじん']),
    TheQuiz(
        question: ['私は。。。ではありません。\nI am not Korean','私はベトナム人ではありません。','マイさんは姉ではありません。',
          'Which word is Kanji of "そふ"?','Which word is same meaning with "夫"？'],
        answer: [ TheAnswer(q1: '日本人（にほんじん）',q2: 'アメリカ人（ アメリカじん）',q3: '中国人（ちゅうごくじん）',q4: '韓国人（かんこくじん）'),
          TheAnswer(q1: 'I am Vietnamese', q2: 'I am American',q3: 'I am Korean',q4: 'I am Chinese'),
          TheAnswer(q1: '中国人（ちゅうごくじん）',q2: '日本人（にほんじん）',q3: 'アメリカ人（あめりかじん）',q4: 'イギリス人（いぎりすじん）'),
          TheAnswer(q1: 'Mai is American',q2: 'Mai is French',q3: 'Mai is Korean',q4: 'Mai is Japanese'),
          TheAnswer(q1: 'イギリスじん',q2: 'にほんじん',q3: 'アメリカじん',q4: 'ベトナムじん'),],
        image: ['assets/images/j1.png','assets/images/j2.png','assets/images/j3.png','assets/images/j4.png','assets/images/j5.png'],
        correctAnswer: ['韓国人（かんこくじん）','I am Vietnamese','日本人（にほんじん）','Mai is American','イギリスじん']),
    TheQuiz(
        question: ['One','Twenty two', 'Nine',
          '英語 (えいご) を話す (はなす) ことができます', 'すしを。。。\nI can eat Sushi'],
        answer: [ TheAnswer(q1: 'ニ',q2: '十一',q3: '一',q4: '十'),
          TheAnswer(q1: 'じゅう',q2: 'きゅう',q3: 'まん',q4: 'にじゅうに'),
          TheAnswer(q1: 'ひゃく',q2: 'きゅう',q3: 'きゅ',q4: 'なな'),
          TheAnswer(q1: 'I can eat Sushi',q2: 'I can swim',q3: 'I can speak English',q4: 'I can cook'),
          TheAnswer(q1: '食べることができる。',q2: '作ることができる。',q3: '買うことができる。',q4: '飲むことができる。'),],
        image: ['assets/images/j1.png','assets/images/j2.png','assets/images/j3.png','assets/images/j4.png','assets/images/j5.png'],
        correctAnswer: ['一','にじゅうに','きゅう','I can speak English','食べることができる。']),
    TheQuiz(
        question: ['Today is Tuesday','Today is not Friday','Which word is Kanji of "どようび"?',
          '英語（えいご）の勉強（べんきょう）ができません。','I cannot write Kanji'],
        answer: [ TheAnswer(q1: '今日は火曜日（きょうはかようび）。',q2: '明日は火曜日（あしたはかようび）。',q3: '今日は日曜日。（きょうはにちようび）。',q4: '今日は水曜日（きょうはすいようび）。'),
          TheAnswer(q1: '今日は火曜日（きょうはかようび）。',q2: '明日は火曜日ではありません（あしたはかようびではありません）。',
              q3: '今日は金曜日ではありません。（きょうはきんようびではありません）。',q4: '今日は水曜日（きょうはすいようび）。'),
          TheAnswer(q1:'日曜日',q2:'土曜日',q3: '月曜日',q4: '水曜日'),
          TheAnswer(q1: 'I can learn English', q2: 'I can cook',q3: 'I cannot go to school',q4: 'I cannot learn English'),
          TheAnswer(q1:'漢字（かんじ)を書く (かく)ことができません。',q2: '英語 (えいご) を話す (はなす) ことができません。',
              q3: '漢字（かんじ)を書く (かく)ことができます。',q4: 'すしを食べることができる'),],
        image: ['assets/images/j1.png','assets/images/j2.png','assets/images/j3.png','assets/images/j4.png','assets/images/j5.png'],
        correctAnswer: ['今日は火曜日（きょうはかようび）。','今日は金曜日ではありません。（きょうはきんようびではありません）。',
          '土曜日','I cannot learn English','漢字（かんじ)を書く (かく)ことができません。']),TheQuiz(
        question: ['私は。。。です。\nI am Japanese',' 私は中国人です。', 'たなかさんは　。。。です。',
          'まいさんは韓国人です。', 'Which word is same meaning with "アメリカ人"？'],
        answer: [ TheAnswer(q1: '日本人（にほんじん）', q2: 'アメリカ人（ アメリカじん）',q3: '中国人（ちゅうごくじん）',q4: '韓国人（かんこくじん）'),
          TheAnswer(q1: 'I am Vietnamese', q2: 'I am American',q3: 'I am Korean',q4: 'I am Chinese'),
          TheAnswer(q1: '中国人（ちゅうごくじん）',q2: '日本人（にほんじん）',q3: 'アメリカ人（あめりかじん）',q4: 'イギリス人（いぎりすじん）'),
          TheAnswer(q1: 'Mai is American',q2: 'Mai is French',q3: 'Mai is Korean',q4: 'Mai is Japanese'),
          TheAnswer(q1: 'イギリスじん',q2: 'にほんじん',q3: 'アメリカじん',q4: 'ベトナムじん'),],
        image: ['assets/images/j1.png','assets/images/j2.png','assets/images/j3.png','assets/images/j4.png','assets/images/j5.png'],
        correctAnswer: ['日本人（にほんじん）','I am Chinese','中国人（ちゅうごくじん）','Mai is Korean','ベトナムじん']),
    TheQuiz(
        question: ['私は。。。ではありません。\nI am not Korean','私はベトナム人ではありません。','マイさんは姉ではありません。',
          'Which word is Kanji of "そふ"?','Which word is same meaning with "夫"？'],
        answer: [ TheAnswer(q1: '日本人（にほんじん）',q2: 'アメリカ人（ アメリカじん）',q3: '中国人（ちゅうごくじん）',q4: '韓国人（かんこくじん）'),
          TheAnswer(q1: 'I am Vietnamese', q2: 'I am American',q3: 'I am Korean',q4: 'I am Chinese'),
          TheAnswer(q1: '中国人（ちゅうごくじん）',q2: '日本人（にほんじん）',q3: 'アメリカ人（あめりかじん）',q4: 'イギリス人（いぎりすじん）'),
          TheAnswer(q1: 'Mai is American',q2: 'Mai is French',q3: 'Mai is Korean',q4: 'Mai is Japanese'),
          TheAnswer(q1: 'イギリスじん',q2: 'にほんじん',q3: 'アメリカじん',q4: 'ベトナムじん'),],
        image: ['assets/images/j1.png','assets/images/j2.png','assets/images/j3.png','assets/images/j4.png','assets/images/j5.png'],
        correctAnswer: ['韓国人（かんこくじん）','I am Vietnamese','日本人（にほんじん）','Mai is American','イギリスじん']),
    TheQuiz(
        question: ['One’','Twenty two’', 'Nine',
          '英語 (えいご) を話す (はなす) ことができます', 'すしを。。。\nI can eat Sushi'],
        answer: [ TheAnswer(q1: 'ニ',q2: '十一',q3: '一',q4: '十'),
          TheAnswer(q1: 'じゅう',q2: 'きゅう',q3: 'まん',q4: 'にじゅうに'),
          TheAnswer(q1: 'ひゃく',q2: 'きゅう',q3: 'きゅ',q4: 'なな'),
          TheAnswer(q1: 'I can eat Sushi',q2: 'I can swim',q3: 'I can speak English',q4: 'I can cook'),
          TheAnswer(q1: '食べることができる。',q2: '作ることができる。',q3: '買うことができる。',q4: '飲むことができる。'),],
        image: ['assets/images/j1.png','assets/images/j2.png','assets/images/j3.png','assets/images/j4.png','assets/images/j5.png'],
        correctAnswer: ['一','にじゅうに','きゅう','I can speak English','食べることができる。']),
    TheQuiz(
        question: ['Today is Tuesday','Today is not Friday','Which word is Kanji of "どようび"?',
          '英語（えいご）の勉強（べんきょう）ができません。','I cannot write Kanji'],
        answer: [ TheAnswer(q1: '今日は火曜日（きょうはかようび）。',q2: '明日は火曜日（あしたはかようび）。',q3: '今日は日曜日。（きょうはにちようび）。',q4: '今日は水曜日（きょうはすいようび）。'),
          TheAnswer(q1: '今日は火曜日（きょうはかようび）。',q2: '明日は火曜日ではありません（あしたはかようびではありません）。',
              q3: '今日は金曜日ではありません。（きょうはきんようびではありません）。',q4: '今日は水曜日（きょうはすいようび）。'),
          TheAnswer(q1:'日曜日',q2:'土曜日',q3: '月曜日',q4: '水曜日'),
          TheAnswer(q1: 'I can learn English', q2: 'I can cook',q3: 'I cannot go to school',q4: 'I cannot learn English'),
          TheAnswer(q1:'漢字（かんじ)を書く (かく)ことができません。',q2: '英語 (えいご) を話す (はなす) ことができません。',
              q3: '漢字（かんじ)を書く (かく)ことができます。',q4: 'すしを食べることができる'),],
        image: ['assets/images/j1.png','assets/images/j2.png','assets/images/j3.png','assets/images/j4.png','assets/images/j5.png'],
        correctAnswer: ['今日は火曜日（きょうはかようび）。','今日は金曜日ではありません。（きょうはきんようびではありません）。',
          '土曜日','I cannot learn English','漢字（かんじ)を書く (かく)ことができません。']),
  ];
}

class TheQuiz {
  List question;
  List image;
  List <TheAnswer> answer = [
     TheAnswer(q1: '',q2: '',q3: '', q4: '' )
  ] ;
  List correctAnswer;
  TheQuiz({required this.question, required this.answer,required this.image,required this.correctAnswer,});
}

class TheAnswer{
  String q1;
  String q2;
  String q3;
  String q4;
  TheAnswer({required this.q1, required this.q2, required this.q3, required this.q4, });
}
class _SystemPadding extends StatelessWidget {
  final Widget child;

  _SystemPadding({ Key? key, required this.child}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var mediaQuery = MediaQuery.of(context);
    return  AnimatedContainer(
        padding: mediaQuery.viewInsets,
        duration: const Duration(milliseconds: 300),
        child: child);
  }
}
