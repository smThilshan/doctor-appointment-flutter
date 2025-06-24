import 'package:doctor_appointment/components/appointment_card.dart';
import 'package:doctor_appointment/components/doctor_card.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<Map<String, dynamic>> categories = [
    {'name': 'Cardiology', 'icon': FontAwesomeIcons.heartbeat},
    {'name': 'Dermatology', 'icon': FontAwesomeIcons.syringe},
    {'name': 'Neurology', 'icon': FontAwesomeIcons.brain},
    {'name': 'Pediatrics', 'icon': FontAwesomeIcons.baby},
    {'name': 'Psychiatry', 'icon': FontAwesomeIcons.headSideVirus},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text("Amanda",
                      style:
                          TextStyle(fontSize: 24, fontWeight: FontWeight.bold)),
                  CircleAvatar(
                    radius: 30,
                    backgroundImage: AssetImage("assets/images/user.jpeg"),
                  ),
                ],
              ),
              SizedBox(height: 20),
              Text("Category",
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
              SizedBox(height: 12),
              SizedBox(
                height: 100,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: categories.length,
                  itemBuilder: (context, index) {
                    final category = categories[index];
                    return Container(
                      width: 230,
                      // margin: const EdgeInsets.symmetric(horizontal: 4.0),
                      child: Card(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                        elevation: 2,
                        child: ListTile(
                          title: Text(category['name'],
                              style: TextStyle(fontSize: 16)),
                          leading: Icon(category['icon'],
                              color: Colors.teal, size: 28),
                          trailing: const Icon(Icons.arrow_forward_ios,
                              color: Colors.teal, size: 18),
                        ),
                      ),
                    );
                  },
                ),
              ),
              SizedBox(height: 20),
              const Text("Appointment Today",
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
              // After the "Appointment Today" Text
              SizedBox(height: 12),
              AppointmentCard(
                doctorImage: "assets/images/doctor.png",
                doctorName: "Dr. Jane Smith",
                specialty: "Cardiology",
                dateTime: "July 5, 2023 | 10:30 AM",
                onCancel: () {
                  debugPrint("Cancel pressed");
                },
                onDownload: () {
                  debugPrint("Download pressed");
                },
              ),
              const Text("Top Doctors",
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
              SizedBox(height: 12),
              DoctorCard(
                doctorImage: "assets/images/doctor.png",
                doctorName: "Dr. John Doe",
                specialty: "Cardiology",
                onTap: () {
                  debugPrint("View Profile tapped");
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
