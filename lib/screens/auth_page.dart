import 'package:doctot_appointment/components/login_form.dart';
import 'package:doctot_appointment/utils/config.dart';
import 'package:doctot_appointment/utils/text.dart';
import 'package:flutter/material.dart';

class AuthPage extends StatefulWidget {
  const AuthPage({super.key});

  @override
  State<AuthPage> createState() => _AuthPageState();
}

class _AuthPageState extends State<AuthPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 15, vertical: 15),
        child: SafeArea(
            child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              AppText.enText['welcome_text'] ?? 'Welcome',
              style: const TextStyle(
                fontSize: 30,
                fontWeight: FontWeight.bold,
              ),
            ),
            Config.spaceSmall,
            Text(
              AppText.enText['singIn_text'] ?? 'Sing In to your account',
              style: const TextStyle(
                fontSize: 30,
                fontWeight: FontWeight.bold,
              ),
            ),
            Config.spaceSmall,
            LoginForm(),
            Config.spaceSmall,
            Center(
              child: Text(
                AppText.enText['forgot_password'] ??
                    'You can easily sign up, and connect to the Doctors nearby you',
                textAlign: TextAlign.center,
                style: const TextStyle(
                  fontSize: 16,
                  color: Colors.grey,
                ),
              ),
            ),
          ],
        )),
      ),
    );
  }
}
