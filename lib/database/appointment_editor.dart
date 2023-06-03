import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_calendar/calendar.dart';
import '../MainPage/home_page.dart';
import 'package:flutter_colorpicker/flutter_colorpicker.dart';

class AppointmentEditor extends StatefulWidget {
  const AppointmentEditor({super.key});

  @override
  State<AppointmentEditor> createState() => _AppointmentEditorState();
}

class _AppointmentEditorState extends State<AppointmentEditor> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  late String _name = '';
  late String _notes = '';
  late int _repeats = 1;
  late Color _color = Colors.blue;
  TextEditingController nameController = TextEditingController();
  TextEditingController notesController = TextEditingController();
  TextEditingController numberController = TextEditingController();
  late DateTime _start = DateTime.now();

  late DateTime _end = DateTime.now().add(const Duration(hours: 2));

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: SingleChildScrollView(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                TextFormField(
                  autofocus: false,
                  decoration: const InputDecoration(labelText: 'Name'),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter a name';
                    }
                    return null;
                  },
                  controller: nameController,
                  onSaved: (value) {
                    _name = nameController.text.trim();
                  },
                ),
                const SizedBox(height: 16.0),
                ListTile(
                  title: Text("${_start.year}/${_start.month}/${_start.day}"),
                  trailing: ElevatedButton(
                    onPressed: () async {
                      final start = await pickDate(_start);

                      if (start == null) return;

                      final newStart = DateTime(
                        start.year,
                        start.month,
                        start.day,
                        _start.hour,
                        _start.minute,
                      );
                      if (newStart.isAfter(_end)) {
                        _end = DateTime(
                          newStart.year,
                          newStart.month,
                          newStart.day,
                          _start.add(const Duration(hours: 2)).hour,
                          _start.minute,
                        );
                      }
                      setState(() {
                        _start = newStart;
                      });
                    },
                    child: const Text("pick a date"),
                  ),
                ),
                const SizedBox(height: 16.0),
                ListTile(
                  title: Text(
                      "${_start.hour.toString()}:${_start.minute.toString()}"),
                  trailing: ElevatedButton(
                    onPressed: () async {
                      final time = await pickTime(_start);
                      if (time == null) return;
                      final newStart = DateTime(
                        _start.year,
                        _start.month,
                        _start.day,
                        time.hour,
                        time.minute,
                      );
                      setState(() {
                        _start = newStart;
                      });
                    },
                    child: const Text("From"),
                  ),
                ),
                const SizedBox(height: 16.0),
                ListTile(
                  title: Text("${_end.year}/${_end.month}/${_end.day}"),
                  trailing: ElevatedButton(
                    onPressed: () async {
                      final end = await pickDate(_end, firstDate: _start);
                      if (end == null) return;
                      final newend = DateTime(
                        end.year,
                        end.month,
                        end.day,
                        _end.hour,
                        _end.minute,
                      );
                      setState(() {
                        _end = newend;
                      });
                    },
                    child: const Text("pick a date"),
                  ),
                ),
                const SizedBox(height: 16.0),
                ListTile(
                  title:
                      Text("${_end.hour.toString()}:${_end.minute.toString()}"),
                  trailing: ElevatedButton(
                    onPressed: () async {
                      final time = await pickTime(_end);
                      if (time == null) return;
                      final newEnd = DateTime(
                        _end.year,
                        _end.month,
                        _end.day,
                        time.hour,
                        time.minute,
                      );
                      setState(() {
                        _end = newEnd;
                      });
                    },
                    child: const Text("To"),
                  ),
                ),
                const SizedBox(height: 16.0),
                TextFormField(
                  autofocus: false,
                  decoration:
                      const InputDecoration(labelText: 'number of repeats'),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter a number';
                    }
                    return null;
                  },
                  controller: numberController,
                  onSaved: (value) {
                    _repeats = int.parse(numberController.text.trim());
                  },
                ),
                const SizedBox(height: 16.0),
                TextFormField(
                  autofocus: false,
                  decoration: const InputDecoration(labelText: 'notes'),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter a notes';
                    }
                    return null;
                  },
                  controller: notesController,
                  onSaved: (value) {
                    _notes = notesController.text.trim();
                  },
                ),
                ListTile(
                  title: const Text("Color"),
                  trailing: ElevatedButton(
                    onPressed: () {
                      showDialog(
                        context: context,
                        builder: (BuildContext context) {
                          return AlertDialog(
                            title: const Text('Pick a color!'),
                            content: SingleChildScrollView(
                              child: ColorPicker(
                                pickerColor: _color,
                                onColorChanged: (color) {
                                  setState(() {
                                    _color = color;
                                  });
                                },
                                // showLabel: true,
                              ),
                            ),
                            actions: <Widget>[
                              TextButton(
                                child: const Text('OK'),
                                onPressed: () {
                                  Navigator.of(context).pop();
                                },
                              ),
                            ],
                          );
                        },
                      );
                    },
                    style: ButtonStyle(
                        backgroundColor: MaterialStatePropertyAll(_color)),
                    child: Container(
                      width: 30,
                      height: 30,
                      // color: _color,
                      decoration: BoxDecoration(
                        color: _color,
                        shape: BoxShape.circle,
                        // border: Border.all(color: Colors.black),
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 16.0),
                Material(
                    elevation: 7,
                    borderRadius: BorderRadius.circular(15),
                    color: Colors.blue,
                    child: MaterialButton(
                      minWidth: 250,
                      onPressed: () async {
                        final isValid = _formKey.currentState!.validate();
                        if (isValid) {
                          _name = nameController.text.trim();
                          _repeats = int.parse(numberController.text.trim());
                          _notes = notesController.text.trim();
                          List<Appointment> meetings = getAppointments(
                              _start, _end, _name, _repeats, _color, _notes);
                          Navigator.of(context).pop(meetings);
                        }
                      },
                      child: const Text("save"),
                    ),
                  ),
                
              ],
            ),
          ),
        ),
      ),
    );
  }

  Future<DateTime?> pickDate(DateTime date, {DateTime? firstDate}) =>
      showDatePicker(
        context: context,
        initialDate: date,
        firstDate: firstDate ?? DateTime(2015, 8),
        lastDate: DateTime(2100),
      );
  Future<TimeOfDay?> pickTime(DateTime date) => showTimePicker(
        context: context,
        initialTime: TimeOfDay(
          hour: date.hour,
          minute: date.minute,
        ),
      );
  // void _showDateTimePicker(bool isStart) async {
  //   final selectedDate = await showDatePicker(
  //     context: context,
  //     initialDate: DateTime.now(),
  //     firstDate: DateTime.now(),
  //     lastDate: DateTime(2100),
  //   );

  //   if (selectedDate != null) {
  //     final selectedTime = await showTimePicker(
  //       context: context,
  //       initialTime: const TimeOfDay(hour: 8, minute: 0),
  //     );

  //     if (selectedTime != null) {
  //       final selectedDateTime = DateTime(
  //         selectedDate.year,
  //         selectedDate.month,
  //         selectedDate.day,
  //         selectedTime.hour,
  //         selectedTime.minute,
  //       );

  //       if (isStart) {
  //         setState(() {
  //           _selectedStartDate = selectedDateTime;
  //           _selectedStartTime = selectedTime;
  //         });
  //       } else {
  //         setState(() {
  //           _selectedEndDate = selectedDateTime;
  //           _selectedEndTime = selectedTime;
  //         });
  //       }
  //     }
  //   }
  // }
}
