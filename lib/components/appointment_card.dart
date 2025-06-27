import 'package:flutter/material.dart';

class AppointmentCard extends StatelessWidget {
  final Map<String, dynamic> doctor;
  final Color color;
  // final String doctorImage;
  // final String doctorName;
  // final String specialty;
  // final String dateTime;
  // final VoidCallback? onCancel;
  // final VoidCallback? onDownload;

  const AppointmentCard({
    super.key,
    required this.doctor,
    required this.color,
    // required this.doctorImage,
    // required this.doctorName,
    // required this.specialty,
    // required this.dateTime,
    // this.onCancel,
    // this.onDownload,
  });

  @override
  Widget build(BuildContext context) {
    final doctorName = doctor['doctor_name'] ?? 'Unknown Doctor';
    final specialization = doctor['specialization'] ?? 'Specialist';
    final date = doctor['date'] ?? 'Date not set';
    final time = doctor['time'] ?? 'Time not set';
    final imageUrl = doctor['doctor_profile'];

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
