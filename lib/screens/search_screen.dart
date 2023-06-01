import 'package:flutter/material.dart';

class SearchScreen extends StatelessWidget {
  SearchScreen({super.key});

  final gridItems = [
    {
      'title': 'The Dark Side',
      'subtitle': 'Muse - Simulation',
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
    {
      'title': 'Millions',
      'subtitle': 'Muse - Simulation',
      'image': 'assets/s2.png'
    },
    {
      'title': 'Bright Hits',
      'subtitle': 'Chris Brown',
      'image': 'assets/m2.png',
    },
    {
      'title': 'Family Tourism',
      'subtitle': 'Lewis Capaldi',
      'image': 'assets/m1.png',
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0XFF2C2546),
      body: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 80, left: 20),
                child: Container(
                  height: 50,
                  width: 50,
                  decoration: const BoxDecoration(
                      color: Colors.white12,
                      borderRadius: BorderRadius.all(Radius.circular(10))),
                  child: const Icon(Icons.arrow_back_ios_outlined),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(right: 20, top: 80),
                child: Container(
                  height: 50,
                  width: 50,
                  decoration: const BoxDecoration(
                      color: Colors.white12,
                      borderRadius: BorderRadius.all(Radius.circular(10))),
                  child: const Icon(Icons.favorite_outline_outlined),
                ),
              )
            ],
          ),
          Row(
            children: [
              Padding(
                padding: EdgeInsets.only(
                    top: MediaQuery.of(context).size.height / 30,
                    left: MediaQuery.of(context).size.width / 18),
                child: const Text(
                  'Recent Favourites',
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 28,
                      fontWeight: FontWeight.w500),
                ),
              ),
            ],
          ),
          Column(
            children: [
              SizedBox(
                height: 490,
                child: GridView.builder(
                    padding: const EdgeInsets.only(top: 5),
                    gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                        mainAxisSpacing: 8,
                        crossAxisSpacing: 8),
                    itemCount: gridItems.length,
                    itemBuilder: (context, index) {
                      return Stack(
                        children: [
                          Container(
                              decoration: BoxDecoration(
                                  color: const Color(0XFF2C2546),
                                  borderRadius:
                                      const BorderRadius.all(Radius.circular(35)),
                                  image: DecorationImage(
                                      image: AssetImage(
                                        gridItems[index]['image']!,
                                      ),
                                      fit: BoxFit.cover)),
                              margin: const EdgeInsets.only(left: 5, right: 5),
                              child: Align(
                                alignment: Alignment.bottomLeft,
                                child: GridTile(
                                  footer: Padding(
                                    padding: const EdgeInsets.only(
                                        bottom: 5.0, left: 15),
                                    child: Text(
                                      gridItems[index]['subtitle']!,
                                      style: const TextStyle(color: Colors.grey),
                                    ),
                                  ),
                                  child: Padding(
                                    padding: const EdgeInsets.only(
                                        top: 135.0, left: 15),
                                    child: Text(
                                      gridItems[index]['title']!,
                                      style: const TextStyle(
                                          fontSize: 18,
                                          fontWeight: FontWeight.w500),
                                    ),
                                  ),
                                ),
                              )),
                        ],
                      );
                    }),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
