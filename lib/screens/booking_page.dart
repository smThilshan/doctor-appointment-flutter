import 'package:doctor_appointment/main.dart';
import 'package:doctor_appointment/models/booking_datetime_converted.dart';
import 'package:doctor_appointment/providers/dio_provider.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:table_calendar/table_calendar.dart';

class BookingPage extends StatefulWidget {
  const BookingPage({super.key});

  @override
  State<BookingPage> createState() => _BookingPageState();
}

class _BookingPageState extends State<BookingPage> {
  DateTime _selectedDate = DateTime.now();
  String? _selectedTimeSlot;
  String? token;

  Future<void> getToken() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    token = prefs.getString('token') ?? '';
  }

  @override
  void initState() {
    getToken();
    super.initState();
  }

  final List<String> _timeSlots = [
    '09:00 AM',
    '10:30 AM',
    '12:00 PM',
    '02:00 PM',
    '03:30 PM',
    '05:00 PM'
  ];

  void _onDateSelected(DateTime date, _) {
    setState(() {
      _selectedDate = date;
    });
  }

  void _onTimeSlotSelected(String slot) {
    setState(() {
      _selectedTimeSlot = slot;
    });
  }

  @override
  Widget build(BuildContext context) {
    final doctor = ModalRoute.of(context)!.settings.arguments as Map;
    return Scaffold(
      appBar: AppBar(title: const Text("Book Appointment")),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TableCalendar(
              firstDay: DateTime.now(),
              lastDay: DateTime.now().add(const Duration(days: 365)),
              focusedDay: _selectedDate,
              selectedDayPredicate: (day) => isSameDay(_selectedDate, day),
              onDaySelected: _onDateSelected,
              calendarFormat: CalendarFormat.month,
            ),
            const SizedBox(height: 20),
            Wrap(
              spacing: 8.0,
              runSpacing: 8.0,
              children: _timeSlots.map((slot) {
                final isSelected = slot == _selectedTimeSlot;
                return ChoiceChip(
                  label: Text(slot),
                  selected: isSelected,
                  onSelected: (selected) => _onTimeSlotSelected(slot),
                );
              }).toList(),
            ),
            const SizedBox(height: 30),
            ElevatedButton(
              onPressed: () async {
                final getDate = DateConverted.getDate(_selectedDate);
                final getDay = DateConverted.getDay(_selectedDate.weekday);
                final getTime = DateConverted.getTime(
                    _timeSlots.indexOf(_selectedTimeSlot!));
                // final getTimeIndex = _timeSlots.indexOf(_selectedTimeSlot!);

                final booking = await DioProvider().bookAppointment(
                    getDate, getDay, getTime, doctor['doctor_id'], token!);

                if (booking == true) {
                  MyApp.navigatorKey.currentState!.pushNamed('success');
                } else {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(content: Text("Failed to book appointment")),
                  );
                }
              },
              child: const Text("Book Appointment"),
            )
          ],
        ),
      ),
    );
  }
}
