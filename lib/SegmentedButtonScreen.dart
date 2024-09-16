
import 'package:flutter/material.dart';


enum Calendar {day, week, month, year}

class MySegmentedButtonScreen extends StatefulWidget {
  const MySegmentedButtonScreen({super.key});

  @override
  State<MySegmentedButtonScreen> createState() => _MySegmentedButtonScreenState();
}

class _MySegmentedButtonScreenState extends State<MySegmentedButtonScreen> {
  bool isSelected = false;
  Calendar calendarView = Calendar.day;
  Set<Calendar> selection = <Calendar>{Calendar.day, Calendar.week, Calendar.month};

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Segmented Button Screen'),
      ),
      body: Column(
        children: [
          const Text('Single selection'),
          SegmentedButton<Calendar>(
            segments: const [
              ButtonSegment<Calendar>(
                value: Calendar.day,
                label: Text('Day'),
                icon: Icon(Icons.calendar_view_day),
              ),
              ButtonSegment<Calendar>(
                value: Calendar.week,
                label: Text('Week'),
                icon: Icon(Icons.calendar_view_week),
              ),
              ButtonSegment<Calendar>(
                value: Calendar.month,
                label: Text('Month'),
                icon: Icon(Icons.calendar_month),
              ),
            ],
            selected: <Calendar>{calendarView},
            onSelectionChanged: (Set<Calendar>? value){
              setState(() {
                calendarView = value!.first;
              });
            },
            multiSelectionEnabled: true,
          ),


          ///Multiple selection
          const Text('Multiple selection'),
          SegmentedButton<Calendar>(
            segments: const [
              ButtonSegment<Calendar>(
                value: Calendar.day,
                label: Text('Day'),
                icon: Icon(Icons.calendar_view_day),
              ),
              ButtonSegment<Calendar>(
                value: Calendar.week,
                label: Text('Week'),
                icon: Icon(Icons.calendar_view_week),
              ),
              ButtonSegment<Calendar>(
                value: Calendar.month,
                label: Text('Month'),
                icon: Icon(Icons.calendar_month),
              ),
            ],
            selected: selection,
            onSelectionChanged: (Set<Calendar>? value){
              setState(() {
                selection = value!;
              });
            },
            multiSelectionEnabled: true,
          ),
        ],
      ),
    );
  }
}

