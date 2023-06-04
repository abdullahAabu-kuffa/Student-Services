import 'package:flutter/material.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
// import 'package:students_app/Departments/ChemistryPage.dart';
import 'package:students_app/database/user_drive_api.dart';
import 'package:students_app/database/view_files.dart';

class SubjectsOfChemistery extends StatefulWidget {
  const SubjectsOfChemistery({super.key});

  @override
  State<SubjectsOfChemistery> createState() => _SubjectsOfChemisteryState();
}

class _SubjectsOfChemisteryState extends State<SubjectsOfChemistery> {
  bool isgettingfiles = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: ModalProgressHUD(
        opacity: 0.0,
        inAsyncCall: isgettingfiles,
        child: ListView(
          padding: const EdgeInsets.all(20),
          children: [
            const SizedBox(
              height: 20,
            ),
            const Text(
              "CHOOSE THE SUBJECT: ",
              textAlign: TextAlign.center,
              style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  fontStyle: FontStyle.italic,
                  color: Colors.blue),
            ),
            const SizedBox(
              height: 30,
            ),
            InkWell(
              onTap: () async {
                setState(() {
                    isgettingfiles = true;
                  });
               await onPressed(context,'1yhr2bkwDs617rvLm3Ox_iNEY-zjgrFzp');
               setState(() {
                    isgettingfiles = false;
                  });
              },
              child: Container(
                margin: const EdgeInsets.all(10),
                height: 200,
                width: double.infinity,
                decoration: const BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(8)),
                  image: DecorationImage(
                      image: AssetImage("assets/g1.png"),
                      fit: BoxFit.cover,
                      opacity: 0.7),
                ),
                child: Row(
                  children: const <Widget>[
                    Expanded(
                      child: Text(
                        'General Chemistry',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: 25,
                          fontWeight: FontWeight.bold,
                          color: Colors.black,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            InkWell(
              onTap: () async {
                setState(() {
                    isgettingfiles = true;
                  });
                await onPressed(context,'1VsMVJxKOPhLDrgu_fGfoTdZEn2CBdCeQ');
                setState(() {
                    isgettingfiles = false;
                  });
              },
              child: Container(
                margin: const EdgeInsets.all(10),
                height: 200,
                width: double.infinity,
                decoration: const BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(8)),
                  image: DecorationImage(
                      image: AssetImage("assets/A1.png"),
                      fit: BoxFit.cover,
                      opacity: 0.7),
                ),
                child: Row(
                  children: const <Widget>[
                    Expanded(
                      child: Text(
                        'Analytical Chemistryt',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: 25,
                          fontWeight: FontWeight.bold,
                          color: Colors.black,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            InkWell(
              onTap: () async {
                setState(() {
                    isgettingfiles = true;
                  });
                await onPressed(context,'1tsVBvFjj9JPVvC0Iyc-2uZXyVBwKSEtz');
                setState(() {
                    isgettingfiles = false;
                  });
              },
              child: Container(
                margin: const EdgeInsets.all(10),
                height: 200,
                width: double.infinity,
                decoration: const BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(8)),
                  image: DecorationImage(
                      image: AssetImage("assets/i1.png"),
                      fit: BoxFit.cover,
                      opacity: 0.7),
                ),
                child: Row(
                  children: const <Widget>[
                    Expanded(
                      child: Text(
                        'Inorganic Chemistry',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: 25,
                          fontWeight: FontWeight.bold,
                          color: Colors.black,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            InkWell(
              onTap: () async {
                setState(() {
                    isgettingfiles = true;
                  });
                await onPressed(context,'1cV6z2sebUTh5dDpnqoy6Q-dmKtwZ5Sik');
                setState(() {
                    isgettingfiles = false;
                  });
              },
              child: Container(
                margin: const EdgeInsets.all(10),
                height: 200,
                width: double.infinity,
                decoration: const BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(8)),
                  image: DecorationImage(
                      image: AssetImage("assets/o1.png"),
                      fit: BoxFit.cover,
                      opacity: 0.7),
                ),
                child: Row(
                  children: const <Widget>[
                    Expanded(
                      child: Text(
                        'Organic Chemistry',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: 25,
                          fontWeight: FontWeight.bold,
                          color: Colors.black,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  static Future onPressed(BuildContext context,String id) async {
    try {
      folderId = id;
      await updatefiles(folderId!);
      // ignore: use_build_context_synchronously
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (BuildContext context) {
            return ViewFiles(files: files);
          },
        ),
      );
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
        content: Text('Not Found'),
        backgroundColor: Colors.red,
      ));
    }
  }
}
