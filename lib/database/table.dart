import 'package:flutter/material.dart';
import 'package:tuple/tuple.dart';

class TableData extends StatelessWidget {
  const TableData({
    super.key,
  });
  @override
  Widget build(BuildContext context) {
    final Map<String, dynamic> args =
        ModalRoute.of(context)!.settings.arguments as Map<String, dynamic>;

    // Extract the data from the arguments
    final Tuple2<List<String>, List<String>> tuple = args['data'];
    final rowMap = tuple.item1;
    final secRowMap = tuple.item2;
    // print(rowMap);
    // print(secRowMap);
    return Scaffold(
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: ListView(
            children: [
              Center(
                child: Text(
                  rowMap[1],
                  style: const TextStyle(
                    fontSize: 25.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              const SizedBox(
                height: 15,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: const [
                  Text(
                    "س.الفصل ",
                    style: TextStyle(
                      fontSize: 20.0,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                  Text(
                    "المعدل الفصلي ",
                    style: TextStyle(
                      fontSize: 20.0,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                  Text(
                    "الساعات المتبقيه ",
                    style: TextStyle(
                      fontSize: 20.0,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 15,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Text(
                    rowMap[24],
                    style: const TextStyle(
                      fontSize: 20.0,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                  Text(
                    rowMap[26],
                    style: const TextStyle(
                      fontSize: 20.0,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                  Text(
                    rowMap[27],
                    style: const TextStyle(
                      fontSize: 20.0,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 15,
              ),
              DataTable(
                  border: TableBorder.all(
                    borderRadius: BorderRadius.circular(20),
                  ),
                  columns: const [
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
                      "Grade",
                      style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.w400,
                          color: Colors.lightBlue),
                    )),
                    DataColumn(
                        label: Text(
                      "Gpa",
                      style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.w400,
                          color: Colors.lightBlue),
                    )),
                  ],
                  rows: [
                    DataRow(cells: [
                      DataCell(Text(rowMap[2])),
                      DataCell(Text(secRowMap[3])),
                      DataCell(Text(secRowMap[2])),
                    ]),
                    DataRow(cells: [
                      DataCell(Text(rowMap[4])),
                      DataCell(Text(secRowMap[5])),
                      DataCell(Text(secRowMap[4])),
                    ]),
                    DataRow(cells: [
                      DataCell(Text(rowMap[6])),
                      DataCell(Text(secRowMap[7])),
                      DataCell(Text(secRowMap[6])),
                    ]),
                    DataRow(cells: [
                      DataCell(Text(rowMap[8])),
                      DataCell(Text(secRowMap[9])),
                      DataCell(Text(secRowMap[8])),
                    ]),
                    DataRow(cells: [
                      DataCell(Text(rowMap[10])),
                      DataCell(Text(secRowMap[11])),
                      DataCell(Text(secRowMap[10])),
                    ]),
                    DataRow(cells: [
                      DataCell(Text(rowMap[12])),
                      DataCell(Text(secRowMap[13])),
                      DataCell(Text(secRowMap[12])),
                    ]),
                    DataRow(cells: [
                      DataCell(Text(rowMap[14])),
                      DataCell(Text(secRowMap[15])),
                      DataCell(Text(secRowMap[14])),
                    ]),
                    DataRow(cells: [
                      DataCell(Text(rowMap[16])),
                      DataCell(Text(secRowMap[17])),
                      DataCell(Text(secRowMap[16])),
                    ]),
                    DataRow(cells: [
                      DataCell(Text(rowMap[18])),
                      DataCell(Text(secRowMap[19])),
                      DataCell(Text(secRowMap[18])),
                    ]),
                    DataRow(cells: [
                      DataCell(Text(rowMap[20])),
                      DataCell(Text(secRowMap[21])),
                      DataCell(Text(secRowMap[20])),
                    ]),
                    DataRow(cells: [
                      DataCell(Text(rowMap[22])),
                      DataCell(Text(secRowMap[23])),
                      DataCell(Text(secRowMap[22])),
                    ]),
                  ]),
            ],
          ),
        ),
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
