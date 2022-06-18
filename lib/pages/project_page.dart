import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class ProjectPage extends StatelessWidget {
  const ProjectPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.maxFinite,
      padding: const EdgeInsets.all(48).add(EdgeInsets.only(bottom: 24)),
      decoration: const BoxDecoration(
          gradient: LinearGradient(
        colors: [Colors.black, Colors.red],
        begin: Alignment.topLeft,
        end: Alignment.bottomRight,
      )),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          const Text(
            'Protofolio',
            // textScaleFactor: 1.7,
            style: TextStyle(
              fontSize: 32,
              color: Colors.white,
              shadows: [Shadow()],
            ),
          ),
          const Padding(padding: EdgeInsets.all(24)),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: const [
              ProjectCard(
                gitUrl: 'https://github.com/zerokira98/kasir',
                // dlLink: '',
                judul: 'CatatBeli',
                deskripsi:
                    'Aplikasi catatan pembelian barang.Dirancang khusus untuk toko kelontong pribadi.',
              )
            ],
          ),
          Padding(padding: EdgeInsets.all(24))
        ],
      ),
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
      decoration: BoxDecoration(boxShadow: [BoxShadow()]),
      // color: Colors.red,
      height: 160,
      width: 220,
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
                  boxShadow: [BoxShadow(blurRadius: 12)],
                  color: Colors.white.withOpacity(0.8),
                ),
                child: Image.asset('res/catatbeli.png'),
              ),
            ),
            AnimatedPositioned(
              duration: Duration(milliseconds: 300),
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
                            padding: EdgeInsets.only(top: 4),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
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
    );
  }
}
