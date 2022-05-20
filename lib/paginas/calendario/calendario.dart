import 'package:calendar_agenda/calendar_agenda.dart';
import 'package:flutter/material.dart';

class Calendario extends StatefulWidget {
  Calendario({Key? key}) : super(key: key);

  @override
  State<Calendario> createState() => _CalendarioState();
}

class _CalendarioState extends State<Calendario> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("calendario "),
        ),
        body: CalendarAgenda(
          locale: 'en',
          weekDay: WeekDay.long,
          selectedDateColor: Colors.grey,
          calendarBackground: Colors.white,
          dateColor: Colors.white,
          selectedDayPosition: SelectedDayPosition.center,
          initialDate: DateTime.now(),
          firstDate: DateTime.now().subtract(Duration(days: 1)),
          lastDate: DateTime.now().add(Duration(days: 365)),
          onDateSelected: (date) {
            print(date);
          },
        ));
  }
}
