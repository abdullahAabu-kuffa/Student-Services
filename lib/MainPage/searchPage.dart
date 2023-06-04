// ignore_for_file: avoid_init_to_null, avoid_print, file_names, use_build_context_synchronously
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import 'package:students_app/database/table.dart';
import 'package:tuple/tuple.dart';
import 'package:flutter/material.dart';
import 'package:dropdown_search/dropdown_search.dart';
import 'package:students_app/Auth/buttonOfLogIn&SignUp.dart';
import 'package:students_app/database/user_sheets_api.dart';

class SearchPage extends StatefulWidget {
  const SearchPage({super.key});
  @override
  State<SearchPage> createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        initialRoute: '/',
        routes: {
          '/': (context) => const GradePage(),
          '/table': (context) => const TableData(),
        });
  }
}

class GradePage extends StatefulWidget {
  const GradePage({super.key});

  @override
  State<GradePage> createState() => _GradePageState();
}

class _GradePageState extends State<GradePage> {
  final formKey = GlobalKey<FormState>();
  TextEditingController idController = TextEditingController();
  var selectedYear = null,
      selectedSemester = null,
      term = null,
      sheettitle = null;
  bool isSearching = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: Colors.white,
      body: ModalProgressHUD(
        opacity: 0.0,
        inAsyncCall: isSearching,
        dismissible: true,
        child: Form(
          key: formKey,
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const SizedBox(height: 80),
                const Center(
                    child: Text(
                  'Search for your grade.',
                  style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
                )),
                const SizedBox(height: 15),
                SizedBox(
                  width: 300,
                  child: DropdownSearch<String>(
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Select a year';
                      }
                      return null;
                    },
                    popupProps: PopupProps.menu(
                      showSelectedItems: true,
                      disabledItemFn: (String s) => s.startsWith('I'),
                    ),
                    items: const [
                      "2023/2022",
                      "2022/2021",
                      "2021/2020",
                      "2020/2019"
                    ],
                    dropdownDecoratorProps: const DropDownDecoratorProps(
                      dropdownSearchDecoration: InputDecoration(
                        labelText: "Choose Year",
                      ),
                    ),
                    onChanged: itemSelectionChangedYear,
                    // selectedItem: selectedYear,
                  ),
                ),
                const SizedBox(height: 20),
                SizedBox(
                  width: 300,
                  child: DropdownSearch<String>(
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Select a Semester';
                      }
                      return null;
                    },
                    popupProps: PopupProps.menu(
                      showSelectedItems: true,
                      disabledItemFn: (String s) => s.startsWith('I'),
                    ),
                    items: const [
                      "First Semester",
                      "Second Semester",
                      "Summer Semester",
                    ],
                    dropdownDecoratorProps: const DropDownDecoratorProps(
                      dropdownSearchDecoration: InputDecoration(
                        labelText: "Choose Semester",
                      ),
                    ),
                    onChanged: itemSelectionChangedSemester,
                    // selectedItem: selectedSemester,
                  ),
                ),
                const SizedBox(height: 25),
                SizedBox(
                  width: 300,
                  child: TextFormField(
                    //style: const TextStyle(color: Colors.white),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter your ID';
                      }
                      return null;
                    },
                    controller: idController,
                    onChanged: (value) {},
                    keyboardType: TextInputType.number,
                    decoration: const InputDecoration(
                      // hintText: 'Enter your ID',
                      labelText: 'Enter Your ID',
                      prefixIcon: Icon(
                        Icons.search,
                        color: Colors.black54,
                      ),
                      fillColor: Colors.white,
                      filled: true,
                      contentPadding:
                          EdgeInsets.symmetric(vertical: 10, horizontal: 20),
                      enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(10)),
                          borderSide:
                              BorderSide(color: Colors.black54, width: 1.5)),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(10)),
                        borderSide: BorderSide(color: Colors.blue, width: 1.5),
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 25),
                ButtonOfLogInSignUp(
                  onPressed: () async {
                    final isValid = formKey.currentState!.validate();
                    if (isValid) {
                      setState(() {
                      isSearching = true;
                    });
                    try {
                      getSheetTitle(selectedSemester, selectedYear);
                      print(sheettitle);
                      final tuple = await retrieveUserByKey();
                      Navigator.of(context).pushNamed(
                        '/table',
                        arguments: {
                          'data': tuple,
                          // 'id': rowMap,
                          // 'title': secRowMap,
                        },
                      );
                    } catch (e) {
                      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                        content: Text('Not Found'),
                        backgroundColor: Colors.red,
                      ));
                    }
                    setState(() {
                      isSearching = false;
                    });
                    }
                    
                  },
                  title: 'Search',
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

  void itemSelectionChangedYear(String? s) {
    selectedYear = s;
  }

  void itemSelectionChangedSemester(String? s) {
    selectedSemester = s;
  }

  Future getSheetTitle(String semester, String year) async {
    if (semester == "First Semester") {
      term = "_1";
    } else if (semester == "Second Semester") {
      term = "_2";
    } else {
      term = "_0";
    }
    sheettitle = year + term;
    return sheettitle;
  }

  retrieveUserByKey() async {
    await UserSheetsApi.init(sheettitle);
    String id = idController.text.trim();
    final ids = await sheet!.values.column(1);
    final rowIndex = ids.indexOf(id) + 1;
    // print(rowIndex);
    if (sheet == null) return null;
    final rowMap = await sheet!.values.row(rowIndex);
    final secrowMap = await sheet!.values.row(rowIndex + 1);
    // Map<String, String>? secrowMap = await sheet!.values.map.row(rowIndex+1,fromColumn: 1,length:19);
    // print(rowMap[1]);
    // print(secrowMap[3]);
    return Tuple2(rowMap, secrowMap);
  }
}
