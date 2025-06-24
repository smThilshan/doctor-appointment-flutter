import 'package:flutter/material.dart';

class AppointmentCard extends StatelessWidget {
  final String doctorImage;
  final String doctorName;
  final String specialty;
  final String dateTime;
  final VoidCallback? onCancel;
  final VoidCallback? onDownload;

  const AppointmentCard({
    super.key,
    required this.doctorImage,
    required this.doctorName,
    required this.specialty,
    required this.dateTime,
    this.onCancel,
    this.onDownload,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
      ),
      elevation: 3,
      child: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Row(
          children: [
            CircleAvatar(
              radius: 30,
              backgroundImage: AssetImage(doctorImage),
            ),
            const SizedBox(width: 16),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(doctorName,
                      style:
                          TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
                  Text(specialty,
                      style: TextStyle(fontSize: 14, color: Colors.grey)),
                  Text(dateTime, style: TextStyle(fontSize: 14)),
                ],
              ),
            ),
            Column(
              children: [
                TextButton(
                    onPressed: onCancel,
                    child: const Text("Cancel",
                        style: TextStyle(color: Colors.red))),
                TextButton(
                    onPressed: onDownload, child: const Text("Download")),
              ],
            )
          ],
        ),
      ),
    );
  }
}
