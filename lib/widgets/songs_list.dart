import 'package:flutter/material.dart';

class SongsList extends StatelessWidget {
  const SongsList({
    super.key,
    required this.songList,
  });

  final List<Map<String, Object>> songList;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          height: MediaQuery.of(context).size.height / 3.8,
          child: ListView.builder(
            padding: const EdgeInsets.only(bottom: 5),
            itemCount: songList.length,
            itemBuilder: (context, index) {
              return GestureDetector(
                onTap: () {},
                child: ListTile(
                  leading: Padding(
                    padding: EdgeInsets.only(
                        left: MediaQuery.of(context).size.width / 72),
                    child: ClipRRect(
                        borderRadius: BorderRadius.circular(15),
                        child: Image.asset(
                          songList[index]['image'] as String,
                          fit: BoxFit.cover,
                          height: MediaQuery.of(context).size.height /
                              13.334,
                          width: MediaQuery.of(context).size.width / 6,
                        )),
                  ),
                  title: Text(
                    songList[index]['title']! as String,
                    style: const TextStyle(
                        fontSize: 18, fontWeight: FontWeight.w600),
                  ),
                  subtitle: Text(
                    songList[index]['subtitle']! as String,
                  ),
                  trailing: IconButton(
                      onPressed: () {},
                      icon: const Icon(Icons.favorite_outline_outlined)),
                ),
              );
            },
          ),
        ),
      ],
    );
  }
}
