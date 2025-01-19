// import 'package:flutter/material.dart';
// import 'package:table_calendar/table_calendar.dart';
// import '../models/exam.dart';
//
// class CalendarScreen extends StatefulWidget {
//   const CalendarScreen({Key? key}) : super(key: key);
//
//   @override
//   State<CalendarScreen> createState() => _CalendarScreenState();
// }
//
// class _CalendarScreenState extends State<CalendarScreen> {
//   CalendarFormat _calendarFormat = CalendarFormat.month;
//   DateTime _focusedDay = DateTime.now();
//   DateTime? _selectedDay;
//
//   // Sample Exam Data (Replace with your data source)
//   List<Exam> exams = [
//     Exam(
//         subject: 'Латински јазик',
//         dateTime: DateTime(2025, 1, 19, 10, 00),
//         location: "LatLng(37.4223, -122.0848)"),
//     Exam(
//         subject: 'Програмирање на видео игри',
//         dateTime: DateTime(2025, 1, 19, 14, 00),
//         location: "LatLng(37.3346, -122.009)"),
//     Exam(
//         subject: '',
//         dateTime: DateTime(2025, 1, 19, 14, 00),
//         location: "LatLng(37.3346, -122.009)"),
//     Exam(subject: 'Another Exam',
//         dateTime: DateTime(2025, 1, 23, 11, 00),
//         location: "LatLng(37.3346, -122.009)"),
//   ];
//
//   List<Exam> _getExamsForDay(DateTime day) {
//     return exams.where((exam) => isSameDay(exam.dateTime, day)).toList();
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text('Распоред на полагање'),
//       ),
//       body: TableCalendar(
//         firstDay: DateTime.utc(2010, 10, 16),
//         lastDay: DateTime.utc(2030, 3, 14),
//         focusedDay: _focusedDay,
//         calendarFormat: _calendarFormat,
//         selectedDayPredicate: (day) {
//           return isSameDay(_selectedDay, day);
//         },
//         onDaySelected: (selectedDay, focusedDay) {
//           if (!isSameDay(_selectedDay, selectedDay)) {
//             setState(() {
//               _selectedDay = selectedDay;
//               _focusedDay = focusedDay;
//             });
//           }
//         },
//         onFormatChanged: (format) {
//           if (_calendarFormat != format) {
//             setState(() {
//               _calendarFormat = format;
//             });
//           }
//         },
//         onPageChanged: (focusedDay) {
//           _focusedDay = focusedDay;
//         },
//         eventLoader: _getExamsForDay,
//         calendarBuilders: CalendarBuilders(
//           markerBuilder: (context, date, events) {
//             if (events.isNotEmpty) {
//               return Positioned(
//                 bottom: 1, // Adjust position as needed
//                 child: Container(
//                   decoration: const BoxDecoration(
//                     shape: BoxShape.circle,
//                     color: Colors.red, // Customize marker color
//                   ),
//                   width: 7.0,
//                   height: 7.0,
//                 ),
//               );
//             }
//             return null;
//           },
//         ),
//       ),
//       bottomSheet: _selectedDay != null
//           ? Container(
//         padding: const EdgeInsets.all(16),
//         child: Column(
//           mainAxisSize: MainAxisSize.min,
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             Text(
//               'Exams on ${_selectedDay!.day}/${_selectedDay!.month}/${_selectedDay!.year}',
//               style: const TextStyle(fontWeight: FontWeight.bold),
//             ),
//             Column(
//               children: _getExamsForDay(_selectedDay!).map((exam) {
//                 return ListTile(
//                   title: Text(exam.subject),
//                   subtitle: Text('${exam.dateTime.hour}:${exam.dateTime.minute.toString().padLeft(2, '0')} ${exam.location}'),
//                 );
//               }).toList(),
//             ),
//           ],
//         ),
//       )
//           : null,
//     );
//   }
// }


//maps erros
import 'package:flutter/material.dart';
import 'package:table_calendar/table_calendar.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import '../models/exam.dart';
import 'map_screen.dart';

class CalendarScreen extends StatefulWidget {
  const CalendarScreen({Key? key}) : super(key: key);

  @override
  State<CalendarScreen> createState() => _CalendarScreenState();
}

class _CalendarScreenState extends State<CalendarScreen> {
  CalendarFormat _calendarFormat = CalendarFormat.month;
  DateTime _focusedDay = DateTime.now();
  DateTime? _selectedDay;

  List<Exam> exams = [
    Exam(
      subject: 'Електротехника',
      dateTime: DateTime(2025, 1, 19, 10, 00),
      location: LatLng(42.00437734905961, 21.409342165150097),
    ),
    Exam(
      subject: 'ИНССИОК',
      dateTime: DateTime(2025, 1, 19, 14, 00),
      location: LatLng(42.00437734905961, 21.409342165150097),
    ),
    Exam(
      subject: 'Англиски јазик',
      dateTime: DateTime(2025, 1, 19, 14, 00),
      location: LatLng(42.00437734905961, 21.409342165150097),
    ),
    Exam(
      subject: 'Програмирање на видео игри',
      dateTime: DateTime(2025, 1, 23, 11, 00),
      location: LatLng(37.7749, -122.4194),
    ),
  ];

  List<Exam> _getExamsForDay(DateTime day) {
    return exams.where((exam) => isSameDay(exam.dateTime, day)).toList();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: TableCalendar(
        firstDay: DateTime.utc(2010, 10, 16),
        lastDay: DateTime.utc(2030, 3, 14),
        focusedDay: _focusedDay,
        calendarFormat: _calendarFormat,
        selectedDayPredicate: (day) {
          return isSameDay(_selectedDay, day);
        },
        onDaySelected: (selectedDay, focusedDay) {
          if (!isSameDay(_selectedDay, selectedDay)) {
            setState(() {
              _selectedDay = selectedDay;
              _focusedDay = focusedDay;
            });
          }
        },
        onFormatChanged: (format) {
          if (_calendarFormat != format) {
            setState(() {
              _calendarFormat = format;
            });
          }
        },
        onPageChanged: (focusedDay) {
          _focusedDay = focusedDay;
        },
        eventLoader: _getExamsForDay,
        calendarBuilders: CalendarBuilders(
          markerBuilder: (context, date, events) {
            if (events.isNotEmpty) {
              return Positioned(
                bottom: 1,
                child: Container(
                  decoration: const BoxDecoration(
                    shape: BoxShape.circle,
                    color: Colors.red,
                  ),
                  width: 7.0,
                  height: 7.0,
                ),
              );
            }
            return null;
          },
        ),
      ),
      bottomSheet: _selectedDay != null
          ? Container(
        padding: const EdgeInsets.all(16),
        decoration: const BoxDecoration(
          border: Border(top: BorderSide(color: Colors.grey)),
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: _getExamsForDay(_selectedDay!).map((exam) => Card(
            child: ListTile(
              title: Text(exam.subject),
              subtitle: Text(
                '${exam.dateTime.hour}:${exam.dateTime.minute.toString().padLeft(2, '0')}',
              ),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) =>
                        MapScreen(examLocation: exam.location),
                  ),
                );
              },
            ),
          )).toList(),
        ),
      )
          : null,
    );
  }
}