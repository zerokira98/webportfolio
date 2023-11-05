// import 'dart:io';
import 'package:newwebsite/global_var.dart' as global;
import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:newwebsite/pages/third_page.dart';
import 'package:url_launcher/url_launcher.dart';

class ProjectPage extends StatefulWidget {
  // final ScrollController scrollController;
  final PageController pageController;
  const ProjectPage({
    Key? key,
    // required this.scrollController,
    required this.pageController,
  }) : super(key: key);

  @override
  State<ProjectPage> createState() => _ProjectPageState();
}

class _ProjectPageState extends State<ProjectPage>
    with SingleTickerProviderStateMixin, AutomaticKeepAliveClientMixin {
  Color a = Colors.black;
  Color b = Colors.red;
  late AnimationController ac;
  late Animation<double> telo;
  late Animation<double> ani;
  // late Animation<Alignment> ani2;
  @override
  void initState() {
    ac = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 15450),
    );
    telo = CurvedAnimation(curve: Curves.easeInOut, parent: ac);
    ani = Tween(begin: 50.0, end: 255.0).animate(telo)
      ..addListener(() {
        setState(() {
          // debugPrint(ani.value.toString());
        });
      });
    ac.forward();
    super.initState();
    // if (mounted) {
    //   a = Colors.red;
    //   b = Colors.black;
    // }
  }

  @override
// TODO: implement wantKeepAlive
  bool get wantKeepAlive => true;
  @override
  Widget build(BuildContext context) {
    super.build(context);
    return Stack(
      children: [
        Column(
          children: [
            Container(
              // duration: Duration(milliseconds: 1450),
              width: double.maxFinite,
              height: MediaQuery.of(context).size.height * 0.6,
              decoration: BoxDecoration(
                  gradient: LinearGradient(colors: [
                Colors.black,
                Color.fromRGBO(
                  (ani.value / 3).floor(),
                  (ani.value / 10).floor(),
                  (ani.value / 10).floor(),
                  1,
                ),
                // b,
                Color.fromRGBO(
                  (ani.value / 3).floor(),
                  (ani.value / 10).floor(),
                  (ani.value / 10).floor(),
                  1,
                ),
                Colors.black,
              ], stops: const [
                0.0,
                0.2,
                // 0.5,
                0.8,
                1.0
              ])),
              child: Column(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Container(
                    padding: (const EdgeInsets.only(top: 64)),
                    child: const Text(
                      'Protofolio and Ongoing Programs',
                      // textScaleFactor: 1.7,
                      style: TextStyle(
                        fontSize: 32,
                        color: Colors.white,
                        shadows: [Shadow()],
                      ),
                    ),
                  ),
                  const Padding(padding: EdgeInsets.all(4)),
                  Row(
                    children: [
                      Expanded(
                        child: Container(
                          height: 180,
                          padding: const EdgeInsets.symmetric(horizontal: 18),
                          child: ListView.builder(
                            physics: const BouncingScrollPhysics(),
                            scrollDirection: Axis.horizontal,
                            itemBuilder: (context, i) {
                              if (i == 0) {
                                return const Padding(
                                  padding: EdgeInsets.all(8.0),
                                  child: ProjectCard(
                                    gitUrl:
                                        'https://github.com/zerokira98/order_makan',
                                    // dlLink: '',
                                    judul: 'Order Makan(Ongoing)',
                                    deskripsi:
                                        'Aplikasi POS untuk kasir tempat makan sederhana',
                                  ),
                                );
                              }
                              return const Padding(
                                padding: EdgeInsets.all(8.0),
                                child: ProjectCard(
                                  gitUrl: 'https://github.com/zerokira98/kasir',
                                  // dlLink: '',
                                  judul: 'CatatBeli',
                                  deskripsi:
                                      'Aplikasi catatan pembelian barang.Dirancang khusus untuk toko kelontong pribadi.',
                                ),
                              );
                            },
                            itemCount: 2,
                          ),
                        ),
                      ),
                    ],
                  ),
                  const Padding(padding: EdgeInsets.all(12))
                ],
              ),
            ),
            const ThirdPage(),
          ],
        ),
        Positioned(
            top: global.appbarHeight,
            left: 0,
            right: 0,
            child: Container(
              height: 24,
              decoration: const BoxDecoration(
                  gradient: LinearGradient(
                colors: [Colors.black, Colors.transparent],
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
              )),
              // transform: GradientRotation(math.pi / 2))),
              child: InkWell(
                  onTap: () {
                    widget.pageController.animateToPage(1,
                        duration: const Duration(milliseconds: 450),
                        curve: Curves.easeInOut);
                  },
                  child: const Icon(
                    Icons.keyboard_double_arrow_up_sharp,
                    color: Colors.white,
                  )),
            ))
      ],
    );
  }
}

class ProjectCard extends StatefulWidget {
  final String judul;
  final String deskripsi;
  final String? gitUrl;
  final String? dlLink;
  const ProjectCard(
      {Key? key,
      required this.judul,
      required this.deskripsi,
      this.gitUrl,
      this.dlLink})
      : super(key: key);

  @override
  State<ProjectCard> createState() => _ProjectCardState();
}

class _ProjectCardState extends State<ProjectCard> {
  bool hover = false;
  var styles = const TextStyle(color: Colors.white);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(boxShadow: [BoxShadow()]),
      // color: Colors.red,
      height: 160,
      width: 220,
      child: GestureDetector(
        onTap: () {
          // print(Platform.operatingSystem);
          // if (Platform.isAndroid) {
          setState(() {
            hover = !hover;
          });
          // }
        },
        child: MouseRegion(
          onHover: (event) {},
          onEnter: (a) {
            setState(() {
              hover = true;
            });

            // print('a');
          },
          onExit: (a) {
            setState(() {
              hover = false;
            });

            // print('aw');
          },
          child: Stack(
            children: [
              Positioned.fill(
                child: Container(
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                    boxShadow: const [BoxShadow(blurRadius: 12)],
                    color: Colors.white.withOpacity(0.8),
                  ),
                  child: Image.asset(widget.judul.contains('Catat')
                      ? 'res/catatbeli.png'
                      : 'res/ordermakan.png'),
                ),
              ),
              AnimatedPositioned(
                duration: const Duration(milliseconds: 300),
                curve: Curves.easeInOut,
                top: hover ? 0 : 120,
                left: 0,
                right: 0,
                bottom: 0,
                child: Container(
                  padding: const EdgeInsets.all(8.0),
                  color: hover ? Colors.black87 : Colors.black45,
                  child: !hover
                      ? Text(widget.judul, style: styles)
                      : Column(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Expanded(
                              child: AutoSizeText(
                                widget.deskripsi,
                                // overflow: TextOverflow.ellipsis,
                                style: styles,
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(top: 4),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceAround,
                                children: [
                                  MouseRegion(
                                    cursor: widget.gitUrl == null
                                        ? SystemMouseCursors.basic
                                        : SystemMouseCursors.click,
                                    child: GestureDetector(
                                      onTap: () {
                                        launchUrl(Uri.parse(widget.gitUrl!));
                                      },
                                      child: Text(
                                        'SourceCode',
                                        style: styles,
                                      ),
                                    ),
                                  ),
                                  MouseRegion(
                                    cursor: widget.dlLink == null
                                        ? SystemMouseCursors.basic
                                        : SystemMouseCursors.click,
                                    child: GestureDetector(
                                      onTap: () {
                                        launchUrl(Uri.parse(widget.dlLink!));
                                      },
                                      child: Text(
                                        'DownloadAPK',
                                        style: styles,
                                      ),
                                    ),
                                  )
                                ],
                              ),
                            )
                          ],
                        ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
