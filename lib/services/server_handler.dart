
import 'dart:convert';


import 'package:hospital/models/user.dart';
import 'package:http/http.dart' as http;

class ServerHandler {
  /// For emulator
  final String _baseUrl = 'http://10.0.2.2:8080/hospital_database/api';
  // final String _baseUrl = 'http://10.34.13.71/hospital_database/api';

  /// For Flutter Web
  // final String _baseUrl = 'http://localhost/find_best_API/api';

  /// USER TABLE
  Future<Map<dynamic, dynamic>?> registerUser(User basicUser) async {
    print("Server handler register User...");
    try {
      http.Response response = await http.post(
        Uri.parse('$_baseUrl/User/register.php'),
        body: {
          'name': basicUser.name,
          'surname': basicUser.surname,
          'user_type': basicUser.user_type,
          'email': basicUser.email,
          'password': basicUser.password,
        },
      );

      Map<dynamic, dynamic> result = jsonDecode(response.body);
      print('result: $result');
      return result;
    } catch (e) {
      print('Server Handler: Error : $e');
    }
    return null;
  }

  Future<Map<dynamic, dynamic>?> loginUser(
      String email, String password) async {
    try {
      http.Response response = await http.post(
        Uri.parse('$_baseUrl/user/login.php'),
        body: {
          'email': email,
          'password': password,
        },
      );

      Map<dynamic, dynamic> result = jsonDecode(response.body);
      print('result: $result');
      return result;
    } catch (e) {
      print('Server Handler: Error : $e');
    }
    return null;
  }

  /// WORKER TABLE

  Future<Map<dynamic, dynamic>?> fetchOneUser(String email) async {
    try {
      http.Response response = await http.post(
        Uri.parse('$_baseUrl/user/fetch_one_user.php'),
        body: {
          'email': email,
        },
      );

      Map<dynamic, dynamic> result = jsonDecode(response.body);
      print('result: $result');
      return result;
    } catch (e) {
      print('Server Handler: Error : $e');
    }
    return null;
  }

  Future<Map<dynamic, dynamic>?> updateUser(
      {required var user_id, required String name, required String surname, required String password}) async {
    try {
      http.Response response = await http.post(
        Uri.parse('$_baseUrl/user/update_user_info.php'),
        body: {
          'user_id': user_id,
          'name': name,
          'surname': surname,
          'password': password,
        },
      );

      Map<dynamic, dynamic> result = jsonDecode(response.body);
      print('result: $result');
      return result;
    } catch (e) {
      print('Server Handler: Error : $e');
    }
    return null;
  }

  Future<Map<dynamic, dynamic>?> deleteUser(
      {required String email, required var user_id}) async {
    try {
      http.Response response = await http.post(
        Uri.parse('$_baseUrl/user/delete_user.php'),
        body: {
          'email': email,
          'user_id': user_id,
        },
      );

      Map<dynamic, dynamic> result = jsonDecode(response.body);
      print('result: $result');
      return result;
    } catch (e) {
      print('Server Handler: Error : $e');
    }
    return null;
  }

  Future<Map<dynamic, dynamic>?> getAllDoctors() async {
    try {
      http.Response response = await http.get(
        Uri.parse('$_baseUrl/gen/get_doctor_info.php'),
      );

      Map<dynamic, dynamic> result = jsonDecode(response.body);
      print('result: $result');
      return result;
    } catch (e) {
      print('Server Handler: Error : $e');
    }
    return null;
  }

}