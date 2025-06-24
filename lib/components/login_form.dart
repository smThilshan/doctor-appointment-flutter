import 'package:dio/dio.dart';
import 'package:doctot_appointment/components/custom_btn.dart';
import 'package:doctot_appointment/utils/text.dart';
import 'package:flutter/material.dart';
import 'package:doctot_appointment/providers/dio_provider.dart';

// import 'package:doctot_appointment/providers/';
class LoginForm extends StatefulWidget {
  const LoginForm({super.key});

  @override
  State<LoginForm> createState() => _LoginFormState();
}

class _LoginFormState extends State<LoginForm> {
  final _formKey = GlobalKey<FormState>();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  bool _obscureText = true;

  void _submit() {
    if (_formKey.currentState!.validate()) {
      final email = _emailController.text.trim();
      final password = _passwordController.text.trim();
      debugPrint("Email: $email, Password: $password");
      // Perform login action here
    }
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Form(
        key: _formKey,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextFormField(
              controller: _emailController,
              keyboardType: TextInputType.emailAddress,
              decoration: const InputDecoration(
                labelText: 'Email',
              ),
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Please enter your email';
                }
                return null;
              },
            ),
            const SizedBox(height: 16),
            TextFormField(
              controller: _passwordController,
              obscureText: _obscureText,
              decoration: InputDecoration(
                labelText: 'Password',
                suffixIcon: IconButton(
                  icon: Icon(
                      _obscureText ? Icons.visibility_off : Icons.visibility),
                  onPressed: () {
                    setState(() {
                      _obscureText = !_obscureText;
                    });
                  },
                ),
              ),
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Please enter your password';
                }
                return null;
              },
            ),
            const SizedBox(height: 20),
            // ElevatedButton(
            //   onPressed: _submit,
            //   child: const Text("Login"),
            // ),
            CustomButton(
              title: AppText.enText['login_text'] ?? 'Login',
              width: double.infinity,
              // onPressed: _submit,
              onPressed: () async {
                final dioProvider = DioProvider();
                final token = await dioProvider.getToken(
                  _emailController.text.trim(),
                  _passwordController.text.trim(),
                );
                print(token);
                // Navigator.of(context).pushNamed('booking');
              },
              isDisabled: false,
            ),
          ],
        ),
      ),
    );
  }
}
