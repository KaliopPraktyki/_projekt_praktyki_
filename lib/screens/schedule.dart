import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:table_calendar/table_calendar.dart';
import '../screens/event.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class Schedule extends StatefulWidget {
  @override
  State<Schedule> createState() => _ScheduleState();
  const Schedule({Key? key}) : super(key: key);

}

class _ScheduleState extends State<Schedule> {
  final user = FirebaseAuth.instance.currentUser!;

  late Map<DateTime, List<Event>> _selectedEvents;

  Map<DateTime, List<Event>> get selectedEvents => _selectedEvents;

  set selectedEvents(Map<DateTime, List<Event>> value) {
    _selectedEvents = value;
  }
  CalendarFormat format = CalendarFormat.month;
  DateTime selectedDay = DateTime.now();
  DateTime focusedDay = DateTime.now();

  final TextEditingController _eventController = TextEditingController();

  @override
  void initState() {
    selectedEvents = {};
    super.initState();
  }

  List<Event> _getEventsfromDay(DateTime date) {
    return selectedEvents[date] ?? [];
  }

  @override
  void dispose() {
    _eventController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
          child: Column(
            children: [
              TableCalendar(
                focusedDay: selectedDay,
                firstDay: DateTime(1990),
                lastDay: DateTime(2050),
                calendarFormat: format,
                onFormatChanged: (CalendarFormat _format) {
                  setState(() {
                    format = _format;
                  });
                },
                startingDayOfWeek: StartingDayOfWeek.sunday,
                daysOfWeekVisible: true,

                //Day Changed
                onDaySelected: (DateTime selectDay, DateTime focusDay) {
                  setState(() {
                    selectedDay = selectDay;
                    focusedDay = focusDay;
                  });
                  print(focusedDay);
                },
                selectedDayPredicate: (DateTime date) {
                  return isSameDay(selectedDay, date);
                },

                eventLoader: _getEventsfromDay,

                calendarStyle: CalendarStyle(
                  isTodayHighlighted: true,
                  selectedDecoration: BoxDecoration(
                    color: Theme.of(context).secondaryHeaderColor,
                    shape: BoxShape.rectangle,
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                  selectedTextStyle: const TextStyle(color: Colors.white),
                  todayDecoration: BoxDecoration(
                    color: Colors.blue,
                    shape: BoxShape.rectangle,
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                  defaultDecoration: BoxDecoration(
                    shape: BoxShape.rectangle,
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                  weekendDecoration: BoxDecoration(
                    shape: BoxShape.rectangle,
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                ),
                headerStyle: HeaderStyle(
                  formatButtonVisible: true,
                  titleCentered: true,
                  formatButtonShowsNext: false,
                  formatButtonDecoration: BoxDecoration(
                    color: Theme.of(context).secondaryHeaderColor,
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                  formatButtonTextStyle: const TextStyle(
                    color: Colors.white,
                  ),
                ),
              ),
              Text(
                AppLocalizations.of(context)!.events,
                  style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 22),
              ),
              ..._getEventsfromDay(selectedDay).map(
                    (Event event) => ListTile(
                  title: Text(
                    event.title,
                  ),
                ),
              ),
            ],
          ),
        ),
        floatingActionButton: FloatingActionButton.extended(
        onPressed: () => showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text(
          AppLocalizations.of(context)!.addevent,
        ),
        content: TextFormField(
          controller: _eventController,
        ),
        actions: [
          TextButton(
            child: const Text("Cancel"),
            onPressed: () => Navigator.pop(context),
          ),
          TextButton(
            child: const Text("Ok"),
            onPressed: () {
              if (_eventController.text.isEmpty) {
              } else {
                if (selectedEvents[selectedDay] != null) {
                  selectedEvents[selectedDay]?.add(
                    Event(title: _eventController.text),
                  );
                } else {
                  selectedEvents[selectedDay] = [
                    Event(title: _eventController.text)
                  ];
                }

              }
              Navigator.pop(context);
              _eventController.clear();
              setState((){});
              return;
            },
          ),
        ],
      ),
    ),
          label: Text(
            AppLocalizations.of(context)!.addevent,
            style: const TextStyle(
              color: Colors.white,
            ),
          ),
          icon: const Icon(
              color: Colors.white,
              Icons.add),
        ),
    );

  }
}