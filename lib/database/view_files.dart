import 'package:flutter/material.dart';
import 'package:flutter_custom_tabs/flutter_custom_tabs.dart';

// import 'package:url_launcher/url_launcher.dart';
// import 'package:url_launcher/url_launcher_string.dart';
// String? de;
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
        backgroundColor: Colors.white,
        body: ListView.builder(
          itemCount: files.length,
          itemBuilder: (context, index) {
            final file = files[index];
            final thumbnailLink = file.thumbnailLink;
            return ListTile(
              contentPadding:
                  const EdgeInsets.symmetric(vertical: 10.0, horizontal: 20.0),
              minLeadingWidth: 60,
              leading: SizedBox(
                width: 60.0,
                height: 60.0,
                child: Image(
                  image: NetworkImage(thumbnailLink ?? ''),
                  fit: BoxFit.cover,
                  errorBuilder: (BuildContext context, Object exception,
                      StackTrace? stackTrace) {
                    return Image.asset('images/default_thumbnail.jpeg',
                        fit: BoxFit.cover);
                  },
                ),
              ),
              title: Text(
                file.name,
                overflow: TextOverflow.ellipsis,
              ),
              trailing: const Icon(
                Icons.arrow_forward,
                color: Colors.black87,
              ),
              onTap: () async {
                ViewFiles.openFile(file);
              },
            );
          },
        ));
  }
}
