import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';

class TrendingCard extends StatefulWidget {
  const TrendingCard({
    super.key,
    required this.songCardList,
  });

  final List<Map<String, String>> songCardList;

  @override
  State<TrendingCard> createState() => _TrendingCardState();
}

class _TrendingCardState extends State<TrendingCard> {
 
  bool isPlaying = false;
  List<AudioPlayer> players = [
    AudioPlayer(),
    AudioPlayer(),
    AudioPlayer(),
  ];

  List<AssetSource> src = [
    AssetSource("the_dark_side.mp3"),
    AssetSource("under_the_influence.mp3"),
    AssetSource("forget_me.mp3")
  ];

  @override
  void dispose() {
    super.dispose();
    players;
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        SizedBox(
          height: MediaQuery.of(context).size.height / 3.3,
          width: MediaQuery.of(context).size.width,
          child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: widget.songCardList.length,
              itemBuilder: (context, index) {
                Future<void> init() async {
                  await players[index].setSource(src[index]);
                }

                return FutureBuilder(
                    future: init(),
                    builder: (context, async) {
                      return MusicCard(
                        ap: players[index],
                        songCardList: widget.songCardList[index],
                      );
                    });
              }),
        ),
      ],
    );
  }
}

class MusicCard extends StatefulWidget {
  const MusicCard({
    super.key,
    required this.songCardList,
    required this.ap,
  });
  final Map<String, String> songCardList;
  final AudioPlayer ap;
  @override
  State<MusicCard> createState() => _MusicCardState();
}

class _MusicCardState extends State<MusicCard> {
  bool isPlaying = false;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Padding(
          padding:
              EdgeInsets.only(top: MediaQuery.of(context).size.height / 40),
          child: Container(
            height: MediaQuery.of(context).size.height / 4,
            width: MediaQuery.of(context).size.width / 1.44,
            margin: EdgeInsets.only(
                left: MediaQuery.of(context).size.width / 20,
                right: MediaQuery.of(context).size.width / 72),
            decoration: BoxDecoration(
              color: Colors.white12,
              borderRadius: const BorderRadius.all(Radius.circular(35)),
              image: DecorationImage(
                  image: AssetImage(
                    widget.songCardList['image']!,
                  ),
                  fit: BoxFit.cover),
            ),
            child: Padding(
              padding: EdgeInsets.all(MediaQuery.of(context).size.height / 100),
              child: Align(
                  alignment: Alignment.topRight,
                  child: IconButton(
                    icon: const Icon(Icons.keyboard_control_outlined),
                    onPressed: () {},
                  )),
            ),
          ),
        ),
        Align(
          alignment: Alignment.bottomCenter,
          child: Opacity(
            opacity: 0.8,
            child: Container(
              height: MediaQuery.of(context).size.height / 10,
              width: MediaQuery.of(context).size.width / 1.637,
              margin: EdgeInsets.only(
                  left: MediaQuery.of(context).size.width / 11.25,
                  bottom: MediaQuery.of(context).size.height / 20),
              decoration: const BoxDecoration(
                color: Color(0XFF283D84),
                borderRadius: BorderRadius.all(Radius.circular(20)),
              ),
              child: ListTile(
                minVerticalPadding: MediaQuery.of(context).size.height / 40,
                title: Text(widget.songCardList['title']!),
                subtitle: Text(widget.songCardList['subtitle']!),
                trailing: Padding(
                  padding: EdgeInsets.only(
                      bottom: MediaQuery.of(context).size.height / 100),
                  child: IconButton(
                      onPressed: () async {
                        if (isPlaying) {
                          await widget.ap.pause();
                          setState(() {
                            isPlaying = false;
                          });
                        } else {
                          await widget.ap.resume();
                          setState(() {
                            isPlaying = true;
                          });
                        }
                      },
                      icon: isPlaying
                          ? const Icon(
                              Icons.pause_circle_filled_outlined,
                              size: 50,
                            )
                          : const Icon(
                              Icons.play_circle_fill_outlined,
                              size: 50,
                            )),
                ),
              ),
            ),
          ),
        )
      ],
    );
  }
}
