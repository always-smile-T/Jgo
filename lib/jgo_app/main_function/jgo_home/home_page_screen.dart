import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:jgo_exe/jgo_app/app_theme.dart';
import 'package:jgo_exe/jgo_app/main_function/jgo_home/post/create_new_post.dart';
import 'package:jgo_exe/jgo_app/main_function/jgo_home/post/post_detail_screen.dart';


class HomePageScreen extends StatefulWidget {
  const HomePageScreen({Key? key})
      : super(key: key);

  @override
  _HomePageScreenState createState() => _HomePageScreenState();
}

class _HomePageScreenState extends State<HomePageScreen>
    with TickerProviderStateMixin {
  final ScrollController _scrollController = ScrollController();
  bool _setState = true;
  @override
  void initState() {
    super.initState();
  }


  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: Container(
          color: AppTheme.background,
          child: Stack(
            children: [
              getMainListViewUI(),
              getAppBarUI(),
            ],
          ),
        )
      ),
    );
  }

  Widget getMainListViewUI() {
    return Positioned(
      child: TabBarView(
        children: [
          // first tab bar view widget
          SingleChildScrollView(child:
          ListView.builder(
            itemCount: post.length,
            controller: _scrollController,
            padding: const EdgeInsets.fromLTRB(10, 150, 10, 70),
            reverse: true,
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemBuilder: (context, index){
              return Container(
                  margin: const EdgeInsets.all(5),
                  color: AppTheme.greenPrimary,
                  child: Container(
                    height: 180,
                    margin: const EdgeInsets.all(5),
                    padding: const EdgeInsets.all(5),
                    decoration: BoxDecoration(
                        color: AppTheme.green3,
                      borderRadius: BorderRadius.circular(10),),
                    child:Column(
                          children: [
                              Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(post[index].postTitle, style: const TextStyle(
                                    fontSize: 14, fontWeight: FontWeight.bold
                                ),),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Text(post[index].name),
                                    SizedBox(
                                      width: 30,
                                      height: 30,
                                      child: CircleAvatar(
                                        radius: 45,
                                        backgroundImage:
                                        AssetImage(post[index].avatar),
                                      ),
                                    ),
                                    SizedBox(
                                      height: 30,
                                      width: 30,
                                      child: IconButton(
                                          onPressed: () {//tao popup menu
                                          },
                                          icon: Image.asset("assets/images/more_options.png")),
                                    )
                                  ],
                                ),
                              ],
                            ),
                            const Divider(
                              color: AppTheme.greenPrimary,
                              height: 2,
                              thickness: 1.5,
                              // indent: 5,
                              endIndent: 180,
                            ),
                            const SizedBox(
                              height: 5,
                            ),
                            const Divider(
                              color: AppTheme.greenPrimary,
                              height: 2,
                              thickness: 1.5,
                              indent: 250,
                              // endIndent: 5,
                            ),
                            const SizedBox(
                              height: 5,
                            ),
                            SizedBox(
                              height: 40,
                              child: Text(post[index].postContent, style: const TextStyle(
                                fontSize: 14, color: Colors.black,
                              ),),
                            ),
                             Row(
                               mainAxisAlignment: MainAxisAlignment.start,
                               children: [
                                 TextButton(
                                     onPressed: (){
                                       if(post[index].postId == '9'){
                                         Navigator.of(context).push(MaterialPageRoute(
                                             builder: (context) =>const PostDetailScreen()));
                                       }
                                     },
                                     child: const Text('View more',
                                       style: TextStyle(color: AppTheme.greenPrimary, fontSize: 14),)),
                               ],
                             ),
                            const Divider(
                              color: AppTheme.greenPrimary,
                              height: 2,
                              thickness: 0.5,
                              //indent: 250,
                              // endIndent: 5,
                            ),
                            Row(
                                   mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                   children: [
                                     Row(
                                       children: [
                                         SizedBox(
                                           height: 34,
                                           width: 34,
                                           child: IconButton(
                                             onPressed: () {
                                               setState(() {
                                                 post[index].liked = !post[index].liked;
                                               });
                                             },
                                             icon:  Image.asset(post[index].liked ? "assets/images/star1.png" : "assets/images/star.png"),),
                                         ),
                                         Text(post[index].liked ? (post[index].star).toString() : (post[index].star - 1).toString(), style: const TextStyle(color: AppTheme.greenPrimary),)
                                       ],
                                     ),
                                     Row(
                                       children: [
                                         Image.asset("assets/images/comment.png"),
                                         const SizedBox(
                                           width: 5,
                                         ),
                                         Text(post[index].cmt, style: const TextStyle(color: AppTheme.greenPrimary),)
                                       ],
                                     )
                                   ],
                                 )
                          ],
                        )
                  ),
              );
            },
          ),
          ),
          SingleChildScrollView(child:
          GridView.builder(
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              mainAxisSpacing: 10,
              crossAxisSpacing: 20,
            ),
            itemCount: story.length,
            controller: _scrollController,
            padding: const EdgeInsets.fromLTRB(10, 150, 10, 70),
            //reverse: true,
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemBuilder: (context, index){
              return Container(
                margin: const EdgeInsets.all(5),
                color: AppTheme.greenPrimary,
                child: Container(
                    height: 160,
                    margin: const EdgeInsets.all(5),
                    padding: const EdgeInsets.all(5),
                    decoration: BoxDecoration(
                      color: AppTheme.green3,
                      borderRadius: BorderRadius.circular(10),),
                    child:Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            Text(story[index].name, style: const TextStyle(
                                fontSize: 12
                            ),),
                            const SizedBox(width: 20,),
                            SizedBox(
                              width: 25,
                              height: 25,
                              child: CircleAvatar(
                                radius: 45,
                                backgroundImage:
                                AssetImage(story[index].avatar),
                              ),
                            ),
                          ],
                        ),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Column(
                              children: [
                                Text(story[index].storyTitle, overflow: TextOverflow.ellipsis, style: const TextStyle(
                                    fontSize: 16, color: Colors.black, fontWeight: FontWeight.bold
                                ),),
                                Text(story[index].titleE, overflow: TextOverflow.ellipsis, style: const TextStyle(
                                    fontSize: 12, color: Colors.black
                                ),),
                              ],
                            ),
                            Text(story[index].author, overflow: TextOverflow.ellipsis, style: const TextStyle(
                                fontSize: 14, color: Colors.black, fontWeight: FontWeight.w400
                            ),),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                SizedBox(
                                  height: 30,
                                  child: Image.asset(story[index].unlocked ? 'assets/images/unlocked.png' : 'assets/images/lock.png'),
                                )
                              ],
                            )
                          ],
                        ),
                        const Divider(
                          color: AppTheme.greenPrimary,
                          height: 2,
                          thickness: 0.5,
                          //indent: 250,
                          // endIndent: 5,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Row(
                              children: [
                                SizedBox(
                                  height: 34,
                                  width: 34,
                                  child: IconButton(
                                    onPressed: () {
                                      setState(() {
                                        story[index].liked = !story[index].liked;
                                      });
                                    },
                                    icon:  Image.asset(story[index].liked ? "assets/images/star1.png" : "assets/images/star.png"),),
                                ),
                                Text(story[index].liked ? (story[index].star).toString() : (story[index].star - 1).toString(), style: const TextStyle(color: AppTheme.greenPrimary),)
                              ],
                            ),
                            Row(
                              children: [
                                Image.asset("assets/images/comment.png"),
                                const SizedBox(
                                  width: 5,
                                ),
                                Text(story[index].cmt, style: const TextStyle(color: AppTheme.greenPrimary),)
                              ],
                            )
                          ],
                        )
                      ],
                    )
                ),
              );
            },
          ),
          ), // second tab bar view widget
        ],
      ),
    );
  }

  Widget getAppBarUI() {
    return Container(
                    height: 140,
                    color: AppTheme.background,
                    child: Column(
                      children: [
                        const SizedBox(
                          height: 40,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.end,
                          verticalDirection: VerticalDirection.down,
                          children: [
                            SizedBox(
                              width: 200,
                              child: TabBar(
                                //controller: _controller,
                                onTap: (value) {
                                  if (value == 0) {
                                    setState(() {
                                      _setState = true;
                                    });
                                  } else {
                                    setState(() {
                                      _setState = false;
                                    });
                                  }
                                },
                                unselectedLabelColor: AppTheme.greenPrimary,
                                labelColor: Colors.black,
                                indicator:const UnderlineTabIndicator(borderSide: BorderSide(color: AppTheme.greenPrimary, width: 3)),
                                tabs: [
                                  Container(

                                    padding: EdgeInsets.zero,
                                    margin: const EdgeInsets.only(bottom: 3),
                                    width: 100,
                                    color: AppTheme.green1,
                                      child: const Center(
                                        child: Text("Today", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),),
                                      ),
                                  ),
                                  Container(
                                    padding: EdgeInsets.zero,
                                    margin: const EdgeInsets.only(bottom: 3),
                                    width: 100,
                                    color: AppTheme.green2,
                                      child:const Center(
                                        child: Text("Books", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
                                      ),
                                  ),
                                ],
                              ),
                            ),
                            Row(
                              children: [
                                IconButton(
                                    onPressed: () {},
                                    icon: Image.asset("assets/images/notification.png")),
                                const SizedBox(width: 20,)
                              ],
                            )
                          ],
                        ),
                        const Divider(
                          color: Colors.black54,
                          height: 0,
                          thickness: 1.5,
                         // indent: 5,
                         // endIndent: 5,
                        ),
                        ElevatedButton(
                            child: Column(
                              children: [
                                const SizedBox(height: 5,),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                   const SizedBox(
                                      height: 27,
                                      width: 27,
                                      child: CircleAvatar(
                                        radius: 35,
                                        backgroundImage:
                                        AssetImage("assets/images/shizuka.png"),
                                      ),
                                    ),
                                    const SizedBox(
                                      width: 10,
                                    ),
                                    Text(_setState ? "Do you have any post to share?" : "Search story", style: const TextStyle(fontWeight: FontWeight.bold,
                                        fontSize: 12, color: AppTheme.greenPrimary))
                                  ],
                                ),
                               const SizedBox(height: 5,)
                              ],
                            ),
                            onPressed: (){
                              if(_setState == true) {
                                Navigator.of(context).push(MaterialPageRoute(
                                    builder: (context) =>const CreatePostScreen()));
                              }
                            },
                            style: ButtonStyle(
                              shape: MaterialStateProperty.all<
                                  RoundedRectangleBorder>(
                                  const RoundedRectangleBorder(
                                      side: BorderSide.none)),
                                backgroundColor: MaterialStateProperty.all<Color>(
                                    AppTheme.background),
                                foregroundColor:
                                MaterialStateProperty.all<Color>(AppTheme.background),)
                        ),
                      ],
                    )
                  );
  }
  List<ThePost> post = [ // list message demo
    ThePost(postId: '1',postContent: "日本では国民的な知名度があり、登場キャラクタ...", postTitle: 'ドラえもん',avatar: 'assets/images/anna.png',name: 'Anna',star: 397,cmt: '41', liked: true),
    ThePost(postId: '2',postContent: "向けSF漫画。1969年から小学館の雑誌で連載された。日本では国...", postTitle: 'ネコ（猫）',avatar: 'assets/images/yamada.png',name: 'Yamada',star: 72,cmt: '18',liked: false),
    ThePost(postId: '3',postContent: "「おかずは、気持ちがあれば何でもかまいません。」 しんこ ...", postTitle: '戯け話',avatar: 'assets/images/robin.png',name: 'Robin',star: 1002,cmt: '332',liked: true),
    ThePost(postId: '4',postContent: "私は恐れていました。 するとすぐに別の子供が「私も」と言いました。···", postTitle: '短い足',avatar: 'assets/images/shizuka.png',name: 'Minamoto Shizuka',star: 21,cmt: '10',liked: false),
    ThePost(postId: '5',postContent: "中学生の運動会の話。4人でも200メートルや80メートル走ろう ...", postTitle: '短い足',avatar: 'assets/images/anna.png',name: 'Anna',star: 133,cmt: '13',liked: false),
    ThePost(postId: '6',postContent: "夫は妻に、私たちが新婚の朝に寝坊したので、お弁当を急いで作っ ...", postTitle: '戯け話',avatar: 'assets/images/yamada.png',name: 'Yamada',star: 55,cmt: '12',liked: true),
    ThePost(postId: '7',postContent: "ブレインストーミング（英: brainstorming）あるいはブレイ ...", postTitle: 'ブレインストーミング',avatar: 'assets/images/robin.png',name: 'Robin',star: 887,cmt: '54',liked: true),
    ThePost(postId: '8',postContent: "ネコ（猫）は、狭義には食肉目ネコ科ネコ属に分類されるリビアヤ ...", postTitle: 'ネコ（猫）',avatar: 'assets/images/shizuka.png',name: 'Minamoto Shizuka',star: 121,cmt: '23',liked: false),
    ThePost(postId: '9',postContent: "『ドラえもん』は、藤子・F・不二雄による日本の児童向けSF漫画。...", postTitle: 'ドラえもん',avatar: 'assets/images/anna.png',name: 'Anna',star: 434,cmt: '46',liked: true),
  ];
  List<TheStory> story = [ // list message demo
    TheStory(storyId: '1',author: 'Tetsuko Kuroyanagi',storyTitle: "窓ぎわのトットちゃん", titleE: '(Totto-Chan: The little girl at the window)',avatar: 'assets/images/yamada.png',name: 'Yamada',star: 456,cmt: '198', liked: true, unlocked: true),
    TheStory(storyId: '2',author: 'Kobo Abe',storyTitle: "砂の女", titleE: '(The Woman In The Dunes)',avatar: 'assets/images/shizuka.png',name: 'Minamoto Shizuka',star: 397,cmt: '52', liked: true, unlocked: true),
    TheStory(storyId: '3',author: 'Tetsuko Kuroyanagi',storyTitle: "窓ぎわのトットちゃん", titleE: '(Totto-Chan: The little girl at the window)',avatar: 'assets/images/anna.png',name: 'Anna',star: 5211,cmt: '912', liked: true, unlocked: true),
    TheStory(storyId: '4',author: 'Haruki Murakami',storyTitle: "スプートニック", titleE: '(The Sputnik Sweetheart)',avatar: 'assets/images/shizuka.png',name: 'Minamoto Shizuka',star: 1008,cmt: '112', liked: false, unlocked: false),
    TheStory(storyId: '5',author: 'Haruki Murakami',storyTitle: "1Q84", titleE: '1Q84',avatar: 'assets/images/anna.png',name: 'Anna',star: 456,cmt: '198', liked: true, unlocked: true),
    TheStory(storyId: '6',author: 'Kobo Abe',storyTitle: "砂の女", titleE: '(The Woman In The Dunes)',avatar: 'assets/images/shizuka.png',name: 'Minamoto Shizuka',star: 397,cmt: '52', liked: false, unlocked: false),
    TheStory(storyId: '7',author: 'Tetsuko Kuroyanagi',storyTitle: "窓ぎわのトットちゃん", titleE: '(Totto-Chan: The little girl at the window)',avatar: 'assets/images/anna.png',name: 'Anna',star: 5211,cmt: '912', liked: true, unlocked: true),
    TheStory(storyId: '8',author: 'Haruki Murakami',storyTitle: "スプートニック", titleE: '(The Sputnik Sweetheart)',avatar: 'assets/images/shizuka.png',name: 'Minamoto Shizuka',star: 1008,cmt: '112', liked: false, unlocked: false),
    TheStory(storyId: '9',author: 'Haruki Murakami',storyTitle: "ノルウェーの森", titleE: '(Norwegian Wood)',avatar: 'assets/images/robin.png',name: 'Robin',star: 526,cmt: '87', liked: true, unlocked: false),
    TheStory(storyId: '10',author: 'Haruki Murakami',storyTitle: "1Q84", titleE: '1Q84',avatar: 'assets/images/yamada.png',name: 'Yamada',star: 321,cmt: '40', liked: false, unlocked: false),];
}
class ThePost{ //component dor chat message demo
  String postId;
  String postContent;
  String postTitle;
  String avatar;
  String name;
  int star;
  String cmt;
  bool liked;
  ThePost({required this.postId,required this.postContent, required this.postTitle,required this.avatar,required this.name,required this.star,required this.cmt,required this.liked});
}
class TheStory{ //component dor chat message demo
  String storyId;
  String titleE;
  String storyTitle;
  String avatar;
  String name;
  int star;
  String cmt;
  bool liked;
  bool unlocked;
  String author;
  TheStory({required this.storyId,required this.titleE, required this.storyTitle,required this.avatar,required this.name,required this.star,required this.cmt,required this.liked,required this.unlocked,required this.author});
}