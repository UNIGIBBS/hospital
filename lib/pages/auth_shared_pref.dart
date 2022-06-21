import 'package:shared_preferences/shared_preferences.dart';

class AuthSharedPref {
  Future<void> saveAuthData(String email) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString('auth_data', email);
  }

  Future<String> readAuthData() async {
    final prefs = await SharedPreferences.getInstance();
    final String? authDataList = prefs.getString('auth_data');
    return authDataList ?? '';
  }

  Future<void> removeAuthData() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.remove('auth_data');
  }
}
