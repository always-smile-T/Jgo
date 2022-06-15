import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:jgo_exe/jgo_app/jgo_home.dart';
import 'dart:collection';
import '../../../app_theme.dart';

class PostDetailScreen extends StatefulWidget {
  const PostDetailScreen({Key? key}) : super(key: key);

  @override
  State<PostDetailScreen> createState() => _PostDetailScreenState();
}

class _PostDetailScreenState extends State<PostDetailScreen> {
  final ScrollController _scrollController = ScrollController();
  final List<Widget> _post = <Widget>[];
  List<Widget> listViews = <Widget>[];
  int trans = 0;
  final List<Widget> _messages = <Widget>[];
  late TextEditingController _messageController = TextEditingController();
  int count = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:Padding(
            padding:const EdgeInsets.only(top: 30),
            child: SingleChildScrollView(
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          SizedBox(
                            height: 40,
                            child: IconButton(
                                onPressed: () {
                                  Navigator.of(context).pop();
                                },
                                icon: Image.asset("assets/images/back.png")),
                          ),
                          const SizedBox(
                            width: 40,
                            height: 40,
                            child: CircleAvatar(
                              radius: 45,
                              backgroundImage:
                              AssetImage("assets/images/anna.png"),
                            ),
                          ),
                          const SizedBox(
                            width: 5,
                          ),
                          Column(
                            children:const [
                              Text('Anna', style: TextStyle(fontSize: 16),),
                              Text('2 hours', style: TextStyle(color: Colors.black54, fontSize: 12),)
                            ],
                          )
                        ],
                      ),
                      Container(
                        margin: const EdgeInsets.only(right: 10),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.end,
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            IconButton(
                                onPressed: () {},
                                icon: Image.asset("assets/images/more_options.png")),
                            const Text('ドラえもん', style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),)
                          ],
                        ),
                      )
                    ],
                  ),
                  const Divider(
                    color: Colors.black54,
                    height: 2,
                    thickness: 0.5,
                    indent: 250,
                    // endIndent: 5,
                  ),
                  ListView.builder(
                      itemCount: post.length + _post.length,
                      controller: _scrollController,
                      padding: const EdgeInsets.fromLTRB(0, 20, 0, 10),
                      reverse: true,
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      itemBuilder: (context, index){
                        return Column(
                          children: [
                            Padding(padding:const EdgeInsets.only(left: 10, right: 10),
                              child: Text(post[index].J, style: const TextStyle(
                                fontSize: 14, color: Colors.black,
                              ),),),
                            Padding(padding:const EdgeInsets.only(left: 10, right: 10),
                              child: Text(trans == 1 ? post[index].E : trans == 2 ? post[index].V : '', style: const TextStyle(
                                fontSize: 14, color: Colors.black,
                              ),),),
                            const Divider(
                              color: Colors.black54,
                              height: 2,
                              thickness: 0.5,
                              //indent: 250,
                              // endIndent: 5,
                            ),
                            Row(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Row(
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
                                    const SizedBox(
                                      width: 20,
                                    ),
                                    Row(
                                      children: [
                                        Image.asset("assets/images/comment.png"),
                                        const SizedBox(
                                          width: 5,
                                        ),
                                        Text((post[index].cmt + count).toString(), style: const TextStyle(color: AppTheme.greenPrimary),)
                                      ],
                                    ),
                                  ],
                                ),
                                Row(
                                  children: [
                                    ElevatedButton(
                                      child: const Text('J - E',style: TextStyle(
                                          color: AppTheme.greenPrimary, fontSize: 12
                                      )
                                      ),
                                      onPressed: (){
                                        setState(() {
                                          trans = 1;
                                        });
                                      },
                                      style: ButtonStyle(
                                        shape: MaterialStateProperty.all<
                                            RoundedRectangleBorder>(
                                            const RoundedRectangleBorder(
                                                side: BorderSide(color: AppTheme.greenPrimary))),
                                        backgroundColor: MaterialStateProperty.all<Color>(trans == 1 ? AppTheme.green1 : AppTheme.background),),
                                    ),
                                    const SizedBox(
                                      width: 10,
                                    ),
                                    ElevatedButton(
                                      child: const Text('J - V',style: TextStyle(
                                          color: AppTheme.greenPrimary, fontSize: 12
                                      )
                                      ),
                                      onPressed: (){
                                        setState(() {
                                          trans = 2;
                                        });
                                      },
                                      style: ButtonStyle(
                                        shape: MaterialStateProperty.all<
                                            RoundedRectangleBorder>(
                                            const RoundedRectangleBorder(
                                                side: BorderSide(color: AppTheme.greenPrimary))),
                                        backgroundColor: MaterialStateProperty.all<Color>(trans == 2 ? AppTheme.green1 : AppTheme.background),),
                                    ),
                                    const SizedBox(
                                      width: 20,
                                    ),
                                  ],
                                )
                              ],
                            ),
                            const Divider(
                              color: Colors.black54,
                              height: 2,
                              thickness: 0.5,
                              //indent: 250,
                              // endIndent: 5,
                            ),
                          ],
                        );
                      }),
                  ListView.builder( //de hien thi tin nhan trong kho luu tru
                    itemCount: cmt.length,
                    controller: _scrollController,
                    padding: const EdgeInsets.only(top: 10),
                    reverse: true,
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    //children:  UnmodifiableListView(_messages),
                    itemBuilder: (context, index){
                      return Container(
                            padding: const EdgeInsets.only(
                                left: 14, right: 14, top: 10, bottom: 10),
                            child: Align(
                                alignment: Alignment.topLeft,
                                child: Row(
                                  children: [
                                    SizedBox(
                                      width: 34,
                                      height: 34,
                                      child: CircleAvatar(
                                        radius: 45,
                                        backgroundImage:
                                        AssetImage(cmt[index].avatar),
                                      ),
                                    ),
                                    const SizedBox(
                                      width: 20,),
                                    Container(
                                        decoration: const BoxDecoration(
                                          borderRadius: BorderRadius.all(Radius.circular(15),),
                                          color: AppTheme.green3,
                                        ),
                                        padding: const EdgeInsets.all(16),
                                        child: Column(
                                          crossAxisAlignment: CrossAxisAlignment.start,
                                          children: [
                                            Text(cmt[index].name, style: const TextStyle(fontWeight: FontWeight.bold),),
                                            Text(cmt[index].content, overflow: TextOverflow.ellipsis,
                                            )
                                          ],
                                        )),
                                  ],
                                )
                            ),
                          );
                    },
                  ),
                  ListView(
                      controller: _scrollController,
                      reverse: true,
                      shrinkWrap: true,
                      children: UnmodifiableListView(_messages),
                    ),
                  Container(
                    padding: const EdgeInsets.only(left: 10, bottom: 10),
                    height: 60,
                    width: double.infinity,
                    child: Row(
                      children: <Widget>[
                        Expanded(
                            child: Container(
                              padding: const EdgeInsets.fromLTRB(10, 0, 10, 0),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(15),
                                border: Border.all(
                                  width: 1,
                                  color: Colors.grey,
                                ),
                                color: AppTheme.grey1,
                              ),
                              child: TextField(
                                textAlignVertical: TextAlignVertical.center,
                                cursorColor: Colors.black38,
                                controller: _messageController,
                                decoration: const InputDecoration(
                                    hintText: "Write a comment",
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
                                        alignment: Alignment.topLeft,
                                        child: Row(
                                          children: [
                                            const SizedBox(
                                              width: 34,
                                              height: 34,
                                              child: CircleAvatar(
                                                radius: 45,
                                                backgroundImage:
                                                AssetImage("assets/images/shizuka.png"),
                                              ),
                                            ),
                                          const SizedBox(
                                            width: 20,),
                                            Container(
                                                decoration: const BoxDecoration(
                                                  borderRadius: BorderRadius.all(Radius.circular(15),),
                                                  color: AppTheme.green3,
                                                ),
                                                padding: const EdgeInsets.all(16),
                                                child: Column(
                                                  crossAxisAlignment: CrossAxisAlignment.start,
                                                  children: [
                                                    const Text('Minamoto Shizuka', style: TextStyle(fontWeight: FontWeight.bold),),
                                                    Text(
                                                      _messageController.text,overflow: TextOverflow.ellipsis,
                                                    )
                                                  ],
                                                )),
                                          ],
                                        )
                                      ),
                                    ));
                                _messageController = TextEditingController(text: '');
                                count = count + 1;
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
                ],
              ),

            ),
          ),
    );
  }
  List<PostDetail> post = [ // list message demo
    PostDetail(postId: '9', postTitle: 'ドラえもん',avatar: 'assets/images/anna.png',name: 'Anna',star: 434,cmt: 46,liked: true,
        J: "『ドラえもん』は、藤子・F・不二雄[注 1]による日本の児童向けSF漫画。1969年から小学館の雑誌で連載された。日本では国民的な知名度があり、登場キャラクターや登場アイテム（ひみつ道具）など、その世界観が一般社会に広く浸透している。海外でも、東アジア、東南アジアを中心に高い人気を誇る[1]。自他ともに認める藤子Fの代表作であるが、作者は本作にかかりっきりになり、『エスパー魔美』の連載が不可能になるなどの弊害も生じた。\n 22世紀の未来からやってきたネコ型ロボット・ドラえもんと、勉強もスポーツも苦手な小学生・野比のび太が繰り広げる日常生活を描いた作品である。基本的には一話完結型の連載漫画（後述する「大長編」など例外あり）である。\n 作中の登場人物はドラえもんの存在を不思議がらず、作風は基本的には藤子Fが得意とする「生活ギャグ」、エブリデイ・マジックに属する話が多い。藤子F自身はSF作品で描いた独自定義「すこし・不思議」（Sukoshi Fushigi）[注 3]と本作を説明しており、前作の「ウメ星デンカ」のストーリー構図をほぼそのまま踏襲しており実質的な後継作品ともいえる。",
        E: "Doraemon (Japanese: ドラえもん [doɾaemoɴ]) is a Japanese manga series written and illustrated by Fujiko F. Fujio. The manga was first serialized in December 1969, with its 1,345 individual chapters compiled into 45 tankōbon volumes and published by Shogakukan from 1970 to 1996. The story revolves around an earless robotic cat named Doraemon, who travels back in time from the 22nd century to aid a boy named Nobita Nobi.\n The manga spawned a media franchise. Three anime TV series have been adapted in 1973, 1979, and 2005. Additionally, Shin-Ei Animation has produced over forty animated films, including two 3D computer animated films, all of which are distributed by Toho. Various types of merchandise and media have been developed, including soundtrack albums, video games, and musicals. The manga series was licensed for an English language release in North America, via Amazon Kindle, by a collaboration of Fujiko F. Fujio Pro with Voyager Japan and AltJapan Co., Ltd. The anime series was licensed by Disney for an English-language release in North America in 2014, and LUK International in Europe, the Middle East and Africa.",
        V: "Doraemon là một series manga của Nhật Bản do Fujiko F. Fujio sáng tác từ tháng 12 năm 1969 đến tháng 4 năm 1996 đăng trên tạp chí CoroCoro Comic của nhà xuất bản Shogakukan. Có tổng cộng 821 chương truyện được tuyển chọn đóng gói đưa vào 45 tập tankōbon dưới ấn hiệu Tentōmushi Comics cũng do Shogakukan xuất bản; manga đã được dịch và xuất bản bằng nhiều ngôn ngữ trên thế giới.\n Nội dung series kể về cuộc đời bất hạnh của cậu bé Nobita và chú mèo máy Doraemon từ tương lai đến để giúp cuộc sống của cậu bé trở nên tốt hơn. Tác phẩm ba lần được chuyển thể thành anime: lần đầu do Nippon TV Dōga sản xuất gồm 52 tập phát sóng trên Nippon TV từ 1 tháng 4 đến 30 tháng 9 năm 1973; lần thứ hai do Shin-Ei Animation sản xuất với 1787 tập phát từ 2 tháng 4 năm 1979 đến 18 tháng 3 năm 2005 trên TV Asahi và lần thứ ba cũng do Shin-Ei Animation sản xuất phát trên TV Asahi từ 15 tháng 4 năm 2005 đến nay. Tác phẩm cũng được chuyển thể thành các loại hình truyền thông khác như phim điện ảnh và trò chơi điện tử."),
  ];
  List<TheComment> cmt = [ // list message demo
    TheComment(avatar: 'assets/images/yamada.png', name: 'Yamada', content: '素晴らしい記事', canDelete: false),
    TheComment(avatar: 'assets/images/robin.png', name: 'Robin', content: 'Nice', canDelete: false),
    TheComment(avatar: 'assets/images/anna.png', name: 'Anna', content: 'Thank everyone', canDelete: false),
    TheComment(avatar: 'assets/images/shizuka.png', name: 'Minamoto Shizuka', content: 'あなたの執筆に感謝します', canDelete: true),
    TheComment(avatar: 'assets/images/yamada.png', name: 'Yamada', content: 'this is my childhood. I feel very comfortable.', canDelete: false),
    TheComment(avatar: 'assets/images/robin.png', name: 'Robin', content: 'twice', canDelete: false),
  ];
}
class PostDetail{ //component dor chat message demo
  String postId;
  String postTitle;
  String avatar;
  String name;
  int star;
  int cmt;
  bool liked;
  String V;
  String J;
  String E;
  PostDetail({required this.postId, required this.postTitle,required this.avatar,required this.name,required this.star,required this.cmt,required this.liked,required this.V,required this.J,required this.E});
}
class TheComment{ //component dor chat message demo
  String avatar;
  String name;
  String content;
  bool canDelete;
  TheComment({required this.avatar, required this.name,required this.content,required this.canDelete});
}