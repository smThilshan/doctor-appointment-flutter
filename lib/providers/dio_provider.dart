import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:shared_preferences/shared_preferences.dart';

class DioProvider {
  // get token
  Future<dynamic> getToken(String email, String password) async {
    try {
      var response = await Dio().post(
        'http://127.0.0.1:8000/api/login',
        data: {
          'email': email,
          'password': password,
        },
      );

      if (response.statusCode == 200 && response.data != '') {
        final SharedPreferences prefs = await SharedPreferences.getInstance();
        await prefs.setString('token', response.data);
        // return response.data;
        return true; // Indicating successful login
      } else {
        return false; // Indicating failed login
      }
    } catch (e) {
      // Handle any errors that occur during the request
      print("Error fetching token: $e");
      return null;
    }
  }

  // get user details
  Future<dynamic> getUserDetails(String token) async {
    try {
      var user = await Dio().get('http://127.0.0.1:8000/api/user',
          options: Options(headers: {'Authorization': 'Bearer $token'}));

      if (user.statusCode == 200 && user.data != '') {
        return jsonEncode(user.data);
      }
    } catch (e) {
      // Handle any errors that occur during the request
      print("Error fetching user details: $e");
      return null;
    }
  }

  Future<dynamic> registerUser(
      String username, String email, String password) async {
    try {
      var user = await Dio().post(
        'http://127.0.0.1:8000/api/register',
        data: {
          'name': username,
          'email': email,
          'password': password,
        },
      );

      // print(user.data);
      // Print the status code
      // print('Status Code: ${user.statusCode}');

      if ((user.statusCode == 200 || user.statusCode == 201) &&
          user.data != '') {
        return true;
      } else {
        return false;
      }
    } catch (e) {
      // Handle any errors that occur during the request
      print("Error fetching user details: $e");
      return false;
    }
  }

  Future<dynamic> bookAppointment(
      String date, String day, String time, int doctor, String token) async {
    try {
      var response = await Dio().post(
        'http://127.0.0.1:8000/api/book',
        data: {
          'date': date,
          'day': day,
          'time': time,
          'doctor_id': doctor,
        },
        options: Options(headers: {'Authorization': 'Bearer $token'}),
      );

      if ((response.statusCode == 200 || response.statusCode == 201) &&
          response.data != '') {
        return true;
      } else {
        return false;
      }
    } catch (e) {
      // Handle any errors that occur during the request
      print("Error booking appointment details: $e");
      return false;
    }
  }

  Future<dynamic> getAppointment(String token) async {
    try {
      var response = await Dio().get(
        'http://127.0.0.1:8000/api/appointments',
        options: Options(headers: {'Authorization': 'Bearer $token'}),
      );

      if ((response.statusCode == 200 || response.statusCode == 201) &&
          response.data != '') {
        return jsonEncode(response.data);
      } else {
        return false;
      }
    } catch (e) {
      // Handle any errors that occur during the request
      print("Error booking appointment details: $e");
      return false;
    }
  }
}
