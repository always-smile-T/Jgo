import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../app_theme.dart';

class VocabularyPage extends StatefulWidget {
  const VocabularyPage({Key? key,this.id}) : super(key: key);
  final id;
  @override
  _VocabularyPageState createState() => _VocabularyPageState(id);
}

class  _VocabularyPageState extends State<VocabularyPage> with TickerProviderStateMixin{
  final id;
   int n = 0;
  final ScrollController _scrollController = ScrollController();
  _VocabularyPageState(this.id);

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
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              IconButton(
                icon: const Icon(Icons.arrow_back),
                onPressed: () {
                  Navigator.of(context).pop();
                },
              ),
              const Text('Vocabulary', style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold, overflow: TextOverflow.clip),),
              const SizedBox(width: 10,),
            ],
          ),
          const SizedBox(height: 30.0),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Container(
                margin: const EdgeInsets.all(5),
                child:  const Text('Kanji', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18, color: AppTheme.greenPrimary),),
              ),
              Container(
                margin: const EdgeInsets.all(5),
                child:  const Text('Other', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18, color: AppTheme.greenPrimary),),
              ),
            ],
          ),
          const Divider(
            color: Colors.black,
            height: 2,
            thickness: 0.5,
          ),
          ListView.builder(
              scrollDirection: Axis.vertical,
              itemCount: vocab[n].kanji.length,
              controller: _scrollController,
              padding: const EdgeInsets.only(top: 10),
              //reverse: true,
              shrinkWrap: true,
              itemBuilder: (context, index) {
                return Column(
                  children: [
                    Container(
                      margin: const EdgeInsets.all(10),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Container(
                            margin: const EdgeInsets.all(5),
                            child: Text(vocab[n].kanji[index], style: const TextStyle(fontWeight: FontWeight.w600),
                              textAlign: TextAlign.start,),
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Row(
                                children: [
                                  const Text('Word: ',  style: TextStyle(fontWeight: FontWeight.w400)),
                                  Text(vocab[n].word[index], style: const TextStyle(fontWeight: FontWeight.w600,),),
                                ],
                              ),
                              Row(
                                children: [
                                  const Text('Type: ', style: TextStyle(fontWeight: FontWeight.w400),),
                                  Text(vocab[n].type[index], style: const TextStyle(fontWeight: FontWeight.w600),),
                                ],
                              ),
                              Row(
                                children: [
                                  const Text('Meaning: ', style: TextStyle(fontWeight: FontWeight.w400),),
                                  Text(vocab[n].meaning[index], style: const TextStyle(fontWeight: FontWeight.w600),),
                                ],
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                    const Divider(
                      color: AppTheme.greenPrimary,
                      height: 2,
                      thickness: 0.5,
                      indent: 20,
                      endIndent: 20,
                    ),
                  ],
                );
              },
              //children:  UnmodifiableListView(_messages),
            ),
          const SizedBox(height: 20,)
        ]),
      ),
    );
  }
  List<TheVocab> vocab = [ // list message demo
    TheVocab( kanji: ['日本人', 'アメリカ人', 'イギリス人' , '中国人','韓国人','ベトナム人'],
        type: ['noun','noun','noun','noun','noun','noun',],
        word: ['にほんじん','アメリカじん','イギリスじん','ちゅうごくじん','かんこくじん','ベトナムじん'],
        meaning: ['Japanese','American', 'British', 'Chinese','Korean','Vietnamese']),
    TheVocab( kanji: ['祖父', '祖母', '父' , '母','姉','兄','妹','弟','恋人','夫','妻'],
        type: ['noun','noun','noun','noun','noun','noun','noun','noun','noun','noun','noun'],
        word: ['そふ','そぼ','おば','おじ','ちち','はは','あね','あに','いもうと','おとうと','こいびと','おっと','つま'],
        meaning: ['grandfather','grandmother','aunt','uncle','father','mother','older sister','older brother','younger sister','younger brother','lover','groom','bride']),
    TheVocab( kanji: ['一','ニ','三','四','五','六','七','八','九','十','十一','十二','十三','十四','十五','十六','十七','十八','十九','二十','三十','四十','五十','六十','七十','八十','九十','百'],
        type: ['noun','noun','noun','noun','noun','noun','noun','noun','noun','noun','noun','noun','noun','noun','noun','noun','noun','noun','noun','noun','noun','noun','noun','noun','noun','noun','noun','noun'],
        word: ['いち','に','さん','よん','ご','ろく','なな/しち','はち','きゅう/く','じゅう','じゅういち','じゅうに','じゅうさん','じゅうよん','じゅうご','じゅうろく','じゅうしち','じゅうはち','じゅうきゅう','にじゅう','さんじゅう','よんじゅう','ごじゅう','ろくじゅう','ななじゅう','はちじゅう','きゅうじゅう','ひゃく'],
        meaning: ['one','two','three','four','five','six','seven','eight','nine','ten','eleven','twelve','thirteen','fourteen','fifteen','sixteen','seventeen','eighteen','nineteen','twenty','thirty','fourty','fifty','sixty','seventy','eighty','ninety','hundred']),
    TheVocab( kanji: ['月曜日','火曜日','水曜日','木曜日','金曜日','土曜日','日曜日'],
        type: ['noun','noun','noun','noun','noun','noun','noun'],
        word: ['げつようび','かようび','すいようび','もくようび','きんようび','どようび','にちようび'],
        meaning: ['Monday','Tuesday','Wednesday','Thursday','Friday','Saturday','Sunday']),
    TheVocab( kanji: ['日本人', 'アメリカ人', 'イギリス人' , '中国人','韓国人','ベトナム人'],
        type: ['noun','noun','noun','noun','noun','noun',],
        word: ['にほんじん','アメリカじん','イギリスじん','ちゅうごくじん','かんこくじん','ベトナムじん'],
        meaning: ['Japanese','American', 'British', 'Chinese','Korean','Vietnamese']),
    TheVocab( kanji: ['祖父', '祖母', '父' , '母','姉','兄','妹','弟','恋人','夫','妻'],
        type: ['noun','noun','noun','noun','noun','noun','noun','noun','noun','noun','noun'],
        word: ['そふ','そぼ','おば','おじ','ちち','はは','あね','あに','いもうと','おとうと','こいびと','おっと','つま'],
        meaning: ['grandfather','grandmother','aunt','uncle','father','mother','older sister','older brother','younger sister','younger brother','lover','groom','bride']),
    TheVocab( kanji: ['一','ニ','三','四','五','六','七','八','九','十','十一','十二','十三','十四','十五','十六','十七','十八','十九','二十','三十','四十','五十','六十','七十','八十','九十','百'],
        type: ['noun','noun','noun','noun','noun','noun','noun','noun','noun','noun','noun','noun','noun','noun','noun','noun','noun','noun','noun','noun','noun','noun','noun','noun','noun','noun','noun','noun'],
        word: ['いち','に','さん','よん','ご','ろく','なな/しち','はち','きゅう/く','じゅう','じゅういち','じゅうに','じゅうさん','じゅうよん','じゅうご','じゅうろく','じゅうしち','じゅうはち','じゅうきゅう','にじゅう','さんじゅう','よんじゅう','ごじゅう','ろくじゅう','ななじゅう','はちじゅう','きゅうじゅう','ひゃく'],
        meaning: ['one','two','three','four','five','six','seven','eight','nine','ten','eleven','twelve','thirteen','fourteen','fifteen','sixteen','seventeen','eighteen','nineteen','twenty','thirty','fourty','fifty','sixty','seventy','eighty','ninety','hundred']),
    TheVocab( kanji: ['月曜日','火曜日','水曜日','木曜日','金曜日','土曜日','日曜日'],
        type: ['noun','noun','noun','noun','noun','noun','noun'],
        word: ['げつようび','かようび','すいようび','もくようび','きんようび','どようび','にちようび'],
        meaning: ['Monday','Tuesday','Wednesday','Thursday','Friday','Saturday','Sunday']),
    TheVocab( kanji: ['日本人', 'アメリカ人', 'イギリス人' , '中国人','韓国人','ベトナム人'],
        type: ['noun','noun','noun','noun','noun','noun',],
        word: ['にほんじん','アメリカじん','イギリスじん','ちゅうごくじん','かんこくじん','ベトナムじん'],
        meaning: ['Japanese','American', 'British', 'Chinese','Korean','Vietnamese']),
    TheVocab( kanji: ['祖父', '祖母', '父' , '母','姉','兄','妹','弟','恋人','夫','妻'],
        type: ['noun','noun','noun','noun','noun','noun','noun','noun','noun','noun','noun'],
        word: ['そふ','そぼ','おば','おじ','ちち','はは','あね','あに','いもうと','おとうと','こいびと','おっと','つま'],
        meaning: ['grandfather','grandmother','aunt','uncle','father','mother','older sister','older brother','younger sister','younger brother','lover','groom','bride']),
  ];

}
class TheVocab{
  List kanji;
  List type;
  List word;
  List meaning;
  TheVocab({required this.kanji, required this.type,required this.word,required this.meaning,});
}