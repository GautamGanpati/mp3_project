import 'package:flutter/material.dart';
import 'package:mp3_project/widgets/songs_list.dart';
import 'package:mp3_project/widgets/trending_card.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _selectedIndex = 0;
  final songCardList = [
    {
      'title': 'The Dark Side',
      'subtitle': 'Muse - Simulation Theory',
      'image': 'assets/s1.png'
    },
    {
      'title': 'Under the Influence',
      'subtitle': 'Chris Brown',
      'image': 'assets/m2.png',
    },
    {
      'title': 'Forget Me',
      'subtitle': 'Lewis Capaldi',
      'image': 'assets/m3.png',
    },
  ];

  final songTypeList = [
    {'title': 'Trending right now'},
    {'title': 'Rock'},
    {'title': 'Hip Hop'},
    {'title': 'Electro'},
    {'title': 'Pop'},
  ];

  final songList = [
    {
      'title': 'I\'m Good (Blue)',
      'subtitle': 'David Guetta & Bebe Rexha',
      'image': 'assets/m1.png',
    },
    {
      'title': 'Under the Influence',
      'subtitle': 'Chris Brown',
      'image': 'assets/m2.png',
    },
    {
      'title': 'Forget Me',
      'subtitle': 'Lewis Capaldi',
      'image': 'assets/m3.png',
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0XFF2C2546),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: EdgeInsets.only(
                      top: MediaQuery.of(context).size.height / 10,
                      left: MediaQuery.of(context).size.width / 18),
                  child: Container(
                    height: MediaQuery.of(context).size.height / 20,
                    width: MediaQuery.of(context).size.width / 9,
                    decoration: const BoxDecoration(
                        color: Colors.white12,
                        borderRadius: BorderRadius.all(Radius.circular(10))),
                    child: const Icon(Icons.list),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(
                      left: MediaQuery.of(context).size.width / 18,
                      top: MediaQuery.of(context).size.height / 10),
                  child: Container(
                    height: MediaQuery.of(context).size.height / 20,
                    width: MediaQuery.of(context).size.width / 1.45,
                    decoration: const BoxDecoration(
                        color: Colors.white12,
                        borderRadius: BorderRadius.all(Radius.circular(10))),
                    child: TextFormField(
                      decoration: const InputDecoration(
                          prefixIcon: Icon(Icons.search),
                          hintText: 'Search',
                          border: InputBorder.none),
                    ),
                  ),
                )
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Padding(
                  padding: EdgeInsets.only(
                      top: MediaQuery.of(context).size.height / 30,
                      left: MediaQuery.of(context).size.width / 18),
                  child: const Text(
                    'Trending right now',
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 28,
                        fontWeight: FontWeight.w500),
                  ),
                ),
              ],
            ),
            TrendingCard(songCardList: songCardList),
            Row(
              children: [
                SizedBox(
                    height: MediaQuery.of(context).size.height / 20,
                    width: MediaQuery.of(context).size.width,
                    child: ListView.builder(
                        scrollDirection: Axis.horizontal,
                        itemCount: songTypeList.length,
                        itemBuilder: (context, index) {
                          return Padding(
                            padding: EdgeInsets.only(
                                left: MediaQuery.of(context).size.width / 18,
                                right: MediaQuery.of(context).size.width / 72),
                            child: Container(
                              decoration: BoxDecoration(
                                color: _selectedIndex == index
                                    ? Colors.deepPurple[700]
                                    : Colors.transparent,
                                borderRadius:
                                    const BorderRadius.all(Radius.circular(15)),
                              ),
                              child: Center(
                                  child: Padding(
                                padding: EdgeInsets.all(
                                    MediaQuery.of(context).size.height / 100),
                                child: GestureDetector(
                                    onTap: () {
                                      setState(() {
                                        _selectedIndex = index;
                                      });
                                    },
                                    child: Text(songTypeList[index]['title']!)),
                              )),
                            ),
                          );
                        }))
              ],
            ),
            const SizedBox(
              height: 5,
            ),
            SongsList(songList: songList),
          ],
        ),
      ),
    );
  }
}
