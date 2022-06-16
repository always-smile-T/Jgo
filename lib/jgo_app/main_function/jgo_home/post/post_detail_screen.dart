import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'dart:collection';
import '../../../app_theme.dart';

class PostDetailScreen extends StatefulWidget {
  const PostDetailScreen({Key? key, this.id, this.postTitle, this.image, this.name, this.numStar, this.numCmt, this.liked}) : super(key: key);
  final id, postTitle, image, name,  numStar, numCmt , liked;
  @override
  State<PostDetailScreen> createState() => _PostDetailScreenState(id, postTitle, image, name,  numStar, numCmt , liked);
}

class _PostDetailScreenState extends State<PostDetailScreen> {
  final id, postTitle, image, name;
  int n = 0;
  late int numStar, numCmt;
  late bool liked;
  _PostDetailScreenState(this.id, this.postTitle, this.image, this.name, this.numStar, this.numCmt, this.liked);
  final ScrollController _scrollController = ScrollController();
  final List<Widget> _post = <Widget>[];
  List<Widget> listViews = <Widget>[];
  int trans = 0;
  final List<Widget> _messages = <Widget>[];
  late TextEditingController _messageController = TextEditingController();
  int count = 0;

  @override
  Widget build(BuildContext context) {
    n = id;
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
                          SizedBox(
                            width: 40,
                            height: 40,
                            child: CircleAvatar(
                              radius: 45,
                              backgroundImage:
                              AssetImage(image),
                            ),
                          ),
                          const SizedBox(
                            width: 5,
                          ),
                          Column(
                            children: [
                              Text(name, style: TextStyle(fontSize: 16),),//fix1
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
                                Text(postTitle, style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),)
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
                      itemCount: 1,
                      controller: _scrollController,
                      padding: const EdgeInsets.fromLTRB(0, 20, 0, 10),
                      reverse: true,
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      itemBuilder: (context, index){
                        return Column(
                          children: [
                            Padding(padding:const EdgeInsets.only(left: 10, right: 10),
                              child: Text(post[n].J, style: const TextStyle(
                                fontSize: 14, color: Colors.black,
                              ),),),
                            Padding(padding:const EdgeInsets.only(left: 10, right: 10),
                              child: Text(trans == 1 ? post[n].E : trans == 2 ? post[n].V : '', style: const TextStyle(
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
                                                liked = !liked;
                                              });
                                            },
                                            icon:  Image.asset(liked ? "assets/images/star1.png" : "assets/images/star.png"),),
                                        ),
                                        Text(liked ? numStar.toString() : (numStar - 1).toString(), style: const TextStyle(color: AppTheme.greenPrimary),)
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
                                        Text((numCmt + count).toString(), style: const TextStyle(color: AppTheme.greenPrimary),)
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
    PostDetail(
        J: "『ドラえもん』は、藤子・F・不二雄[注 1]による日本の児童向けSF漫画。1969年から小学館の雑誌で連載された。"
            "日本では国民的な知名度があり、登場キャラクターや登場アイテム（ひみつ道具）など、その世界観が一般社会に広く浸透している。"
            "海外でも、東アジア、東南アジアを中心に高い人気を誇る[1]。自他ともに認める藤子Fの代表作であるが、作者は本作にかかりっきりになり、"
            "『エスパー魔美』の連載が不可能になるなどの弊害も生じた。\n 22世紀の未来からやってきたネコ型ロボット・ドラえもんと、勉強もスポーツ"
            "も苦手な小学生・野比のび太が繰り広げる日常生活を描いた作品である。基本的には一話完結型の連載漫画（後述する「大長編」など例外あり）で"
            "ある。\n 作中の登場人物はドラえもんの存在を不思議がらず、作風は基本的には藤子Fが得意とする「生活ギャグ」、エブリデイ・マジックに属す"
            "る話が多い。藤子F自身はSF作品で描いた独自定義「すこし・不思議」（Sukoshi Fushigi）[注 3]と本作を説明しており、前作の「ウメ星デンカ」"
            "のストーリー構図をほぼそのまま踏襲しており実質的な後継作品ともいえる。",
        E: "Doraemon (Japanese: ドラえもん [doɾaemoɴ]) is a Japanese manga series written and illustrated by Fujiko F. Fujio. The "
            "manga was first serialized in December 1969, with its 1,345 individual chapters compiled into 45 tankōbon volumes and "
            "published by Shogakukan from 1970 to 1996. The story revolves around an earless robotic cat named Doraemon, who travels "
            "back in time from the 22nd century to aid a boy named Nobita Nobi.\n The manga spawned a media franchise. Three anime TV "
            "series have been adapted in 1973, 1979, and 2005. Additionally, Shin-Ei Animation has produced over forty animated films, "
            "including two 3D computer animated films, all of which are distributed by Toho. Various types of merchandise and media have "
            "been developed, including soundtrack albums, video games, and musicals. The manga series was licensed for an English language "
            "release in North America, via Amazon Kindle, by a collaboration of Fujiko F. Fujio Pro with Voyager Japan and AltJapan Co., Ltd. "
            "The anime series was licensed by Disney for an English-language release in North America in 2014, and LUK International in Europe, "
            "the Middle East and Africa.",
        V: "Doraemon là một series manga của Nhật Bản do Fujiko F. Fujio sáng tác từ tháng 12 năm 1969 đến tháng 4 năm 1996 đăng trên tạp chí "
            "CoroCoro Comic của nhà xuất bản Shogakukan. Có tổng cộng 821 chương truyện được tuyển chọn đóng gói đưa vào 45 tập tankōbon dưới ấn "
            "hiệu Tentōmushi Comics cũng do Shogakukan xuất bản; manga đã được dịch và xuất bản bằng nhiều ngôn ngữ trên thế giới.\n Nội dung "
            "series kể về cuộc đời bất hạnh của cậu bé Nobita và chú mèo máy Doraemon từ tương lai đến để giúp cuộc sống của cậu bé trở nên "
            "tốt hơn. Tác phẩm ba lần được chuyển thể thành anime: lần đầu do Nippon TV Dōga sản xuất gồm 52 tập phát sóng trên Nippon TV từ 1 "
            "tháng 4 đến 30 tháng 9 năm 1973; lần thứ hai do Shin-Ei Animation sản xuất với 1787 tập phát từ 2 tháng 4 năm 1979 đến 18 tháng 3 "
            "năm 2005 trên TV Asahi và lần thứ ba cũng do Shin-Ei Animation sản xuất phát trên TV Asahi từ 15 tháng 4 năm 2005 đến nay. Tác phẩm"
            " cũng được chuyển thể thành các loại hình truyền thông khác như phim điện ảnh và trò chơi điện tử."
    ),
    PostDetail(
        V: 'Mèo (chính xác hơn là loài mèo nhà để phân biệt với các loài trong họ Mèo khác) là động vật có vú, nhỏ nhắn và chuyên ăn thịt, sống '
            'chung với loài người, được nuôi để săn vật gây hại hoặc làm thú nuôi cùng với chó nhà. Mèo nhà đã sống gần gũi với loài người ít nhất '
            '9.500 năm, và hiện nay chúng là con vật cưng phổ biến nhất trên thế giới.\nCó rất nhiều các giống mèo khác nhau, một số không có '
            'lông hoặc không có đuôi, và chúng có nhiều màu lông khác nhau. Mèo là những con vật có kỹ năng của thú săn mồi và được biết đến với '
            'khả năng săn bắt hàng nghìn loại sinh vật để làm thức ăn, ví dụ như chuột. Chúng đồng thời là những sinh vật thông minh, và có thể '
            'được dạy hay tự học cách sử dụng các công cụ đơn giản như mở tay nắm cửa hay giật nước trong nhà vệ sinh.\nMèo giao tiếp bằng cách '
            'kêu meo meo, gừ-gừ, rít, gầm gừ và ngôn ngữ cơ thể. Mèo trong các bầy đàn sử dụng cả âm thanh lẫn ngôn ngữ cơ thể để giao tiếp với nhau.',
        J: 'ネコ（猫）は、狭義には食肉目ネコ科ネコ属に分類されるリビアヤマネコ（ヨーロッパヤマネコ）が家畜化されたイエネコ（家猫、Felis silvestris catus）に対する通称である。'
            'イヌ（犬）と並ぶ代表的なペットとして、世界中で飼われている。広義的には、ヤマネコやネコ科動物全般を指すこともある（後述）。\nイエネコの起源は、ネズミを捕獲させる目的で飼'
            'われ始めたリビアヤマネコの家畜化である[1]。リビアヤマネコは独立種 Felis lybica Forster, 1780とされることもあるが、ヨーロッパヤマネコの亜種 Felis silvestris'
            ' lybica Forster, 1780ともされる[2]。その場合イエネコを含むヨーロッパヤマネコの学名は、記載が古いFelis catus Linnaeus, 1758となるのが命名法上の原則である。'
            'しかしこれを原則通りに運用すると様々な支障が出ることから、2003年にICZNの強権によりFelis silvestris Schreber, 1777をイエネコを含むヨーロッパヤマネコの学名とし'
            'て使用できることが認められた（Opinion 2027）[3]。つまりヨーロッパヤマネコの亜種としてのイエネコの学名は、Felis silvestris catus Linnaeus, 1758とすることが'
            'できる。なおイエネコをヨーロッパヤマネコと別種として扱う場合には、イエネコの学名はFelis catusが正しい。\n一方、広義の「ネコ」は、ネコ類（ネコ科動物）の一部、あるい'
            'はその全ての包括的分類を指し、家畜種のイエネコに加えて広義のヤマネコ類を含む。特に学術用語としては、英語の「cat」と同様、トラやライオンなどといった大型種を含む全てのネ'
            'コ科動物を指すことがある。',
        E: 'The cat (Felis catus) is a domestic species of small carnivorous mammal. It is the only domesticated species in the family Felidae '
            'and is often referred to as the domestic cat to distinguish it from the wild members of the family. A cat can either be a house cat, '
            'a farm cat or a feral cat; the latter ranges freely and avoids human contact. Domestic cats are valued by humans for companionship and '
            'their ability to kill rodents. About 60 cat breeds are recognized by various cat registries.\nThe cat is similar in anatomy to the '
            'other felid species: it has a strong flexible body, quick reflexes, sharp teeth and retractable claws adapted to killing small prey. '
            'Its night vision and sense of smell are well developed. Cat communication includes vocalizations like meowing, purring, trilling, '
            'hissing, growling and grunting as well as cat-specific body language. A predator that is most active at dawn and dusk (crepuscular), '
            'the cat is a solitary hunter but a social species. It can hear sounds too faint or too high in frequency for human ears, such as those '
            'made by mice and other small mammals.[7] Cats also secrete and perceive pheromones.\nFemale domestic cats can have kittens from spring '
            'to late autumn, with litter sizes often ranging from two to five kittens.[9] Domestic cats are bred and shown at events as registered '
            'pedigreed cats, a hobby known as cat fancy. Population control of cats may be effected by spaying and neutering, but their proliferation '
            'and the abandonment of pets has resulted in large numbers of feral cats worldwide, contributing to the extinction of entire bird, mammal, '
            'and reptile species.'
    ),
    PostDetail(
        V: 'Anh túc hay còn gọi là a phiến, á phiện, thuốc phiện, thẩu, trẩu (người Tày gọi là cây nàng tiên), là loài thực vật có tên khoa học là Papaver '
            'somniferum L., thuộc họ Anh túc (Papaveraceae). Được xem là cây dược liệu quý. Trong y học dùng cho giảm đau tốt nhất trong các loại '
            'dược liệu cả Đông lẫn Tây y. Chiết xuất của cây này làm gây nghiện nặng. Ngành y học khuyến cáo không nên dùng trong các trường hợp thông '
            'thường, phải có sự chỉ định chi tiết và giám sát trực tiếp của bác sĩ. Việc lạm dụng quá mức có thể gây nghiện. Chính phủ Việt Nam đã cấm '
            'trồng cây này, lập một đơn vị phòng chống ma túy kiểm soát; thuốc phiện và các chất được tinh chiết từ nó, và các chất gây nghiện khác cần '
            'sa không gây nghiện nhưng bị cấm, một trong những quốc gia lớn đã hợp thức hóa nó, v.v.\nThân cao 1m-1,5m. Mỗi năm một vụ, mùa gieo hạt khoảng '
            '10-11 âm lịch nằm vào mùa đông, thời gian từ khi gieo hạt đến khi ra hoa lấy mủ khoảng 3 tháng. Thích hợp với khí hậu vùng cao, có khi lên đến '
            '1000m. Hoa khá đặc biệt; cùng một thân cây nhưng lại có bông hoa với các màu khác nhau, bông màu vàng tím và bông màu tím, trắng..v.v\nSố lượng '
            'khoảng 1 sào bắc bộ (360m²) mới lấy được 3 lạng mủ được cô đen (nha phiến). Sau khi hết mủ khai thác, quả khô bóc vỏ ra hạt ở trong. Hạt này '
            'có thể ăn sống được, thường trẻ con hay ăn. Hạt dùng để lấy giống vụ sau.\nNếu cần 1 kg bạch phiến thì cần phải tinh chế 10 kg nha phiến.Việc'
            ' chế biến thuốc phiện cổ truyền thì lấy nhựa thẩu phết lên trên một tấm giấy bản rồi đem hong khô. Đó là "thuốc sống". Lấy thuốc sống bóc bỏ '
            'giấy, đem dầm vào nước sôi, lọc sạch rồi đun cho đặc lại thì thành "thuốc chín". Đây là dạng thuốc dùng hút ở Đông Dương vào đầu thế kỷ 20.',
        J: 'ケシ（芥子、罌粟、Opium poppy、学名 Papaver somniferum）は、ケシ科ケシ属に属する一年草の植物。\n日本語の「ケシ」は英語の「poppy（ポピー）」と同義とされる[要検証 – '
            'ノート]が、英語では単に「poppy」といえばイギリス各地に自生しており、園芸種としても盛んに栽培されているヒナゲシ（corn poppy（コーン・ポピー））を指す。一方日本語で単にケシ'
            'といった場合、それが種指定をも包含している場合はもっぱら本種を指す。英語では本種を「opium poppy（オピウム・ポピー）」と呼び「poppy」とは明確に区別している。日本語でも、'
            '他の園芸用ケシ属植物と区別するため、特に本種を阿片ケシ（アヘンケシ）と呼ぶことがあり、学会などでは種小名を用いソムニフェルム種と呼ぶ。このソムニフェルム種はリンネの『植物の'
            '種（英語版）』(1753年) で記載された植物種の一つでもある[1]。\n芥子という表記は本来カラシナを指す言葉であるが、ケシの種子とカラシナの種子がよく似ていることから、室町時代中'
            '期に誤用されて定着したものであるとされる。\n日本では「opium poppy」など「opium」産生植物はアヘン法で栽培が禁止されている種に指定されており、政府の許可を得ずして栽培して'
            'はならない。「opium」とはアヘン、麻薬の意味である。',
        E: 'Papaver somniferum, commonly known as the opium poppy[2] or breadseed poppy,[3] is a species of flowering plant in the family Papaveraceae. '
            'It is the species of plant from which both opium and poppy seeds are derived and is also a valuable ornamental plant, grown in gardens. '
            'Its native range is probably the eastern Mediterranean, but is now obscured by ancient introductions and cultivation, being naturalized '
            'across much of Europe and Asia.\nThis poppy is grown as an agricultural crop on a large scale, for one of three primary purposes. The '
            'first is to produce seeds that are eaten by humans, known commonly as poppy seed. The second is to produce opium for use mainly by the '
            'pharmaceutical industry.\nThe third is to produce other alkaloids, mainly thebaine and oripavine, that are processed by the '
            'pharmaceutical industry into drugs such as hydrocodone and oxycodone.[4] Each of these goals has special breeds that are targeted at '
            'one of these businesses, and breeding efforts (including biotechnological ones) are continually underway.[4][5][6] A comparatively small '
            'amount of Papaver somniferum is also produced commercially for ornamental purposes.\nThe common name "opium poppy" is increasingly '
            'a misnomer as many varieties have been bred that do not produce a significant quantity of opium.[3][5] The cultivar "Sujata" produces '
            'no latex at all.[6] Breadseed poppy is more accurate as a common name today because all varieties of Papaver somniferum produce edible '
            'seeds. This differentiation has strong implications for legal policy surrounding the growing of this plant.\n'
    ),
    PostDetail(
        V: 'Bồ công anh hay rau bồ cóc, diếp hoang, diếp dại, mót mét, mũi mác, diếp trời, rau mũi cày (danh pháp hai phần: Lactuca indica) là một loài cây thân thảo thuộc họ Cúc (Asteraceae), sống một năm hoặc hai năm.\n'
            'Thân không lông, cao 60–200 cm, thân thường đơn hoặc chẻ nhánh ở phần trên. Các lá phía dưới không lông, lá đơn mọc cách. Phiến lá thuôn dài hoặc dạng hình mũi mác, kích thước phiến lá dài từ 13–25 cm, rộng '
            'từ 1,5–11 cm, đầu lá nhọn, đuôi lá hình nêm hoặc men cuống, cuống lá thường ngắn hoặc men cuống tới tận nách lá. Mép lá nguyên hoặc xẻ thùy '
            'hoặc có răng cưa thô to. Mặt trên phiến lá màu xanh lục, mặt dưới xanh xám. Các lá mọc ở phía trên gần đỉnh ngọn sinh hoa thường trên '
            'nhỏ hơn và thẳng. Hoa mọc ở đầu ngọn, đầu cành. Hoa tự hình chùy, đầu cụm hoa rộng khoảng 2 cm; cuống dài 10–25 mm, mọc thẳng. Tổng bao '
            'hình trụ, kích thước chùm hoa thường cao 10–13 cm, rộng 5–6 mm, các lá bắc không lông, màu tía, các lá ngoài hình trứng, dài 2–3 mm, các '
            'lá trong hình trứng-mũi mác, các lá bắc tận trong cùng khoảng 8, hình mũi mác. Hoa tự thường có 21-27 bông, màu vàng nhạt, kích thước hoa '
            '12–13 mm, rộng mm. Quả bế hình elip, phẳng, màu đen, kích thước quả dài 4-4,5 mm, rộng 2,3 mm; mỏ quả dài 1-1,5 mm. Mào lông màu trắng gắn '
            'liền quả dài 7–8 mm. Bồ công anh có số nhiễm sắc thể 2n = 18 (Peng & Hsu, 1978).\nBồ công anh chứa nhiều sắt (tương đương với lượng sắt tìm thấy trong rau dền),vitamin C, vitamin B vitamin A cao và nhiều nguyên tố vi lương khác như Magiê, calci, natri…',
        J: 'アキノノゲシ（秋の野芥子、秋の野罌粟、学名: Lactuca indica）は、キク科アキノノゲシ属の一年草または二年草。和名は、春に咲くノゲシに似て、秋に咲くことから付けられた。\n'
            '高さ50～200cm。大柄だが柔らかく、全体につやがない。はじめは根出葉をロゼット状に出すが、やがて茎をたて、花序を出す。花期は8～12月。花は淡い黄色、直径2cmほどで舌状花だけでできている。種子はタンポポの綿毛を小さくしたような形をしている。レタスの仲間で、葉や茎を切ると白い液が出る。\n'
            '東南アジア原産で、日本全土・朝鮮・中国・台湾・東南アジアに分布。稲作と共に日本へ渡って来た史前帰化植物。日当りの良い場所に生える。アキノノゲシには葉に切れ込みがあるが、切れ込みのない細い葉を持つものは、ホソバアキノノゲシ（学名: Lactuca indica f. indivisa）という。',
        E: 'Lactuca indica, the Indian lettuce, is a species of plant in the tribe Cichorieae within the family Asteraceae. It is native to western China (Xinjiang, Tibet), the Himalayas, and southwest Asia as far west as Turkey. It is widely introduced elsewhere, even as far as east Africa, and is thought to be an archaeophyte in Japan, brought in with rice cultivation.\n'
            'Lactuca indica is a biennial herb, growing from a taproot to at least 40 cm tall and often reaching 2 m. Its flowers have white to pale yellow ray florets with yellower centers. The narrowness of the leaf blades and the degree of spikiness of leaf lobes varies greatly by region.\n'
            'It is cultivated (or rather, its growth is encouraged) as fodder for rabbits, pigs, poultry and even fish in Asia.[2][3] Its young leaves can be, and are, consumed as a leaf vegetable in salads like other dandelions.[4] It is used in traditional medicines as an aid to digestion.'
    ),
    PostDetail(
        V: 'Bảng tuần hoàn (tên đầy đủ là Bảng tuần hoàn các nguyên tố hóa học, còn được biết với tên Bảng tuần hoàn Mendeleev), là một phương pháp liệt kê các nguyên tố hóa học thành dạng bảng, dựa trên số hiệu nguyên tử (số proton trong hạt nhân), cấu hình electron và các tính chất hóa học tuần hoàn của chúng. Các nguyên tố được biểu diễn theo trật tự số hiệu nguyên tử tăng dần, thường liệt kê cùng với ký hiệu hóa học trong mỗi ô. Dạng tiêu chuẩn của bảng gồm các nguyên tố được sắp xếp thành 18 cột và 7 dòng, với hai dòng kép nằm riêng nằm bên dưới cùng.\n'
        'Các hàng trong bảng gọi là các chu kỳ, trong khi các cột gọi là các nhóm, một số có tên riêng như halogen hoặc khí hiếm. Bởi vì theo định nghĩa một bảng tuần hoàn thể hiện những xu hướng tuần hoàn, bất kỳ bảng dưới dạng nào cũng có thể dùng để suy ra mối quan hệ giữa các tính chất của nguyên tố và tiên đoán tính chất của những nguyên tố mới, chưa được khám phá hoặc chưa tổng hợp được. Do đó, một bảng tuần hoàn-dù ở dạng tiêu chuẩn hay các biến thể-cung cấp khuôn khổ hữu ích cho việc phân tích thuộc tính hóa học, và các bảng như vậy được sử dụng rộng rãi trong hóa học và các ngành khoa học khác.\n'
            'Mặc dù có những người tiên phong trước đó, Dmitri Ivanovich Mendeleev thường được xem là người công bố bảng tuần hoàn phổ biến đầu tiên vào năm 1869. Ông đã phát triển bảng tuần hoàn của mình để minh họa các xu hướng tuần hoàn trong thuộc tính các nguyên tố đã biết khi đó. Mendeleev cũng tiên đoán một số thuộc tính của các nguyên tố chưa biết mà ông hi vọng sẽ lấp vào những chỗ trống trong bảng này. Hầu hết những tiên đoán của ông tỏ ra chính xác khi các nguyên tố đó lần lượt được phát hiện. Bảng tuần hoàn của Mendeleev từ đó đã được mở rộng và hiệu chỉnh với sự khám giá hoặc tổng hợp thêm những nguyên tố mới và sự phát triển của các mô hình lý thuyết để giải thích thuộc tính hóa học.\n'
            'Tất cả các nguyên tố có số nguyên tử từ 1 (hiđrô) đến 118 (Oganesson) đã được phát hiện hoặc ghi nhận tổng hợp được, trong khi các nguyên tố 113, 115, 117 và 118 vẫn chưa được thừa nhận rộng rãi. 98 nguyên tố đầu tồn tại trong tự nhiên mặc dù một số chỉ tìm thấy sau khi đã tổng hợp được trong phòng thí nghiệm và tồn tại với lượng cực nhỏ.[chú thích 1] Các nguyên tố có số hiệu nguyên tử từ 99 đến 118 chỉ được tổng hợp ra, hoặc được tuyên bố là đã tổng hợp được trong phòng thí nghiệm. Người ta hiện vẫn đang theo đuổi việc tạo ra các nguyên tố có các số hiệu nguyên tử lớn hơn, cũng như tranh cãi về câu hỏi rằng bảng tuần hoàn có thể cần phải hiệu chỉnh ra sao để tương thích với những nguyên tố mới sẽ thêm vào.',
        J: '周期表（しゅうきひょう、英: periodic table）は、物質を構成する基本単位である元素を、それぞれが持つ物理的または化学的性質が似たもの同士が並ぶように決められた規則（周期律）に従って配列した表である。「周期律表」や「元素周期表」などとも呼ばれる。\n'
            '周期表は原則的に、左上から原子番号の順に並ぶよう作成されている[1]。周期表上で元素はその原子の電子配置に従って並べられ、似た性質の元素が規則的に出現する[2]。\n'
            '同様の主旨を元に作成された先駆的な表も存在するが、一般に周期表は1869年にロシアの化学者ドミトリ・メンデレーエフによって提案された[3]、原子量順に並べた元素がある周回で傾向が近似した性質を示す周期的な特徴を例証した表に始まると見なされている。この表の形式は、新元素の発見や理論構築など元素に対する知見が積み重なるとともに改良され、現在では各元素のふるまいを説明する洗練された表となっている[4]。\n'
            '周期表は、錬金術師、化学者、物理学者、その他の科学者など、無数の人たちによる知の集大成である。元素の性質を簡潔かつ完成度が高く示した周期表は「化学のバイブル」とも呼ばれる[5]。現在、周期表は化学のあらゆる分野で、反応の分類や体系化および比較を行うための枠組みを与えるものとして汎用的に用いられている。そして、化学だけでなく物理学、生物学、化学工学を中心に工学全体に、多くの法則を示す表として用いられる。'
            '周期表の配列は、原子の中心に位置する核が保持する陽子の個数に基づいて付けられる原子番号順に並べられる。陽子が1個である水素から始まり、1マス進むごとに陽子が1つ多い元素記号を示しながら並べる。周期律に沿って改行され、2段目・3段目…と順次追加されてゆく。そのため、左から右へ、また上から下へ行くにつれて原子番号が大きな元素が並ぶ[1]。',
        E: 'The periodic table, also known as the periodic table of the (chemical) elements, is a tabular display of the chemical elements. It is widely used in chemistry, physics, and other sciences, and is generally seen as an icon of chemistry. It is a graphic formulation of the periodic law, which states that the properties of the chemical elements exhibit a periodic dependence on their atomic numbers.\n'
            'The table is divided into four roughly rectangular areas called blocks. The rows of the table are called periods, and the columns are called groups. Elements from the same column group of the periodic table show similar chemical characteristics. Trends run through the periodic table, with nonmetallic character (keeping their own electrons) increasing from left to right across a period, and from down to up across a group, and metallic character (surrendering electrons to other atoms) increasing in the opposite direction. The underlying reason for these trends is electron configurations of atoms.\n'
            'The first periodic table to become generally accepted was that of the Russian chemist Dmitri Mendeleev in 1869: he formulated the periodic law as a dependence of chemical properties on atomic mass. Because not all elements were then known, there were gaps in his periodic table, and Mendeleev successfully used the periodic law to predict properties of some of the missing elements. The periodic law was recognized as a fundamental discovery in the late 19th century, and it was explained with the discovery of the atomic number and pioneering work in quantum mechanics of the early 20th century that illuminated the internal structure of the atom. With Glenn T. Seaborg’s 1945 discovery that the actinides were in fact f-block rather than d-block elements, a recognisably modern form of the table was reached. The periodic table and law are now a central and indispensable part of modern chemistry.\n'
            'The periodic table continues to evolve with the progress of science. In nature, only elements up to atomic number 94 exist; to go further, it was necessary to synthesise new elements in the laboratory. Today, all the first 118 elements are known, completing the first seven rows of the table, but chemical characterisation is still needed for the heaviest elements to confirm that their properties match their positions. It is not yet known how far the table will stretch beyond these seven rows and whether the patterns of the known part of the table will continue into this unknown region. Some scientific discussion also continues regarding whether some elements are correctly positioned in today’s table. Many alternative representations of the periodic law exist, and there is some discussion as to whether there is an optimal form of the periodic table.'
    ),
    PostDetail(
        V: 'Apple Inc. là một tập đoàn công nghệ đa quốc gia của Mỹ có trụ sở chính tại Cupertino, California, chuyên thiết kế, phát triển và bán thiết bị điện tử tiêu dùng, phần mềm máy tính và các dịch vụ trực tuyến. Nó được coi là một trong Năm công ty lớn của ngành công nghệ thông tin Hoa Kỳ, cùng với Amazon, Google, Microsoft và Meta.[3][4][5] Các dòng sản phẩm phần cứng của hãng bao gồm điện thoại thông minh iPhone, máy tính bảng iPad, máy tính xách tay Macbook, máy tính cá nhân Mac, máy nghe nhạc di động iPod, đồng hồ thông minh Apple Watch, máy phát đa phương tiện kỹ thuật số Apple TV, tai nghe không dây AirPods, tai nghe AirPods Max và loa thông minh HomePod. Phần mềm của Apple bao gồm hệ điều hành macOS, iOS, iPadOS, watchOS và tvOS, trình phát đa phương tiện iTunes, trình duyệt web Safari, mã nhận dạng nhạc Shazam, gói làm việc năng suất và sáng tạo iLife và iWork, cũng như các ứng dụng chuyên nghiệp như Final Cut Pro, Logic Pro và Xcode. Các dịch vụ trực tuyến của nó bao gồm iTunes Store, iOS App Store, Mac App Store, Apple Arcade, Apple Music, Apple TV +, iMessage và iCloud. Các dịch vụ khác bao gồm Apple Store, Genius Bar, AppleCare, Apple Pay, Apple Pay Cash và Apple Card.\n'
            'Apple được Steve Jobs, Steve Wozniak và Ronald Wayne thành lập vào tháng 4 năm 1976 để phát triển và bán máy tính cá nhân Apple I của Wozniak, mặc dù Wayne đã bán lại cổ phần của mình trong vòng 12 ngày. Nó được hợp nhất thành Apple Computer, Inc., vào tháng 1 năm 1977, và doanh số bán máy tính của nó, bao gồm cả Apple I và Apple II, đã tăng nhanh chóng.\n'
            'Jobs và Wozniak đã thuê một nhân viên thiết kế máy tính và có một dây chuyền sản xuất bắt đầu từ ga ra của Jobs. Apple ra mắt công chúng vào năm 1980 với thành công tài chính tức thì. Trong vài năm tiếp theo, Apple đã xuất xưởng những chiếc máy tính mới có giao diện người dùng đồ họa sáng tạo, chẳng hạn như Macintosh ban đầu vào năm 1984 và các quảng cáo tiếp thị của Apple cho sản phẩm của mình đã nhận được sự hoan nghênh rộng rãi. Tuy nhiên, giá sản phẩm cao và thư viện ứng dụng hạn chế đã gây ra nhiều vấn đề, cũng như tranh giành quyền lực giữa các giám đốc điều hành. Năm 1985, Wozniak rời Apple một cách thân thiện và vẫn là một nhân viên danh dự,[7] trong khi Jobs từ chức để thành lập NeXT, dẫn theo một vài đồng nghiệp đi cùng.',
        J: 'Apple Inc.（アップル）は、アメリカ合衆国の多国籍テクノロジー企業である。カリフォルニア州クパチーノに本社を置く。デジタル家庭電化製品、ソフトウェア、オンラインサービスの開発・販売を行っている。\n'
            'ハードウェア製品としては、iPhone、iPad、Mac、Apple Watch、iPodなどの開発および販売を行なっている。ソフトウェア製品としてはApple Music、Apple TV+、Apple Arcade、 Apple Fitness+、Apple Podcast、Apple Books、App Store、iTunesなど広範囲のデジタルコンテンツ販売などを行っている。また、iCloud、iCloud+などのクラウドサービスも提供している[5]。\n'
            'Appleの全世界での年間収益は、2020年度には2745億ドルとなった[6]。Appleは売上高で世界最大のテクノロジー企業であり[7]、2021年現在で世界で最も価値のある企業である[8]。販売台数で世界第4位のパソコンメーカーとなっており[9]、2021年のスマートフォン市場では、出荷台数第2位、売り上げシェア第1位となっている[10][11]。2022年1月、Appleは全世界の上場企業として初めて時価総額3兆ドルを超えた企業となった[12]。また2022年5月11日時点での時価総額は約307兆円で世界2位[13]。Appleは、2021年末時点で15万4000人の正社員を雇用し、25か国に511の直営店を展開している[14]。また、同時期のApple製品利用台数は全世界で16億5000万台以上である。',
        E: 'Apple Inc. is an American multinational technology company that specializes in consumer electronics, software and online services headquartered in Cupertino, California, United States. Apple is the largest technology company by revenue (totaling USD: 365.8 billion in 2021) and as of May 2022, it is the world’s second most valuable company,[7] the fourth-largest personal computer vendor by unit sales and second-largest mobile phone manufacturer. It is one of the Big Five American information technology companies, alongside Alphabet, Amazon, Meta, and Microsoft.\n'
            'Apple was founded as Apple Computer Company on April 1, 1976, by Steve Jobs, Steve Wozniak and Ronald Wayne to develop and sell Wozniak’s Apple I personal computer. It was incorporated by Jobs and Wozniak as Apple Computer, Inc. in 1977 and the company’s next computer, the Apple II became a best seller. Apple went public in 1980, to instant financial success. The company developed computers featuring innovative graphical user interfaces, including the original Macintosh, announced in a critically acclaimed advertisement, "1984", directed by Ridley Scott. By 1985, the high cost of its products and power struggles between executives caused problems. Wozniak stepped back from Apple amicably and pursued other ventures, while Jobs resigned bitterly and founded NeXT, taking some Apple employees with him.\n'
            'As the market for personal computers expanded and evolved throughout the 1990s, Apple lost considerable market share to the lower-priced duopoly of the Microsoft Windows operating system on Intel-powered PC clones (also known as "Wintel"). In 1997, weeks away from bankruptcy, the company bought NeXT to resolve Apple’s unsuccessful operating system strategy and entice Jobs back to the company. Over the next decade, Jobs guided Apple back to profitability through a number of tactics including introducing the iMac, iPod, iPhone and iPad to critical acclaim, launching Think_different and other memorable advertising campaigns, opening the Apple Store retail chain, and acquiring numerous companies to broaden the company’s product portfolio. When Jobs resigned in 2011 for health reasons, and died two months later, he was succeeded as CEO by Tim Cook.'
    ),
    PostDetail(
        V: "Samsung (Tiếng Hàn: 삼성, Romaja: Samseong, Hanja: 三星; Hán-Việt: Tam Tinh - 3 ngôi sao) là một tập đoàn đa quốc gia của Hàn Quốc có trụ sở chính đặt tại Samsung Town, Seocho, Seoul. Tập đoàn sở hữu rất nhiều công ty con, chuỗi hệ thống bán hàng cùng các văn phòng đại diện trên toàn cầu hoạt động dưới tên thương hiệu mẹ. Đây là một trong những thương hiệu công nghệ đắt giá nhất thế giới.\n"
            "Samsung được sáng lập bởi doanh nhân Lee Byung-chul vào năm 1938, khởi đầu là một công ty buôn bán nhỏ. Sau hơn 3 thập kỷ phát triển, Samsung dần đa dạng hóa các ngành nghề, bắt đầu tham gia vào lĩnh vực công nghiệp điện tử vào cuối thập niên 60, xây dựng nhà máy đóng tàu vào giữa thập niên 70. Sau khi Lee Byung-chul mất, Samsung tách ra thành 4 tập đoàn nhỏ, bao gồm: Samsung, Shinsegae, CJ và Hansol. Từ thập niên 90, Samsung mở rộng hoạt động trên quy mô toàn cầu, tập trung vào các lĩnh vực công nghệ cao và điện tử tiêu dùng.\n"
            "Những công ty con tiêu biểu của Samsung bao gồm: Samsung Electronics, Samsung Heavy Industries, Samsung Engineering, Samsung C&T, Samsung Life Insurance, Samsung Everland, Samsung Techwin và Cheil Worldwide.",
        J: "サムスングループ（朝: 삼성그룹; 英: Samsung Group）は、大韓民国（韓国）の多国籍コングロマリット。アジア最大の財閥。\n"
            "サムスングループの子会社で世界最大の総合家電・電子部品・電子製品メーカーのサムスン電子を始め、総合電子部品企業のサムスン電機、薄型パネルや電池製造のサムスンSDI、造船やプラント生産のサムスン重工業、商社事業と建設事業のサムスン物産、プロジェクトのマネージメントやサービスなどのソリューションを提供するサムスンエンジニアリング、韓国最大の保険会社サムスン生命など、企業総数は64。サムスングループの2018年の売上高は9456億ドル。\n"
            "1938年、日本統治時代の朝鮮大邱市で、李秉喆が株式会社三星商会として設立。蘇洞（現在の允恭洞）において40人の従業員を抱える小さな貿易会社としてスタートした。干物、地元産の食料品や麺を扱っていた。会社は繁栄し、1947年に本社をソウルに移転したが、朝鮮戦争が勃発し、一時ソウルを離れることを余儀なくされ、釜山で第一製糖（現在のCJグループ）を設立。1954年に大邱で第一毛織を設立、国内で最大の羊毛工場を建設した。",
        E: "The Samsung Group[3] (or simply Samsung, stylized as SΛMSUNG) (Korean: 삼성 [samsʌŋ]) is a South Korean multinational manufacturing conglomerate headquartered in Samsung Town, Seoul, South Korea.[1] It comprises numerous affiliated businesses,[1] most of them united under the Samsung brand, and is the largest South Korean chaebol (business conglomerate). As of 2020, Samsung has the 8th highest global brand value.\n"
            "Samsung was founded by Lee Byung-chul in 1938 as a trading company. Over the next three decades, the group diversified into areas including food processing, textiles, insurance, securities, and retail. Samsung entered the electronics industry in the late 1960s and the construction and shipbuilding industries in the mid-1970s; these areas would drive its subsequent growth. Following Lee's death in 1987, Samsung was separated into five business groups – Samsung Group, Shinsegae Group, CJ Group and Hansol Group, and Joongang Group.\n"
            "Notable Samsung industrial affiliates include Samsung Electronics (the world's largest information technology company, consumer electronics maker and chipmaker measured by 2017 revenues),[5][6] Samsung Heavy Industries (the world's 2nd largest shipbuilder measured by 2010 revenues),[7] and Samsung Engineering and Samsung C&T Corporation (respectively the world's 13th and 36th largest construction companies).[8] Other notable subsidiaries include Samsung Life Insurance (the world's 14th largest life insurance company),[9] Samsung Everland (operator of Everland Resort, the oldest theme park in South Korea)[10] and Cheil Worldwide (the world's 15th largest advertising agency, as measured by 2012 revenues)."
    ),
    PostDetail(
        V: "Taylor Alison Swift (sinh ngày 13 tháng 12 năm 1989) là một nữ ca sĩ kiêm sáng tác nhạc người Mỹ. Những đĩa nhạc trải dài trên nhiều thể loại khác nhau và các sáng tác tự sự, thường lấy cảm hứng từ cuộc sống cá nhân của chính cô, đã nhận được sự tán dương rộng rãi của giới truyền thông và giới phê bình. Sinh ra tại West Reading, Pennsylvania, Swift chuyển đến Nashville, Tennessee ở tuổi 14 nhằm theo đuổi sự nghiệp nhạc đồng quê. Cô đã ký hợp đồng sáng tác với Sony/ATV Music Publishing vào năm 2004 và hợp đồng thu âm với Big Machine Records vào năm 2005, đồng thời phát hành album phòng thu đầu tay cùng tên vào năm 2006.\n"
            "Cô khám phá dòng nhạc pop đồng quê trong album phòng thu thứ hai và thứ ba, Fearless (2008) và Speak Now (2010). Thành công của hai đĩa đơn 'Love Story' và 'You Belong with Me' đã đưa Swift trở thành nghệ sĩ crossover hàng đầu. Cô đã thử nghiệm nhiều thể loại nhạc gồm pop, rock và điện tử trong album phòng thu thứ tư của mình, Red (2012). Album phòng thu thứ 5 của cô thuộc thể loại synth-pop 1989 (2014), biến Swift từ một ca sĩ nhạc đồng quê thành ngôi sao nhạc pop, với các đĩa đơn quán quân Billboard Hot 100 bao gồm 'Shake It Off', 'Blank Space' và 'Bad Blood'. Sự soi mói của giới truyền thông đối với đời sống cá nhân của Swift đã truyền cảm hứng cho album phòng thu thứ sáu, Reputation (2017), đi sâu vào âm hưởng urban.\n"
            "Sau khi chia tay Big Machine và ký hợp đồng với Republic Records vào năm 2018, Swift phát hành album phòng thu thứ bảy của cô, Lover, vào năm 2019. Sau những thành công thương mại trong thập niên 2010, cô đã mạnh dạn theo đuổi dòng nhạc indie folk và alternative rock trong các album phòng thu năm 2020, Folklore và Evermore, với chất trữ tình, lấy cảm hứng từ chủ nghĩa thoát ly trong đại dịch COVID-19, được khen ngợi vì cách kể chuyện đầy sắc thái. Để giành được quyền sở hữu bản gốc các tác phẩm cũ của bản thân, Swift đã phát hành hai album tái thu âm vào năm 2021, Fearless (Taylor's Version) và Red (Taylor's Version), cả hai đều được đánh giá cao về chất lượng âm nhạc và hiệu suất giọng hát được cải thiện. Bên cạnh âm nhạc, Swift đã có nhiều vai diễn khác nhau trong các bộ phim như Valentine's Day (2010) và Cats (2019). Cô đã phát hành bộ phim tài liệu tự thuật Miss Americana (2020), và các bộ phim âm nhạc do cô tự đạo diễn gồm Folklore: The Long Pond Studio Sessions (2020) và All Too Well: The Short Film (2021).",
        J: "テイラー・アリソン・スウィフト（Taylor Alison Swift、1989年12月13日 - ）は、アメリカ合衆国のシンガーソングライター[4]。グラミー賞を11回受賞（41回ノミネート）している[5]。\n"
            "カルヴィン・ハリスと共にリアーナの楽曲「This Is What You Came For」を作詞した際には、ニルス・ショーベリ（英語: Nils Sjöberg）というペンネームを使用した。ファンは総称して、スウィフティーズ（英語: Swifties）と呼ばれる。\n"
            "1989年12月13日、ペンシルベニア州ウエスト・レディングで生まれた[6]。父親は銀行のファイナンシャル・アドバイザーである[7][8]。父はペンシルベニア州で育ち、祖先は3代にわたる銀行頭取であった[9][10]。母親は投資信託のマーケティング管理であったが、退職後専業主婦となった[11]。母はアメリカ人であるが東南アジアを中心にエンジニアとして働いていた父親（テイラーの祖父）と10歳までシンガポールで過ごし、帰国後テキサス州に居住した[10]。テイラーには弟がいる。",
        E: "Taylor Alison Swift (born December 13, 1989) is an American singer-songwriter. Her discography spans multiple genres, and her narrative songwriting—often inspired by her personal life—has received critical praise and widespread media coverage. Born in West Reading, Pennsylvania, Swift moved to Nashville, Tennessee, at the age of 14 to pursue a career in country music. She signed a songwriting contract with Sony/ATV Music Publishing in 2004 and a recording deal with Big Machine Records in 2005, and released her eponymous debut studio album in 2006.\n"
            "Swift explored country pop on the albums Fearless (2008) and Speak Now (2010); the success of the singles 'Love Story' and 'You Belong with Me' on both country and pop radio established her as a leading crossover artist. She experimented with rock and electronic genres on her fourth studio album, Red (2012), supported by the singles 'We Are Never Ever Getting Back Together' and 'I Knew You Were Trouble'. Swift eschewed country on her synth-pop album 1989 (2014) and its chart-topping tracks 'Shake It Off', 'Blank Space', and 'Bad Blood'. The media scrutiny on Swift's life inspired Reputation (2017), which drew from urban sounds. Led by 'Look What You Made Me Do', the album made Swift the only act in MRC Data history to have four albums each sell over a million copies in a week.\n"
            "Parting ways with Big Machine, Swift signed with Republic Records in 2018 and released her seventh studio album, Lover (2019). Inspired by escapism during the COVID-19 pandemic, Swift ventured into indie folk and alternative rock styles on her 2020 studio albums, Folklore and Evermore, receiving plaudits for their nuanced storytelling. Following a dispute over the masters of her back catalog, she released the 2021 re-recordings Fearless (Taylor's Version) and Red (Taylor's Version) to universal acclaim. The number-one songs 'Cardigan', 'Willow' and 'All Too Well (10 Minute Version)' made Swift the only act to simultaneously debut atop the US Billboard Hot 100 and Billboard 200 charts three times. Besides music, she has played supporting roles in films such as Valentine's Day (2010) and Cats (2019), released the autobiographical documentary Miss Americana (2020), and directed the musical films Folklore: The Long Pond Studio Sessions (2020) and All Too Well: The Short Film (2021)."
    ),
    PostDetail(
        V: "Vịnh Hạ Long là một vịnh nhỏ thuộc phần bờ tây vịnh Bắc Bộ tại khu vực biển Đông Bắc Việt Nam, bao gồm vùng biển đảo của thành phố Hạ Long thuộc tỉnh Quảng Ninh.\n"
            "Là trung tâm của một khu vực rộng lớn có những yếu tố ít nhiều tương đồng về địa chất, địa mạo, cảnh quan, khí hậu và văn hóa, với vịnh Bái Tử Long phía Đông Bắc và quần đảo Cát Bà phía Tây Nam, vịnh Hạ Long giới hạn trong diện tích khoảng 1.553 km² bao gồm 1.969 hòn đảo lớn nhỏ, phần lớn là đảo đá vôi, trong đó vùng lõi của vịnh có diện tích 335 km² quần tụ dày đặc 775 hòn đảo. Lịch sử kiến tạo địa chất đá vôi của vịnh đã trải qua khoảng 500 triệu năm với những hoàn cảnh cổ địa lý rất khác nhau; và quá trình tiến hóa karst đầy đủ trải qua trên 20 triệu năm với sự kết hợp các yếu tố như tầng đá vôi dày, khí hậu nóng ẩm và tiến trình nâng kiến tạo chậm chạp trên tổng thể.[1] Sự kết hợp của môi trường, khí hậu, địa chất, địa mạo, đã khiến vịnh Hạ Long trở thành quần tụ của đa dạng sinh học bao gồm hệ sinh thái rừng kín thường xanh mưa ẩm nhiệt đới và hệ sinh thái biển và ven bờ với nhiều tiểu hệ sinh thái.[2] 17 loài thực vật đặc hữu[3] và khoảng 60 loài động vật đặc hữu[4] đã được phát hiện trong số hàng ngàn động, thực vật quần cư tại vịnh.\n"
            "Những kết quả nghiên cứu, thám sát khảo cổ học và văn hóa học cho thấy sự hiện diện của những cư dân tiền sử trên vùng vịnh Hạ Long từ khá sớm, đã tạo lập những hình thái văn hóa cổ đại tiếp nối nhau bao gồm văn hóa Soi Nhụ trong khoảng 18.000-7.000 năm trước Công Nguyên, văn hóa Cái Bèo trong 7.000-5.000 năm trước Công Nguyên[5] và văn hóa Hạ Long cách ngày nay khoảng từ 3.500-5.000 năm.[6] Tiến trình dựng nước và truyền thống giữ nước của dân tộc Việt Nam, trong suốt hành trình lịch sử, cũng khẳng định vị trí tiền tiêu và vị thế văn hóa của vịnh Hạ Long qua những địa danh mà tên gọi gắn với điển tích còn lưu truyền đến nay, như núi Bài Thơ, hang Đầu Gỗ, Bãi Cháy[6] v.v. Hiện nay, vịnh Hạ Long là một khu vực phát triển năng động nhờ những điều kiện và lợi thế sẵn có như có một tiềm năng lớn về du lịch, nghiên cứu khoa học, nuôi trồng, đánh bắt thủy sản, giao thông thủy đối với khu vực vùng biển Đông Bắc Việt Nam nói riêng và miền Bắc Việt Nam nói chung.",
        J: "ハロン湾（下竜湾、ハロンわん、ベトナム語：Vịnh Hạ Long / 泳下龍）は、ベトナム北部、トンキン湾北西部にある湾。漢字表記は下龍湾。クアンニン省のハロン市の南に位置し、カットバー島のほか大小3,000もの奇岩、島々が存在する。伝承では、中国がベトナムに侵攻してきた時、竜の親子が現れ敵を破り、口から吐き出した宝石が湾内の島々になったと伝えられている。カットバー島以外の島は現在は無人だが、約7,000年前の新石器時代にはわずかに人が住んでいた。また、数世紀前までは海賊の隠れ家として利用され、また、モンゴル帝国の侵攻の際には軍事的に利用された。\n"
            "彫刻作品のような島々の景観は、太陽の位置によって輝きが変化し、雨や霧によってまた趣のある雰囲気を醸し出す。地質学的には北は桂林（中国広西チワン族自治区）から、南はニンビンまでの広大な石灰岩台地の一角である。石灰岩台地が沈降し、侵食作用が進んで、現在の姿となった。\n"
            "1994年にユネスコの世界遺産（自然遺産）に登録。ユネスコが支援するフランスのNGO世界で最も美しい湾クラブにも加盟している。「キングコング:髑髏島の巨神」の公式ビジュアルに使用されている。",
        E: "Hạ Long Bay or Halong Bay (Vietnamese: Vịnh Hạ Long, IPA: (listen)) is a UNESCO World Heritage Site and popular travel destination in Quảng Ninh Province, Vietnam. The name Hạ Long means 'descending dragon'. Administratively, the bay belongs to Hạ Long city, Cẩm Phả city, and is a part of Vân Đồn District. The bay features thousands of limestone karsts and isles in various shapes and sizes. Ha Long Bay is a center of a larger zone which includes Bai Tu Long Bay to the northeast, and Cát Bà Island to the southwest. These larger zones share a similar geological, geographical, geomorphological, climate, and cultural characters.\n"
            "Hạ Long Bay has an area of around 1,553 km2 (600 sq mi), including 1,960–2,000 islets, most of which are limestone. The core of the bay has an area of 334 km2 (129 sq mi) with a high density of 775 islets.[1] The limestone in this bay has gone through 500 million years of formation in different conditions and environments. The evolution of the karst in this bay has taken 20 million years under the impact of the tropical wet climate.[2] The geo-diversity of the environment in the area has created biodiversity, including a tropical evergreen biosystem, oceanic and sea shore biosystem.[3] Hạ Long Bay is home to 14 endemic floral species[4] and 60 endemic faunal species.\n"
            "Historical research surveys have shown the presence of prehistoric human beings in this area tens of thousands years ago. The successive ancient cultures are the Soi Nhu culture around 18,000–7000 BC, the Cai Beo culture 7000–5000 BC[6] and the Hạ Long culture 5,000–3,500 years ago.[7] Hạ Long Bay also marked important events in the history of Vietnam with many artifacts found in Bai Tho Mountain, Dau Go Cave, Bai Chay."
    ),

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
class PostDetail{
  String V;
  String J;
  String E;
  PostDetail({required this.V,required this.J,required this.E});
}
class TheComment{ //component dor chat message demo
  String avatar;
  String name;
  String content;
  bool canDelete;
  TheComment({required this.avatar, required this.name,required this.content,required this.canDelete});
}