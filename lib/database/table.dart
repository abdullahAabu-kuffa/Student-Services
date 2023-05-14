import 'package:flutter/material.dart';

class TableData extends StatefulWidget {
  const TableData({super.key});

  @override
  State<TableData> createState() => _TableData();
}

class _TableData extends State<TableData> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text("hi"),
        ),
        body: Center(
          child: ListView(
            children: [
              const SizedBox(
                height: 15,
              ),
              const Center(child: Text("ahmed badr abu-hussiba")),
              const SizedBox(
                height: 15,
              ),
              DataTable(columns: const [
                DataColumn(
                    label: Text(
                  "Subjects",
                  style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.w400,
                      color: Colors.lightBlue),
                )),
                DataColumn(
                    label: Text(
                  "GPA",
                  style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.w400,
                      color: Colors.lightBlue),
                )),
                DataColumn(
                    label: Text(
                  "degrees",
                  style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.w400,
                      color: Colors.lightBlue),
                ))
              ], rows: const [
                DataRow(cells: [
                  DataCell(Text("Data Science")),
                  DataCell(Text("3.1")),
                  DataCell(Text("77")),
                ]),
                DataRow(cells: [
                  DataCell(Text("Nural network")),
                  DataCell(Text("3.5")),
                  DataCell(Text("80")),
                ]),
                DataRow(cells: [
                  DataCell(Text("Microprocessing")),
                  DataCell(Text("3.5")),
                  DataCell(Text("80")),
                ]),
                DataRow(cells: [
                  DataCell(Text("Microprocessing")),
                  DataCell(Text("3.5")),
                  DataCell(Text("80")),
                ]),
                DataRow(cells: [
                  DataCell(Text("Microprocessing")),
                  DataCell(Text("3.5")),
                  DataCell(Text("80")),
                ]),
                DataRow(cells: [
                  DataCell(Text("Microprocessing")),
                  DataCell(Text("3.5")),
                  DataCell(Text("80")),
                ]),
                DataRow(cells: [
                  DataCell(Text("Microprocessing")),
                  DataCell(Text("3.5")),
                  DataCell(Text("80")),
                ]),
              ])
            ],
          ),
        ),
      ),
    );
  }
}
