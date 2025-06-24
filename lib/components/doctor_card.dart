import 'package:flutter/material.dart';

class DoctorCard extends StatelessWidget {
  final String doctorImage;
  final String doctorName;
  final String specialty;
  final VoidCallback? onTap;

  const DoctorCard({
    super.key,
    required this.doctorImage,
    required this.doctorName,
    required this.specialty,
    this.onTap,
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
                      style: const TextStyle(
                          fontSize: 16, fontWeight: FontWeight.bold)),
                  Text(specialty,
                      style: const TextStyle(fontSize: 14, color: Colors.grey)),
                ],
              ),
            ),
            TextButton(
              onPressed: onTap,
              child: const Text("View Profile"),
            ),
          ],
        ),
      ),
    );
  }
}
