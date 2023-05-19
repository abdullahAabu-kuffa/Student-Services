// ignore_for_file: use_build_context_synchronously

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import 'package:persistent_bottom_nav_bar/persistent-tab-view.dart';
import 'package:students_app/MainPage/chatGPT.dart';
import 'package:students_app/MainPage/departementsPage.dart';
import 'package:students_app/MainPage/homePage.dart';
import 'package:students_app/MainPage/notesPage.dart';
// import 'package:students_app/MainPage/profilePage.dart';
import 'package:students_app/MainPage/searchPage.dart';

Color mainColor = const Color.fromARGB(255, 1, 87, 155);

class MainPage extends StatefulWidget {
  const MainPage(
      {Key? key, required this.name, required this.email, required this.photo})
      : super(key: key);
  final String name;
  final String email;
  final String photo;

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  final PersistentTabController _controller =
      PersistentTabController(initialIndex: 0);
  String _title = "Home";
   final _screens = const [
    HomePage(),
    DepartementsPage(),
    SearchPage(),
    NotesPage(),
  ];

  final _navBarItems = [
    PersistentBottomNavBarItem(
      icon: const Icon(CupertinoIcons.home),
      title: ("Home"),
      activeColorPrimary: mainColor,
      inactiveColorPrimary: CupertinoColors.systemGrey,
    ),
    PersistentBottomNavBarItem(
      icon: const Icon(CupertinoIcons.text_badge_minus),
      title: ("Departments"),
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
  ];

  final _auth = FirebaseAuth.instance;
  final messageTextController = TextEditingController();

  bool signOutLoading = false;

  @override
  Widget build(BuildContext context) {
    return ModalProgressHUD(
      inAsyncCall: signOutLoading,
      child: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          backgroundColor: mainColor,
          title: Text(
            _title,
            style: const TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 25.0,
            ),
          ),
          elevation: 0,
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
        drawer: Drawer(
          child: Column(children: [
            UserAccountsDrawerHeader(
              currentAccountPicture: CircleAvatar(
                child: Image.network(
                  widget.photo,
                ),
              ),
              accountName: Text(widget.name),
              accountEmail: Text(widget.email),
            ),
            TextButton(
              onPressed: () {},
              child: const ListTile(
                leading: Icon(Icons.home),
                title: Text('Home'),
              ),
            ),
            const Divider(thickness: 1),
            TextButton(
              onPressed: () {},
              child: const ListTile(
                leading: Icon(Icons.settings),
                title: Text('Settings'),
              ),
            ),
            const Divider(thickness: 1),
            TextButton(
              onPressed: () {},
              child: const ListTile(
                leading: Icon(Icons.help),
                title: Text('Help'),
              ),
            ),
            const Divider(thickness: 1),
            TextButton(
              onPressed: () async {
                setState(() {
                  signOutLoading = true;
                });
                await _auth.signOut();
                Navigator.of(context).pushReplacementNamed('logInScreen');
                setState(() {
                  signOutLoading = false;
                });
              },
              child: const ListTile(
                leading: Icon(Icons.logout),
                title: Text('Log out'),
              ),
            ),
          ]),
        ),
        body: PersistentTabView(
          context,
          controller: _controller,
          screens: _screens,
          items: _navBarItems,
          navBarStyle: NavBarStyle.style9,
          // navBarStyle: NavBarStyle.style9,
          // navBarStyle: NavBarStyle.style7,
          // navBarStyle: NavBarStyle.style10,
          // navBarStyle: NavBarStyle.style12,
          // navBarStyle: NavBarStyle.style13,
          // navBarStyle: NavBarStyle.style3,
          // navBarStyle: NavBarStyle.style6,
          onItemSelected: (index) {
            setState(() {
          _title = _navBarItems[index].title!;
        });
          },
        ),
      ),
    );
  }

  // List<PersistentBottomNavBarItem> _navBarsItems() {
  //   return [
  //     PersistentBottomNavBarItem(
  //       icon: const Icon(CupertinoIcons.home),
  //       title: ("Home"),
  //       activeColorPrimary: mainColor,
  //       inactiveColorPrimary: CupertinoColors.systemGrey,
  //     ),
  //     PersistentBottomNavBarItem(
  //       icon: const Icon(CupertinoIcons.text_badge_minus),
  //       title: ("departements"),
  //       activeColorPrimary: mainColor,
  //       inactiveColorPrimary: CupertinoColors.systemGrey,
  //     ),
  //     PersistentBottomNavBarItem(
  //       icon: const Icon(CupertinoIcons.search),
  //       title: ("Search"),
  //       activeColorPrimary: mainColor,
  //       inactiveColorPrimary: CupertinoColors.systemGrey,
  //     ),
  //     PersistentBottomNavBarItem(
  //       icon: const Icon(CupertinoIcons.news),
  //       title: ("Notes"),
  //       activeColorPrimary: mainColor,
  //       inactiveColorPrimary: CupertinoColors.systemGrey,
  //     ),
  //   ];
  // }
}
