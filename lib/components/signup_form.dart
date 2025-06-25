import 'package:doctor_appointment/main.dart';
import 'package:doctor_appointment/models/auth_model.dart';
import 'package:doctor_appointment/providers/dio_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class SignUpPage extends StatelessWidget {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  SignUpPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Form(
        key: _formKey,
        child: Column(
          children: [
            TextFormField(
              controller: _nameController,
              decoration: const InputDecoration(labelText: "Username"),
              validator: (value) =>
                  value!.isEmpty ? "Enter your username" : null,
            ),
            TextFormField(
              controller: _emailController,
              decoration: const InputDecoration(labelText: "Email"),
              validator: (value) =>
                  value!.contains("@") ? null : "Enter a valid email",
            ),
            TextFormField(
              controller: _passwordController,
              decoration: const InputDecoration(labelText: "Password"),
              obscureText: true,
              validator: (value) =>
                  value!.length < 6 ? "Password must be 6+ chars" : null,
            ),
            const SizedBox(height: 20),
            Consumer<AuthModel>(
              builder: (context, auth, child) {
                return ElevatedButton(
                  onPressed: () async {
                    // if (_formKey.currentState!.validate()) {
                    //   // Perform Sign Up action
                    // }

                    final userRegistration = await DioProvider().registerUser(
                        _nameController.text,
                        _emailController.text,
                        _passwordController.text);

                    if (userRegistration) {
                      final token = await DioProvider().getToken(
                          _emailController.text, _passwordController.text);

                      if (token) {
                        auth.loginsuccess();
                        MyApp.navigatorKey.currentState!.pushNamed('main');
                      }
                    } else {
                      print("Registration failed");
                    }
                  },
                  child: const Text("Sign Up"),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
