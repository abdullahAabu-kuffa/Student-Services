import 'dart:ffi';

import 'package:flutter/material.dart';

class TableData extends StatelessWidget {
  const TableData({
    super.key,
    this.rowMap,
    this.secRowMap,
  });

  final rowMap;
  final secRowMap;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title:
            Text("${rowMap[1]}", style: const TextStyle(color: Colors.black54)),
        centerTitle: true,
        backgroundColor: Colors.white,
        leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: const Icon(
              Icons.arrow_back,
              color: Colors.black54,
            )),
        elevation: 0,
      ),
      body: Center(
        child: ListView(
          children: [
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
            ], rows: [
              DataRow(cells: [
                DataCell(Text("${rowMap[2]}")),
                DataCell(Text("${secRowMap[2]}")),
                DataCell(Text("${secRowMap[3]}")),
              ]),
              DataRow(cells: [
                DataCell(Text("${rowMap[4]}")),
                DataCell(Text("${secRowMap[4]}")),
                DataCell(Text("${secRowMap[5]}")),
              ]),
              DataRow(cells: [
                DataCell(Text("${rowMap[6]}")),
                DataCell(Text("${secRowMap[6]}")),
                DataCell(Text("${secRowMap[7]}")),
              ]),
              DataRow(cells: [
                DataCell(Text("${rowMap[8]}")),
                DataCell(Text("${secRowMap[8]}")),
                DataCell(Text("${secRowMap[9]}")),
              ]),
              DataRow(cells: [
                DataCell(Text("${rowMap[10]}")),
                DataCell(Text("${secRowMap[10]}")),
                DataCell(Text("${secRowMap[11]}")),
              ]),
              DataRow(cells: [
                DataCell(Text("${rowMap[12]}")),
                DataCell(Text("${secRowMap[12]}")),
                DataCell(Text("${secRowMap[13]}")),
              ]),
              DataRow(cells: [
                DataCell(Text("${rowMap[14]}")),
                DataCell(Text("${secRowMap[14]}")),
                DataCell(Text("${secRowMap[15]}")),
              ]),
              DataRow(cells: [
                DataCell(Text("${rowMap[16]}")),
                DataCell(Text("${secRowMap[16]}")),
                DataCell(Text("${secRowMap[17]}")),
              ]),
              DataRow(cells: [
                DataCell(Text("${rowMap[18]}")),
                DataCell(Text("${secRowMap[18]}")),
                DataCell(Text("${secRowMap[19]}")),
              ]),
              DataRow(cells: [
                DataCell(Text("${rowMap[20]}")),
                DataCell(Text("${secRowMap[20]}")),
                DataCell(Text("${secRowMap[21]}")),
              ]),
            ])
          ],
        ),
      ),
    );
  }
}
