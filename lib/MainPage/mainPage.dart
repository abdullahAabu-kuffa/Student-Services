import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:persistent_bottom_nav_bar/persistent-tab-view.dart';
import 'package:students_app/MainPage/chatGPT.dart';
import 'package:students_app/MainPage/departementsPage.dart';
import 'package:students_app/MainPage/homePage.dart';
import 'package:students_app/MainPage/notesPage.dart';
import 'package:students_app/MainPage/profilePage.dart';
import 'package:students_app/MainPage/searchPage.dart';

class MainPage extends StatefulWidget {
  const MainPage({Key? key}) : super(key: key);

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  Color mainColor = const Color.fromARGB(255, 1, 87, 155);
  final PersistentTabController _controller =
      PersistentTabController(initialIndex: 0);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Services of Students",
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        elevation: 0,
        backgroundColor: mainColor,
        actions: [
          IconButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const chatGPT()),
                );
              },
              icon: const Icon(CupertinoIcons.chat_bubble_2_fill))
        ],
      ),
      drawer: const Drawer(),
      body: PersistentTabView(
        context,
        controller: _controller,
        screens: const [
          HomePage(),
          DepartementsPage(),
          SearchPage(),
          NotesPage(),
          ProfilePage(),
        ],
        items: _navBarsItems(),
        navBarStyle: NavBarStyle.style9,
        // navBarStyle: NavBarStyle.style9,
        // navBarStyle: NavBarStyle.style7,
        // navBarStyle: NavBarStyle.style10,
        // navBarStyle: NavBarStyle.style12,
        // navBarStyle: NavBarStyle.style13,
        // navBarStyle: NavBarStyle.style3,
        // navBarStyle: NavBarStyle.style6,
      ),
    );
  }

  List<PersistentBottomNavBarItem> _navBarsItems() {
    return [
      PersistentBottomNavBarItem(
        icon: const Icon(CupertinoIcons.home),
        title: ("Home"),
        activeColorPrimary: mainColor,
        inactiveColorPrimary: CupertinoColors.systemGrey,
      ),
      PersistentBottomNavBarItem(
        icon: const Icon(CupertinoIcons.text_badge_minus),
        title: ("departements"),
        activeColorPrimary: mainColor,
        inactiveColorPrimary: CupertinoColors.systemGrey,
      ),
      PersistentBottomNavBarItem(
        icon: const Icon(CupertinoIcons.search),
        title: ("Search"),
        activeColorPrimary: mainColor,
        inactiveColorPrimary: CupertinoColors.systemGrey,
      ),
      PersistentBottomNavBarItem(
        icon: const Icon(CupertinoIcons.news),
        title: ("Notes"),
        activeColorPrimary: mainColor,
        inactiveColorPrimary: CupertinoColors.systemGrey,
      ),
      PersistentBottomNavBarItem(
        icon: const Icon(CupertinoIcons.person),
        title: ("Profile"),
        activeColorPrimary: mainColor,
        inactiveColorPrimary: CupertinoColors.systemGrey,
      ),
    ];
  }
}
