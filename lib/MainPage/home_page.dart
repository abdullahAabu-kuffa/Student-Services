import 'package:flutter/material.dart';
import 'package:students_app/database/appointment_editor.dart';
import 'package:syncfusion_flutter_calendar/calendar.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);
  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final now = DateTime.now();
  late MeetingDataSource _dataSource;
  @override
  void initState() {
    super.initState();
    _dataSource = MeetingDataSource([]);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SfCalendar(
        showDatePickerButton: true,
        showNavigationArrow: true,
        view: CalendarView.week,
        dataSource: _dataSource,
        initialDisplayDate: DateTime(
            DateTime.now().year, DateTime.now().month, DateTime.now().day),
        onTap: (calendarTapDetails) {
          if (calendarTapDetails.appointments!.isNotEmpty &&
              calendarTapDetails.appointments != null) {
            // The user tapped on an appointment

            final dynamic occurrenceAppointment =
                calendarTapDetails.appointments![0];
            final Appointment? patternAppointment =
                _dataSource.getPatternAppointment(occurrenceAppointment, '')
                    as Appointment?;
            // print(appointment.recurrenceRule);
            // Do something with the tapped appointment, e.g. show a dialog
            showDialog(
              context: context,
              builder: (context) => AlertDialog(
                title: Text(patternAppointment!.subject),
                content: Text(patternAppointment.notes.toString()),
                actions: [
                  TextButton(
                    onPressed: () => Navigator.pop(context),
                    child: const Text('CANCEL'),
                  ),
                  TextButton(
                    onPressed: () {
                      _dataSource.appointments?.remove(patternAppointment);
                      _dataSource.notifyListeners(
                        CalendarDataSourceAction.remove,
                        [patternAppointment],
                      );
                      Navigator.pop(context);
                    },
                    child: const Text('DELETE'),
                  ),
                ],
              ),
            );
          }
        },
      ),
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.add),
        onPressed: () async {
          List<Appointment> appointments = await Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => const AppointmentEditor()),
          );
          setState(() {
            _dataSource.appointments?.addAll(appointments);
            _dataSource.notifyListeners(
              CalendarDataSourceAction.reset,
              [],
            );
          });
        },
      ),
    );
  }
}

List<Appointment> getAppointments(
  DateTime start,
  DateTime end,
  String name,
  int repeats,
  Color color,
  String notes,
) {
  // print(generateWeeklyRecurrenceRule(start.weekday, repeats));
  // print('Start time: $start, End time: $end,name: $name');
  List<Appointment> meetings = <Appointment>[];
  meetings.add(
    Appointment(
      startTime: start,
      endTime: end,
      subject: name,
      color: color,
      notes: notes,
      recurrenceRule: generateWeeklyRecurrenceRule(start.weekday, repeats),
    ),
  );
  return meetings;
}

class MeetingDataSource extends CalendarDataSource {
  MeetingDataSource(List<Appointment> source) {
    appointments = source;
  }
  Appointment getAppointment(int index) => appointments![index] as Appointment;
  @override
  DateTime getStartTime(int index) {
    return appointments![index].from;
  }

  @override
  DateTime getEndTime(int index) {
    return appointments![index].to;
  }

  @override
  Color getColor(int index) {
    return appointments![index].background;
  }

  @override
  String getEndTimeZone(int index) {
    return appointments![index].toZone;
  }

  @override
  List<DateTime> getRecurrenceExceptionDates(int index) {
    return appointments![index].exceptionDates;
  }

  @override
  String getRecurrenceRule(int index) {
    return appointments![index].recurrenceRule;
  }

  @override
  String getStartTimeZone(int index) {
    return appointments![index].fromZone;
  }

  @override
  String getSubject(int index) {
    return appointments![index].title;
  }

  @override
  bool isAllDay(int index) {
    return appointments![index].isAllDay;
  }
}

String generateWeeklyRecurrenceRule(int dayOfWeek, int numberOfWeeks) {
  String dayString;
  switch (dayOfWeek) {
    case 1:
      dayString = 'MO';
      break;
    case 2:
      dayString = 'TU';
      break;
    case 3:
      dayString = 'WE';
      break;
    case 4:
      dayString = 'TH';
      break;
    case 5:
      dayString = 'FR';
      break;
    case 6:
      dayString = 'SA';
      break;
    case 7:
      dayString = 'SU';
      break;
    default:
      throw ArgumentError('Invalid day of week');
  }
  // print('FREQ=WEEKLY;COUNT=$numberOfWeeks;BYDAY=$dayString');

  return 'FREQ=WEEKLY;COUNT=$numberOfWeeks;BYDAY=$dayString';
}
