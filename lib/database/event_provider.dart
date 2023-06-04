import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_calendar/calendar.dart';

class EventProvider extends ChangeNotifier{
  final List<Appointment> _meetings=[];
  List<Appointment> get meetings=>_meetings;
  
}