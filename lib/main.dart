import 'package:doctot_appointment/screens/auth_page.dart';
import 'package:doctot_appointment/screens/booking_page.dart';
import 'package:doctot_appointment/screens/doctor_details.dart';
import 'package:doctot_appointment/screens/success_screen.dart';
import 'package:doctot_appointment/utils/config.dart';
import 'package:doctot_appointment/utils/main_layout.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  static final navigatorKey = GlobalKey<NavigatorState>();

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      navigatorKey: navigatorKey,
      title: 'Doctor Appointment',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Config.primaryColor),
        useMaterial3: true,
        focusColor: Config.primaryColor,
        bottomNavigationBarTheme: BottomNavigationBarThemeData(
          selectedItemColor: Colors.white,
          showSelectedLabels: true,
          showUnselectedLabels: false,
          backgroundColor: Config.primaryColor,
          unselectedItemColor: Colors.grey.shade700,
          elevation: 10,
          type: BottomNavigationBarType.fixed,
        ),
      ),
      initialRoute: '/',
      routes: {
        '/': (context) => const AuthPage(),
        'main': (context) => const MainLayout(),
        'booking': (context) => const BookingPage(),
        'success': (context) => const SuccessScreen(
              title: '',
              message: '',
            ),
        'doctor_details': (context) => const DoctorDetailPage(
              doctorImage: '',
              doctorName: '',
              specialty: '',
              description: '',
            ),
      },
    );
  }
}
