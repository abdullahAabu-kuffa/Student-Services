import 'package:flutter/material.dart';
import 'package:flutter_custom_tabs/flutter_custom_tabs.dart';

// import 'package:url_launcher/url_launcher.dart';
// import 'package:url_launcher/url_launcher_string.dart';
String? de;
dynamic files;

class ViewFiles extends StatefulWidget {
  const ViewFiles({super.key, required files});
  @override
  State<ViewFiles> createState() => _ViewFilesState();

  static Future openFile(dynamic file) async {
    final fileId = file.id;
    final url = 'https://drive.google.com/file/d/$fileId/view';
    await launch(url);
  }
}

class _ViewFilesState extends State<ViewFiles> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      // backgroundColor: const Color(0xFF24283b),
      // appBar: AppBar(
      //   leading: IconButton(
      //     icon: const Icon(
      //       Icons.arrow_back,
      //       color: Color(0xFF565f89),
      //     ),
      //     onPressed: () {
      //       Navigator.pop(context);
      //     },
      //   ),
      //   centerTitle: true,
      //   backgroundColor: const Color(0xFF1a1b26),
      //   title: Text(
      //     de!,
      //     style: const TextStyle(
      //       fontFamily: 'Montserrat',
      //       fontSize: 25.0,
      //       fontWeight: FontWeight.bold,
      //       color: Color(0xFF9aa5ce),
      //     ),
      //   ),
      // ),
      body: ListView.builder(
        // padding: const EdgeInsets.all(50),
        itemCount: files.length,
        itemBuilder: (context, index) {
          final file = files[index];
          final thumbnailLink = file.thumbnailLink;
          // print(file.thumbnailLink.toString());
          // final t= files.get(file.id, fields: 'thumbnailLink');
          // final thumbnailLink = file.thumbnailLink;

          return ListTile(
            autofocus: true,
            // onLongPress: ,
            contentPadding:
                const EdgeInsets.symmetric(vertical: 10.0, horizontal: 20.0),
            minLeadingWidth: 90,
            leading: SizedBox(
              width: 60.0,
              height: 60.0,
              child: Image.network(thumbnailLink),
            ),
            title: Text(
              file.name,
              overflow: TextOverflow.ellipsis,
              style: const TextStyle(
                // fontFamily: 'Montserrat',
                // fontWeight: FontWeight.bold,
                // color: Color(0xFF9aa5ce),
                fontSize: 16.0,
              ),
            ),
            trailing: const Icon(
              Icons.arrow_forward,
              // color: Color(0xFF565f89),
            ),
            onTap: () async {
              ViewFiles.openFile(file);
            },
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.arrow_back),
        onPressed: () {
          Navigator.pop(context);
        },
      ),
    );
  }
}
