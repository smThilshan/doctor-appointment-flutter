import 'dart:convert';

import 'package:doctor_appointment/providers/dio_provider.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AppointmentPage extends StatefulWidget {
  const AppointmentPage({super.key});

  @override
  State<AppointmentPage> createState() => _AppointmentPageState();
}

// enum for appointment
enum FilterStatus { upcoming, complete, cancel }

class _AppointmentPageState extends State<AppointmentPage> {
  FilterStatus selectedStatus = FilterStatus.upcoming;
  List<Map<String, dynamic>> schedules = [];

  // fetch appointments
  Future<void> getAppointments() async {
    final prefs = await SharedPreferences.getInstance();
    final token = prefs.getString('token') ?? '';

    final appointmentResponse = await DioProvider().getAppointment(token);
    if (appointmentResponse != 'Error') {
      try {
        final List<dynamic> decoded = json.decode(appointmentResponse);
        setState(() {
          schedules = decoded.cast<Map<String, dynamic>>();
        });
      } catch (e) {
        print("Error decoding appointments: $e");
      }
    }
  }

  @override
  void initState() {
    super.initState();
    getAppointments();
  }

  void onTabSelected(FilterStatus status) {
    setState(() {
      selectedStatus = status;
    });
  }

  List<Map<String, dynamic>> get filteredSchedules {
    return schedules.where((appointment) {
      final statusString = appointment['status']?.toString().toLowerCase();
      switch (selectedStatus) {
        case FilterStatus.upcoming:
          return statusString == 'upcoming';
        case FilterStatus.complete:
          return statusString == 'complete';
        case FilterStatus.cancel:
          return statusString == 'cancel';
      }
    }).toList();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("My Appointments")),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              buildTabBar(),
              const SizedBox(height: 16),
              Expanded(
                child: filteredSchedules.isEmpty
                    ? const Center(child: Text('No appointments found'))
                    : ListView.builder(
                        itemCount: filteredSchedules.length,
                        itemBuilder: (context, index) {
                          final appointment = filteredSchedules[index];
                          return buildAppointmentCard(appointment);
                        },
                      ),
              )
            ],
          ),
        ),
      ),
    );
  }

  Widget buildTabBar() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        buildTabButton("Upcoming", FilterStatus.upcoming),
        buildTabButton("Completed", FilterStatus.complete),
        buildTabButton("Canceled", FilterStatus.cancel),
      ],
    );
  }

  Widget buildTabButton(String title, FilterStatus status) {
    final isActive = selectedStatus == status;
    return TextButton(
      onPressed: () => onTabSelected(status),
      child: Text(
        title,
        style: TextStyle(
          fontSize: 16,
          fontWeight: isActive ? FontWeight.bold : FontWeight.normal,
          color: isActive ? Colors.teal : Colors.black54,
        ),
      ),
    );
  }

  Widget buildAppointmentCard(Map<String, dynamic> appointment) {
    final doctorName = appointment['doctor_name'] ?? 'Unknown Doctor';
    final specialization = appointment['specialization'] ?? 'Specialist';
    final date = appointment['date'] ?? 'Date not set';
    final time = appointment['time'] ?? 'Time not set';
    final imageUrl = appointment['doctor_profile'];

    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      elevation: 3,
      margin: const EdgeInsets.symmetric(vertical: 8),
      child: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Row(
          children: [
            CircleAvatar(
              radius: 30,
              backgroundImage: NetworkImage(imageUrl),
            ),
            const SizedBox(width: 16),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    doctorName,
                    style: const TextStyle(
                        fontSize: 16, fontWeight: FontWeight.bold),
                  ),
                  Text(
                    specialization,
                    style: const TextStyle(fontSize: 14, color: Colors.grey),
                  ),
                  Text(
                    "$date | $time",
                    style: const TextStyle(fontSize: 14),
                  ),
                ],
              ),
            ),
            Column(
              children: [
                TextButton(
                  onPressed: () {
                    // Add cancel logic here
                  },
                  child:
                      const Text("Cancel", style: TextStyle(color: Colors.red)),
                ),
                TextButton(
                  onPressed: () {
                    // Add reschedule logic here
                  },
                  child: const Text("Reschedule"),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
