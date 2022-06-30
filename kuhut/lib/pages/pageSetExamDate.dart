// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:table_calendar/table_calendar.dart';
import 'package:kuhut/database_services/dataClass.dart';
import 'package:kuhut/database_services/db_crud.dart';
import 'package:kuhut/main.dart';

class pageSetExamDate extends StatefulWidget {
  const pageSetExamDate({Key? key}) : super(key: key);

  @override
  State<pageSetExamDate> createState() => _pageSetExamDateState();
}

class _pageSetExamDateState extends State<pageSetExamDate> {
  late Map<DateTime, List<Event>> selectedEvents;
  CalendarFormat format = CalendarFormat.month;
  DateTime selectedDay = DateTime.now();
  DateTime focusedDay = DateTime.now();
  String selectedDayFormatted = "";
  String jenjagDB = "";

  TextEditingController _eventController = TextEditingController();
  TextEditingController _jenjangController = TextEditingController();

  final db = FirebaseFirestore.instance;

  @override
  void initState() {
    selectedEvents = {};
    super.initState();
  }

  List<Event> _getEventsfromDay(DateTime date) {
    return selectedEvents[date] ?? [];
  }

  Stream<QuerySnapshot<Object?>> onSearch() {
    setState(() {});
    selectedDayFormatted = DateFormat('dd-MM-yyyy').format(focusedDay);
    return DatabaseTeacher.getDate(selectedDayFormatted);
  }

  @override
  void dispose() {
    _eventController.dispose();
    super.dispose();
  }

  int _jumlah = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Page Set Exam Date"),
      ),
      body: Column(
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
              selectedDayFormatted = DateFormat('dd-MM-yyyy').format(selectDay);
              print(selectedDayFormatted);
            },
            selectedDayPredicate: (DateTime date) {
              return isSameDay(selectedDay, date);
            },

            // eventLoader: _getEventsfromDay,

            //To style the Calendar
            calendarStyle: CalendarStyle(
              isTodayHighlighted: true,
              selectedDecoration: BoxDecoration(
                color: Colors.blue,
                shape: BoxShape.rectangle,
                borderRadius: BorderRadius.circular(5.0),
              ),
              selectedTextStyle: TextStyle(color: Colors.white),
              todayDecoration: BoxDecoration(
                color: Colors.purpleAccent,
                shape: BoxShape.rectangle,
                borderRadius: BorderRadius.circular(5.0),
              ),
              defaultDecoration: BoxDecoration(
                shape: BoxShape.rectangle,
                borderRadius: BorderRadius.circular(5.0),
              ),
              weekendDecoration: BoxDecoration(
                shape: BoxShape.rectangle,
                borderRadius: BorderRadius.circular(5.0),
              ),
            ),
            headerStyle: HeaderStyle(
              formatButtonVisible: true,
              titleCentered: true,
              formatButtonShowsNext: false,
              formatButtonDecoration: BoxDecoration(
                color: Colors.blue,
                borderRadius: BorderRadius.circular(5.0),
              ),
              formatButtonTextStyle: TextStyle(
                color: Colors.white,
              ),
            ),
          ),
          Expanded(
            child: StreamBuilder<QuerySnapshot>(
              stream: onSearch(),
              builder: (context, snapshot) {
                if (snapshot.hasError) {
                  return Text('ERROR');
                } else if (snapshot.hasData || snapshot.data != null) {
                  return ListView.separated(
                      shrinkWrap: true,
                      itemBuilder: ((context, index) {
                        DocumentSnapshot dsData = snapshot.data!.docs[index];
                        String lvJudul = dsData['title'];
                        String lvGuru = dsData['teacher'];
                        _jumlah = snapshot.data!.docs.length;
                        return ListTile(
                          // onTap: () {
                          //   final dtBaru = itemCatatan(
                          //       itemJudul: lvJudul, itemIsi: lvIsi + "n");
                          //   // Database.ubahData(item: dtBaru);
                          //   Navigator.push(
                          //       context,
                          //       MaterialPageRoute(
                          //           builder: (context) => detData(
                          //                 dataDet: dtBaru,
                          //               )));
                          // },
                          // onLongPress: () {
                          //   Database.hapusData(judulhapus: lvJudul);
                          // },
                          title: Text(lvJudul),
                          subtitle: Text(lvGuru),
                        );
                      }),
                      separatorBuilder: (context, index) =>
                          SizedBox(height: 8.0),
                      itemCount: snapshot.data!.docs.length);
                }
                return Center(
                  child: CircularProgressIndicator(
                    valueColor:
                        AlwaysStoppedAnimation<Color>(Colors.pinkAccent),
                  ),
                );
              },
            ),
          ),
          // ..._getEventsfromDay(selectedDay).map(
          //   (Event event) => ListTile(
          //     title: Text(
          //       event.title,
          //     ),
          //   ),
          // ),
        ],
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () => showDialog(
          context: context,
          builder: (context) => AlertDialog(
            title: Text("Add Event"),
            content: TextFormField(
              controller: _eventController,
            ),
            actions: [
              TextButton(
                child: Text("Cancel"),
                onPressed: () => Navigator.pop(context),
              ),
              TextButton(
                child: Text("Ok"),
                onPressed: () {
                  if (_eventController.text.isEmpty) {
                  } else {
                    if (selectedEvents[selectedDay] != null) {
                      String formattedDate =
                          DateFormat('dd-MM-yyyy').format(selectedDay);
                      // selectedEvents[selectedDay]?.add(
                      //   Event(
                      //       title: _eventController.text.toString(),
                      //       date: formattedDate),
                      // );
                      final data = Event(
                          title: _eventController.text,
                          date: formattedDate,
                          name: teacherName);
                      DatabaseTeacher.setDate(event: data);
                    } else {
                      String formattedDate =
                          DateFormat('dd-MM-yyyy').format(selectedDay);
                      // selectedEvents[selectedDay] = [
                      //   Event(title: _eventController.text, date: formattedDate)
                      // ];
                      final data = Event(
                          title: _eventController.text,
                          date: formattedDate,
                          name: teacherName);
                      DatabaseTeacher.setDate(event: data);
                    }
                  }
                  Navigator.pop(context);
                  _eventController.clear();
                  setState(() {});
                  // return;
                },
              ),
            ],
          ),
        ),
        label: Text("Add Event"),
        icon: Icon(Icons.add),
      ),
    );
  }
}
