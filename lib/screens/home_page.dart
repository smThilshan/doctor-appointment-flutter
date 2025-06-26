import 'dart:convert';

import 'package:doctor_appointment/components/appointment_card.dart';
import 'package:doctor_appointment/components/doctor_card.dart';
import 'package:doctor_appointment/providers/dio_provider.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:shared_preferences/shared_preferences.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  Map<String, dynamic> user = {};

  List<Map<String, dynamic>> categories = [
    {'name': 'Cardiology', 'icon': FontAwesomeIcons.heartbeat},
    {'name': 'Dermatology', 'icon': FontAwesomeIcons.syringe},
    {'name': 'Neurology', 'icon': FontAwesomeIcons.brain},
    {'name': 'Pediatrics', 'icon': FontAwesomeIcons.baby},
    {'name': 'Psychiatry', 'icon': FontAwesomeIcons.headSideVirus},
  ];

  Future<void> getData() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    final String token = prefs.getString('token') ?? '';

    if (token.isNotEmpty && token != 'null') {
      final response = await DioProvider().getUserDetails(token);
      if (response != null) {
        setState(() {
          user = jsonDecode(response);
          print(user);
        });
      }
    } else {
      debugPrint("No token found");
    }
  }

  @override
  void initState() {
    getData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    // Show loader until user data is available
    if (user.isEmpty) {
      return const Scaffold(
        body: Center(
          child: CircularProgressIndicator(),
        ),
      );
    }

    // Main Page
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // User Info
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      user['name'],
                      style: const TextStyle(
                          fontSize: 24, fontWeight: FontWeight.bold),
                    ),
                    const CircleAvatar(
                      radius: 30,
                      backgroundImage: AssetImage("assets/images/user.jpeg"),
                    ),
                  ],
                ),
                const SizedBox(height: 20),
                const Text("Category",
                    style:
                        TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                const SizedBox(height: 12),
                SizedBox(
                  height: 100,
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: categories.length,
                    itemBuilder: (context, index) {
                      final category = categories[index];
                      return SizedBox(
                        width: 230,
                        child: Card(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(12),
                          ),
                          elevation: 2,
                          child: ListTile(
                            title: Text(category['name'],
                                style: const TextStyle(fontSize: 16)),
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
                const SizedBox(height: 20),
                const Text("Appointment Today",
                    style:
                        TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                const SizedBox(height: 12),
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
                const SizedBox(height: 20),
                const Text("Top Doctors",
                    style:
                        TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                const SizedBox(height: 12),
                // List of doctors
                ...List.generate(user['doctors'].length, (index) {
                  return DoctorCard(
                    route: 'doc_details',
                    doctor: user['doctors'][index],
                  );
                }),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
