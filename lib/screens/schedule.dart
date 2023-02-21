import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:table_calendar/table_calendar.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

//TODO: Firestore configuration

class Schedule extends StatefulWidget {
  @override
  State<Schedule> createState() => _ScheduleState();
  const Schedule({Key? key}) : super(key: key);

}

class _ScheduleState extends State<Schedule> {
  final user = FirebaseAuth.instance.currentUser!;

  CalendarFormat format = CalendarFormat.month;
  DateTime _focusedDay = DateTime.now();
  DateTime? _selectedDate;

  Map<String, List> selectedEvents = {};

  final _titleController = TextEditingController();
  final _descrController = TextEditingController();

  @override
  void initState() {
    selectedEvents = {};
    _selectedDate = _focusedDay;
    super.initState();
  }

   List _getEventsfromDay(date) {
    if (selectedEvents[DateFormat('yyyy-MM-dd').format(date)] != null) {
    return selectedEvents[DateFormat('yyyy-MM-dd').format(date)]!;
    } else {
     return selectedEvents[DateTime] ?? [];
   }
  }

  @override
  void dispose() {
    _titleController.dispose();
    _descrController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
          child: Column(
            children: [
              TableCalendar(
                focusedDay: _focusedDay,
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
                    _selectedDate = selectDay;
                    _focusedDay = focusDay;
                  });
                  print(_focusedDay);
                },
                selectedDayPredicate: (DateTime date) {
                  return isSameDay(_selectedDate, date);
                },

                eventLoader: _getEventsfromDay,

                calendarStyle: CalendarStyle(
                  isTodayHighlighted: true,
                  selectedDecoration: BoxDecoration(
                    color: Theme.of(context).secondaryHeaderColor,
                    shape: BoxShape.circle,
                  ),
                  selectedTextStyle: const TextStyle(color: Colors.white),
                  todayDecoration: BoxDecoration(
                    color: Colors.blue,
                    shape: BoxShape.circle,
                  ),
                  defaultDecoration: BoxDecoration(
                    shape: BoxShape.circle,
                  ),
                  weekendDecoration: BoxDecoration(
                    shape: BoxShape.circle,
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
                  style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
              ),
              ..._getEventsfromDay(_focusedDay).map(
                    (event) => ListTile(
                      leading: const Icon(
                        Icons.circle,
                      ),
                      title: Padding(
                        padding: const EdgeInsets.only(bottom: 8.0),
                        child: Text('Title:   ${event['eventTitle']}'),
                      ),
                      subtitle: Text('Description:   ${event['eventDescr']}'),
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
        content:Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          mainAxisSize: MainAxisSize.min,
          children: [
         TextField(
          controller: _titleController,
          decoration: const InputDecoration(
          labelText: 'Title',
        ),),
        TextField(
          controller: _descrController,
          decoration: const InputDecoration(
            labelText: 'Description',
          ),),
        ],
        ),
        actions: [
          TextButton(
            child: const Text("Cancel"),
            onPressed: () => Navigator.pop(context),
          ),
          TextButton(
            child: const Text("Add"),
            onPressed: () {
              if (_titleController.text.isEmpty &&
                  _descrController.text.isEmpty) {
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(
                    content: Text('Required title and description'),
                    duration: Duration(seconds: 2),
                  ),
                );
                //Navigator.pop(context);
                return;
              } else {

                print(_titleController.text);
                print(_descrController.text);

                setState(() {
                  if (selectedEvents[
                  DateFormat('yyyy-MM-dd').format(_selectedDate!)] !=
                      null) {
                    selectedEvents[
                    DateFormat('yyyy-MM-dd').format(_selectedDate!)]
                        ?.add({
                      "eventTitle": _titleController.text,
                      "eventDescr": _descrController.text,
                    });
                  } else {
                    selectedEvents[
                    DateFormat('yyyy-MM-dd').format(_selectedDate!)] = [
                      {
                        "eventTitle": _titleController.text,
                        "eventDescr": _descrController.text,
                      }
                    ];
                  }
                });
                Navigator.pop(context);
                setState(() {});
                return;
              }
            }
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