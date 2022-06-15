import 'package:flutter/material.dart';

import '../../../app_theme.dart';

class GrammarPage extends StatefulWidget {
  const GrammarPage({Key? key, this.id}) : super(key: key);
  final id;
  @override
  _GrammarPageState createState() => _GrammarPageState(id);
}

class _GrammarPageState extends State<GrammarPage>
    with TickerProviderStateMixin {
  final id;
  int n = 0;
  final ScrollController _scrollController = ScrollController();
  _GrammarPageState(this.id);

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
              const Text(
                'Grammar',
                style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                    overflow: TextOverflow.clip),
              ),
              const SizedBox(
                width: 10,
              ),
            ],
          ),
          const Divider(
            color: AppTheme.greenPrimary,
            height: 2,
            thickness: 0.5,
            indent: 20,
            endIndent: 20,
          ),
          const Divider(
            color: AppTheme.green1,
            height: 2,
            thickness: 0.5,
            indent: 20,
            endIndent: 20,
          ),
          const Divider(
            color: AppTheme.green2,
            height: 2,
            thickness: 0.5,
            indent: 20,
            endIndent: 20,
          ),
          const Divider(
            color: Colors.white,
            height: 2,
            thickness: 0.5,
            indent: 20,
            endIndent: 20,
          ),
          const SizedBox(height: 30.0),
          ListView.builder(
            scrollDirection: Axis.vertical,
            itemCount: 1,
            controller: _scrollController,
            padding: const EdgeInsets.all(10),
            //reverse: true,
            shrinkWrap: true,
            itemBuilder: (context, index) {
              return Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'name: ',
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        decoration: TextDecoration.underline,
                        fontSize: 16),
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                  Text(
                    grammar[n].name,
                    style: const TextStyle(fontWeight: FontWeight.w600),
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                  const Text(
                    'description: ',
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        decoration: TextDecoration.underline,
                        fontSize: 16),
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                  Text(
                    grammar[n].description,
                    style: const TextStyle(fontWeight: FontWeight.w600),
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                  const Text(
                    'example: ',
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        decoration: TextDecoration.underline,
                        fontSize: 16),
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                  Text(
                    grammar[n].example,
                    style: const TextStyle(fontWeight: FontWeight.w600),
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                  const Text(
                    'note: ',
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        decoration: TextDecoration.underline,
                        fontSize: 16),
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                  Text(
                    grammar[n].note,
                    style: const TextStyle(fontWeight: FontWeight.w600),
                  ),
                  const SizedBox(
                    height: 5,
                  )
                ],
              );
            },
            //children:  UnmodifiableListView(_messages),
          ),
          const SizedBox(
            height: 20,
          )
        ]),
      ),
    );
  }

  List<TheGramar> grammar = [
    TheGramar(
        name: '~は~です。\n',
        description: '- N1 は(wa) N2 です(desu)\n- English: N1 is N2\n'
            '- N1 and N2 stand for two different nouns The character は (ha/wa) here is a particle, a word that has only grammatical function but no meaning. It indicates that the noun it follows is the topic of the sentence.'
            'When the character は functions as the topic-marking particle, it is pronounced "wa" instead of "ha" です (desu) can be interpreted as the verb "to be".\n',
        example: 'Watashi wa nihonjin desu.\n'
            '-> 私は日本人です。\n'
            '-> I am Japanese.\n',
        note:
            'です(desu) is are polite form of the verb to be. The polite form is the default on more formal occasions and between people of different stature, such as a teacher and a student, and also between strangers.’'),
    TheGramar(
        name: '~は~ではありません',
        description:
            'N1 は(Wa)　N2 ではありません(dewa arimasen)。\nEnglish: N1 is not N2\n'
            'ではありません(dewa arimasen) is the negative form of です (desu).'
            'は in ではありません(dewa arimasen) should also be pronounced "wa", not "ha"',
        example: 'watashi wa nihonjin dewa arimasen. \n'
            '私は日本人ではありません。\n'
            'I am not Japanese.',
        note:
            'ではありません(dewa arimasen) is polite form of the verb to be. The polite form is the default on more formal occasions and between people of different stature, such as a teacher and a student, and also between strangers.'),
    TheGramar(
        name: '~できる。',
        description:
            'Vる + こと/ N + ができる\nDictionary form nouns ことができる. or noun + ができる\n'
            'Meaning: be able to do something. Expresses the possibility or ability to do something (belonging to the person’s ability).',
        example: 'ばしょがどこかわかりますから、ひとりで　いくことができます。\n'
            '場所がどこか分かりますから、一人で行くことができます。\n'
            'Bởi vì tôi biết địa điểm đó ở đâu nên có thể đi một mình được',
        note: '...nothing'),
    TheGramar(
        name: '~ができらい/　できません',
        description:
            'Vる + こと/ N + ができらい/　できません\nMeaning: not be able to do something\n',
        example: '頭が悪いです。英語の勉強ができません。\n'
            'atama ga warui desu. eigo no benkyou ga dekimasen\n'
            'Tôi không thông minh. Tôi không thể học được tiếng Anh.',
        note: '...nothing'),
    TheGramar(
        name: '~は~です。\n',
        description: '- N1 は(wa) N2 です(desu)\n- English: N1 is N2\n'
            '- N1 and N2 stand for two different nouns The character は (ha/wa) here is a particle, a word that has only grammatical function but no meaning. It indicates that the noun it follows is the topic of the sentence.'
            'When the character は functions as the topic-marking particle, it is pronounced "wa" instead of "ha" です (desu) can be interpreted as the verb "to be".\n',
        example: 'Watashi wa nihonjin desu.\n'
            '-> 私は日本人です。\n'
            '-> I am Japanese.\n',
        note:
            'です(desu) is are polite form of the verb to be. The polite form is the default on more formal occasions and between people of different stature, such as a teacher and a student, and also between strangers.’'),
    TheGramar(
        name: '~は~ではありません',
        description:
            'N1 は(Wa)　N2 ではありません(dewa arimasen)。\nEnglish: N1 is not N2\n'
            'ではありません(dewa arimasen) is the negative form of です (desu).'
            'は in ではありません(dewa arimasen) should also be pronounced "wa", not "ha"',
        example: 'watashi wa nihonjin dewa arimasen. \n'
            '私は日本人ではありません。\n'
            'I am not Japanese.',
        note:
            'ではありません(dewa arimasen) is polite form of the verb to be. The polite form is the default on more formal occasions and between people of different stature, such as a teacher and a student, and also between strangers.'),
    TheGramar(
        name: '~できる。',
        description:
            'Vる + こと/ N + ができる\nDictionary form nouns ことができる. or noun + ができる\n'
            'Meaning: be able to do something. Expresses the possibility or ability to do something (belonging to the person’s ability).',
        example: 'ばしょがどこかわかりますから、ひとりで　いくことができます。\n'
            '場所がどこか分かりますから、一人で行くことができます。\n'
            'Bởi vì tôi biết địa điểm đó ở đâu nên có thể đi một mình được',
        note: '...nothing'),
    TheGramar(
        name: '~ができらい/　できません',
        description:
            'Vる + こと/ N + ができらい/　できません\nMeaning: not be able to do something\n',
        example: '頭が悪いです。英語の勉強ができません。\n'
            'atama ga warui desu. eigo no benkyou ga dekimasen\n'
            'Tôi không thông minh. Tôi không thể học được tiếng Anh.',
        note: '...nothing'),
    TheGramar(
        name: '~は~です。\n',
        description: '- N1 は(wa) N2 です(desu)\n- English: N1 is N2\n'
            '- N1 and N2 stand for two different nouns The character は (ha/wa) here is a particle, a word that has only grammatical function but no meaning. It indicates that the noun it follows is the topic of the sentence.'
            'When the character は functions as the topic-marking particle, it is pronounced "wa" instead of "ha" です (desu) can be interpreted as the verb "to be".\n',
        example: 'Watashi wa nihonjin desu.\n'
            '-> 私は日本人です。\n'
            '-> I am Japanese.\n',
        note:
            'です(desu) is are polite form of the verb to be. The polite form is the default on more formal occasions and between people of different stature, such as a teacher and a student, and also between strangers.’'),
    TheGramar(
        name: '~は~ではありません',
        description:
            'N1 は(Wa)　N2 ではありません(dewa arimasen)。\nEnglish: N1 is not N2\n'
            'ではありません(dewa arimasen) is the negative form of です (desu).'
            'は in ではありません(dewa arimasen) should also be pronounced "wa", not "ha"',
        example: 'watashi wa nihonjin dewa arimasen. \n'
            '私は日本人ではありません。\n'
            'I am not Japanese.',
        note:
            'ではありません(dewa arimasen) is polite form of the verb to be. The polite form is the default on more formal occasions and between people of different stature, such as a teacher and a student, and also between strangers.'),
  ];
}

class TheGramar {
  String name;
  String description;
  String example;
  String note;
  TheGramar({
    required this.name,
    required this.description,
    required this.example,
    required this.note,
  });
}
