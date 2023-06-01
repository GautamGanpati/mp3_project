import 'package:flutter/material.dart';
import 'package:mp3_project/screens/home_screen.dart';
import 'package:mp3_project/screens/search_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData.dark(),
      home: const HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int selectedIndex = 0;

  static List<Widget> screens = <Widget>[
    const HomeScreen(),
    SearchScreen(),
    const Text(
      '',
    ),
    const Text(
      '',
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0XFF2C2546),
      bottomNavigationBar: SafeArea(
          child: Container(
        height: MediaQuery.of(context).size.height / 10,
        padding: const EdgeInsets.all(12),
        margin: const EdgeInsets.symmetric(horizontal: 15, vertical: 20),
        decoration: const BoxDecoration(
            color: Color(0XFF363B4C),
            borderRadius: BorderRadius.all(Radius.circular(24))),
        child: Center(
          child: BottomNavigationBar(
            currentIndex: selectedIndex,
            onTap: (index) => setState(() {
              selectedIndex = index;
            }),
            type: BottomNavigationBarType.fixed,
            backgroundColor: const Color(0XFF363B4C),
            elevation: 0,
            showSelectedLabels: false,
            showUnselectedLabels: false,
            selectedItemColor: Colors.white,
            unselectedItemColor: Colors.grey,
            items: const [
              BottomNavigationBarItem(
                  icon: Icon(Icons.home_outlined), label: ''),
              BottomNavigationBarItem(
                  icon: Icon(Icons.search_outlined), label: ''),
              BottomNavigationBarItem(
                  icon: Icon(Icons.music_note_outlined), label: ''),
              BottomNavigationBarItem(
                  icon: Icon(Icons.person_outline), label: ''),
            ],
          ),
        ),
      )),
      body: Center(
        child: screens.elementAt(selectedIndex),
      ),
    );
  }
}
