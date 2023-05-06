// ignore_for_file: avoid_init_to_null

import 'package:flutter/material.dart';
import 'package:dropdown_search/dropdown_search.dart';
import 'package:students_app/Auth/buttonOfLogIn&SignUp.dart';

class SearchPage extends StatefulWidget {
  const SearchPage({super.key});

  @override
  State<SearchPage> createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  var selectedBatch = null, selectedYear = null, selectedSemester = null;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Center(
              child: Text(
            'Search about your GPA',
            style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
          )),
          const SizedBox(height: 15),
          SizedBox(
            width: 300,
            child: DropdownSearch<String>(
              popupProps: PopupProps.menu(
                showSelectedItems: true,
                disabledItemFn: (String s) => s.startsWith('I'),
              ),
              items: const ["2019", "2020", "2021", '2022'],
              dropdownDecoratorProps: const DropDownDecoratorProps(
                dropdownSearchDecoration: InputDecoration(
                  labelText: "Choose Batch",
                ),
              ),
              onChanged: ((value) {}),
              selectedItem: selectedBatch,
            ),
          ),
          const SizedBox(height: 20),
          SizedBox(
            width: 300,
            child: DropdownSearch<String>(
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
              onChanged: ((value) {}),
              selectedItem: selectedSemester,
            ),
          ),
          const SizedBox(height: 25),
          SizedBox(
            width: 300,
            child: TextFormField(
              //style: const TextStyle(color: Colors.white),
              onChanged: (value) {},
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(
                hintText: 'Enter your ID',
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
                    borderSide: BorderSide(color: Colors.black54, width: 1.5)),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(10)),
                  borderSide: BorderSide(color: Colors.blue, width: 1.5),
                ),
              ),
            ),
          ),
          const SizedBox(height: 25),
          ButtonOfLogInSignUp(
            onPressed: () {},
            title: 'Search',
          )
        ],
      ),
    );
  }
}
