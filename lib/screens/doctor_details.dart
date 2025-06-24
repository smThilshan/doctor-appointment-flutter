import 'package:flutter/material.dart';

class DoctorDetailPage extends StatelessWidget {
  final String doctorImage;
  final String doctorName;
  final String specialty;
  final String description;

  const DoctorDetailPage({
    super.key,
    required this.doctorImage,
    required this.doctorName,
    required this.specialty,
    required this.description,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Doctor Details")),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              CircleAvatar(
                radius: 60,
                backgroundImage: AssetImage(doctorImage),
              ),
              const SizedBox(height: 16),
              Text(doctorName,
                  style: const TextStyle(
                      fontSize: 22, fontWeight: FontWeight.bold)),
              Text(specialty,
                  style: const TextStyle(fontSize: 16, color: Colors.teal)),
              const SizedBox(height: 16),
              Text(description,
                  textAlign: TextAlign.center,
                  style: const TextStyle(fontSize: 14)),
              const SizedBox(height: 30),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  ElevatedButton(
                    onPressed: () {},
                    child: const Text("Book Appointment"),
                  ),
                  OutlinedButton(
                    onPressed: () {},
                    child: const Text("Call Doctor"),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
