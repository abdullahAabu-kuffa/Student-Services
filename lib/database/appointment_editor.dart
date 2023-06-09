import 'dart:ffi';
import 'dart:ui' as ui;

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:syncfusion_flutter_calendar/calendar.dart';
import '../MainPage/home_page.dart';
import 'package:flutter_colorpicker/flutter_colorpicker.dart';

class AppointmentEditor extends StatefulWidget {
  final Appointment? appointment;
  const AppointmentEditor({super.key, this.appointment});

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
  Void? initState() {
    super.initState();
    if (widget.appointment == null) {
      _start = DateTime.now();
      _end = DateTime.now().add(const Duration(hours: 2));
      _color = Colors.blue;
      _repeats = 1;
      _notes = '';
      _name = '';
    } else {
      final appointment = widget.appointment;
      _start = appointment!.startTime;
      _end = appointment.endTime;
      _color = appointment.color;
      String? recurrenceRule = appointment.recurrenceRule;
      int countIndex = recurrenceRule!.indexOf('COUNT=') + 'COUNT='.length;
      int semicolonIndex = recurrenceRule.indexOf(';', countIndex);
      numberController.text =
          recurrenceRule.substring(countIndex, semicolonIndex);
      notesController.text = appointment.notes!;
      nameController.text = appointment.subject;
    }
    return null;
  }

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
                const SizedBox(height: 35.0),
                TextFormField(
                  autofocus: false,
                  decoration: const InputDecoration(
                      border: OutlineInputBorder(), labelText: 'Name'),
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
                    style: ButtonStyle(
                        minimumSize:
                            MaterialStateProperty.all(const ui.Size(100, 40))),
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
                      final newEnd = DateTime(
                        start.year,
                        start.month,
                        start.day,
                        _start.add(const Duration(hours: 2)).hour,
                        _start.minute,
                      );
                      setState(() {
                        _start = newStart;
                        _end = newEnd;
                      });
                    },
                    child: const Text("pick a date"),
                  ),
                ),
                const SizedBox(height: 16.0),
                ListTile(
                  title: Text(DateFormat('h:mm a').format(_start)),
                  trailing: ElevatedButton(
                    style: ButtonStyle(
                        minimumSize:
                            MaterialStateProperty.all(const ui.Size(100, 40))),
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
                      if (newStart.isAfter(_end)) {
                        _end = DateTime(
                          newStart.year,
                          newStart.month,
                          newStart.day,
                          newStart.add(const Duration(hours: 2)).hour,
                          newStart.minute,
                        );
                      } else if (newStart.isBefore(_end)) {
                        _end = DateTime(
                          newStart.year,
                          newStart.month,
                          newStart.day,
                          newStart.add(const Duration(hours: 2)).hour,
                          newStart.minute,
                        );
                      }
                      setState(() {
                        _start = newStart;
                      });
                    },
                    child: const Text("From"),
                  ),
                ),
                const SizedBox(height: 16.0),
                ListTile(
                  title: Text(DateFormat('h:mm a').format(_end)),
                  trailing: ElevatedButton(
                    style: ButtonStyle(
                        minimumSize:
                            MaterialStateProperty.all(const ui.Size(100, 40))),
                    onPressed: () async {
                      final time = await pickTime(_end);
                      if (time == null) return;
                      var newEnd = DateTime(
                        _end.year,
                        _end.month,
                        _end.day,
                        time.hour,
                        time.minute,
                      );
                      if (newEnd.isBefore(_start)) {
                        newEnd = DateTime(
                          _end.year,
                          _end.month,
                          _end.day,
                          _start.add(const Duration(hours: 2)).hour,
                          _start.minute,
                        );
                      }
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
                  keyboardType: TextInputType.number,
                  decoration: const InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: 'number of repeats'),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter a number';
                    } else if (int.parse(value) == 0) {
                      return 'Please enter a number > 0 ';
                    } else if (int.parse(value) > 100) {
                      return 'Please enter a number < 100 ';
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
                  decoration: const InputDecoration(
                      border: OutlineInputBorder(), labelText: 'notes'),
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
                const SizedBox(height: 16.0),
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
                        minimumSize:
                            MaterialStateProperty.all(const ui.Size(100, 40)),
                        backgroundColor: MaterialStatePropertyAll(_color)),
                    child: null,
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
                        Appointment appointment = getAppointment(
                            _start, _end, _name, _repeats, _color, _notes);
                        Navigator.of(context).pop(appointment);
                      }
                    },
                    child: const Text(
                      "save",
                      style: TextStyle(color: Colors.white),
                    ),
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
}
