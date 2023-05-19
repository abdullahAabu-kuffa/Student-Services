import 'package:flutter/material.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import 'package:students_app/database/user_drive_api.dart';
import 'package:students_app/database/view_files.dart';
import 'package:students_app/MainPage/mainPage.dart';

class DepartementsPage extends StatefulWidget {
  const DepartementsPage({super.key});

  @override
  State<DepartementsPage> createState() => _DepartementsPageState();
}

class _DepartementsPageState extends State<DepartementsPage> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        initialRoute: '/',
        routes: {
          '/': (context) => const FirstPage(),
          '/الرياضيات': (context) => ViewFiles(files: files),
          '/الفيزياء': (context) => ViewFiles(files: files),
          '/الكيمياء': (context) => ViewFiles(files: files),
          '/الجيولوجيا': (context) => ViewFiles(files: files),
          '/النبات': (context) => ViewFiles(files: files),
          '/علم الحيوان': (context) => ViewFiles(files: files),
        });
  }
}

class FirstPage extends StatefulWidget {
  const FirstPage({super.key});
  @override
  State<FirstPage> createState() => _FirstPageState();
}

class _FirstPageState extends State<FirstPage> {
  bool _isLoading = false;

  @override
  Widget build(BuildContext context) {
    return ModalProgressHUD(
      opacity: 0.0,
      inAsyncCall: _isLoading,
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        // backgroundColor: mainColor,
        // appBar: AppBar(
        //   centerTitle: true,
        //   backgroundColor: const Color(0xFF1a1b26),
        //   title: const Text(
        //     "Home",
        //     style: TextStyle(
        //       fontFamily: 'Montserrat',
        //       fontSize: 25.0,
        //       fontWeight: FontWeight.bold,
        //       color: Color(0xFF9aa5ce),
        //     ),
        //   ),
        // ),
        body: Center(
          child: SingleChildScrollView(
            child: Column(
              // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    _buildCard(context, 'الرياضيات', '/الرياضيات',
                        '1grgwohUg_cK48bj9FVd4ay2AysJbOFUX'),
                    _buildCard(context, 'الفيزياء', '/الفيزياء',
                        '1QyDX5qMzzIFgJsUV_s5JzTzS97_2T158'),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    _buildCard(context, 'الكيمياء', '/الكيمياء',
                        '1mwtQ9FCjCPlgD6TM37ie89A3JiEAhE6F'),
                    _buildCard(context, 'الجيولوجيا', '/الجيولوجيا',
                        '1glVsIok43dHjDtuhhP6qTIs7xExbPV0_'),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    _buildCard(context, 'النبات', '/النبات',
                        '1wYSnvsXamCgSWWmbcYy8xnoIz2MuNemg'),
                    _buildCard(context, 'علم الحيوان', '/علم الحيوان',
                        '1SPxA8x0Hu5_qq4dRCeWFEndvWyblz5an'),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildCard(
      BuildContext context, String text, String route, String id) {
    return InkWell(
      onTap: () async {
        setState(() {
          _isLoading = true;
        });
        try {
          folderId = id;
          files = await GoogleDriveApi.init(folderId!);
          de = text;
          // ignore: use_build_context_synchronously
          Navigator.pushNamed(context, route);
        } catch (e) {
          ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
            content: Text('Not Found'),
            backgroundColor: Colors.red,
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(25))),
          ));
        }
        setState(() {
          _isLoading = false;
        });
      },
      child: Card(
        elevation: 5.0,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20),
        ),
        color: mainColor,
        child: Padding(
            padding: const EdgeInsets.all(45.0),
            child: SizedBox(
              height: 25,
              width: 80,
              child: Center(
                child: Text(
                  text,
                  style: const TextStyle(
                    fontSize: 15.0,
                    // fontFamily: 'Montserrat',
                    // fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
              ),
            )),
      ),
    );
  }
}
