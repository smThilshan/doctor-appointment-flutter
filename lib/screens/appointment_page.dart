import 'package:flutter/material.dart';

class AppointmentPage extends StatefulWidget {
  const AppointmentPage({super.key});

  @override
  State<AppointmentPage> createState() => _AppointmentPageState();
}

class _AppointmentPageState extends State<AppointmentPage> {
  String selectedTab = 'Upcoming';

  void selectTab(String tab) {
    setState(() {
      selectedTab = tab;
    });
  }

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
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  buildTabButton("Upcoming"),
                  buildTabButton("Completed"),
                  buildTabButton("Canceled"),
                ],
              ),
              const SizedBox(height: 20),
              buildAppointmentCard(),
            ],
          ),
        ),
      ),
    );
  }

  Widget buildTabButton(String title) {
    final isActive = selectedTab == title;
    return TextButton(
      onPressed: () => selectTab(title),
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

  Widget buildAppointmentCard() {
    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      elevation: 3,
      child: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Row(
          children: [
            CircleAvatar(
              radius: 30,
              backgroundImage: AssetImage("assets/images/doctor.png"),
            ),
            const SizedBox(width: 16),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("Dr. John Doe",
                      style:
                          TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
                  Text("Cardiology",
                      style: TextStyle(fontSize: 14, color: Colors.grey)),
                  Text("July 5, 2023 | 10:30 AM",
                      style: TextStyle(fontSize: 14)),
                ],
              ),
            ),
            Column(
              children: [
                TextButton(
                    onPressed: () {},
                    child: const Text("Cancel",
                        style: TextStyle(color: Colors.red))),
                TextButton(onPressed: () {}, child: const Text("Reschedule")),
              ],
            )
          ],
        ),
      ),
    );
  }
}
