// import 'package:doctor_appointment/components/login_form.dart';
// import 'package:doctor_appointment/components/signup_form.dart';
// import 'package:doctor_appointment/utils/config.dart';
// import 'package:doctor_appointment/utils/text.dart';
// import 'package:flutter/material.dart';

// class AuthPage extends StatefulWidget {
//   const AuthPage({super.key});

//   @override
//   State<AuthPage> createState() => _AuthPageState();
// }

// class _AuthPageState extends State<AuthPage> {
//   bool isSignIn = true;

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: Padding(
//         padding: EdgeInsets.symmetric(horizontal: 15, vertical: 15),
//         child: SafeArea(
//             child: Column(
//           mainAxisAlignment: MainAxisAlignment.center,
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             Text(
//               AppText.enText['welcome_text'] ?? 'Welcome',
//               style: const TextStyle(
//                 fontSize: 30,
//                 fontWeight: FontWeight.bold,
//               ),
//             ),
//             Config.spaceSmall,
//             Text(
//               isSignIn
//                   ? AppText.enText['welcome_back_text'] ??
//                       'Welcome back, please sign in to continue'
//                   : AppText.enText['welcome_new_user'] ??
//                       'Welcome new user, please sign up to continue',
//               // AppText.enText['singIn_text'] ?? 'Sing In to your account',
//               style: const TextStyle(
//                 fontSize: 30,
//                 fontWeight: FontWeight.bold,
//               ),
//             ),
//             Config.spaceSmall,
//             isSignIn ? LoginForm() : SignUpPage(),
//             Config.spaceSmall,
//             Center(
//               child: Text(
//                 AppText.enText['forgot_password'] ??
//                     'You can easily sign up, and connect to the Doctors nearby you',
//                 textAlign: TextAlign.center,
//                 style: const TextStyle(
//                   fontSize: 16,
//                   color: Colors.grey,
//                 ),
//               ),
//             ),
//           ],
//         )),
//       ),
//     );
//   }
// }

import 'package:doctor_appointment/components/login_form.dart';
import 'package:doctor_appointment/components/signup_form.dart';
import 'package:doctor_appointment/utils/config.dart';
import 'package:doctor_appointment/utils/text.dart';
import 'package:flutter/material.dart';

class AuthPage extends StatefulWidget {
  const AuthPage({super.key});

  @override
  State<AuthPage> createState() => _AuthPageState();
}

class _AuthPageState extends State<AuthPage> {
  bool isSignIn = true;

  void toggleAuth() {
    setState(() {
      isSignIn = !isSignIn;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 15),
        child: SafeArea(
            child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                AppText.enText['welcome_text'] ?? 'Welcome',
                style:
                    const TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
              ),
              Config.spaceSmall,
              Text(
                isSignIn
                    ? AppText.enText['welcome_back_text'] ??
                        'Welcome back, please sign in to continue'
                    : AppText.enText['welcome_new_user'] ??
                        'Welcome new user, please sign up to continue',
                style:
                    const TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
              ),
              Config.spaceSmall,
              isSignIn ? const LoginForm() : SignUpPage(),
              Config.spaceSmall,
              Center(
                child: TextButton(
                  onPressed: toggleAuth,
                  child: Text(isSignIn
                      ? "Don't have an account? Sign Up"
                      : "Already have an account? Sign In"),
                ),
              ),
            ],
          ),
        )),
      ),
    );
  }
}
