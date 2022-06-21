
import 'package:flutter/material.dart';
import 'package:hospital/models/user.dart';

class BasicUserInfo with ChangeNotifier {
    User basicUser = User(
    user_type: 'patient',
    email: '',
    password: '',
    name: '',
    surname: '',
  );

  void updateType(String newType) {
    basicUser.user_type = newType;
    notifyListeners();
  }

  void updateEmailAndPassword(String email, String password) {
    basicUser.email = email;
    basicUser.password = password;
    notifyListeners();
  }

  void updateGeneralUserInfo(String name, String surname, String city,
      String gender, String birthday, String phoneNumber) {
    basicUser.name = name;
    basicUser.surname = surname;
    notifyListeners();
  }

  void updateAllUserInfo(User newBasicUser) {
    basicUser = newBasicUser;
    notifyListeners();
  }

  void clearUserInfo() {
    basicUser = User(
      user_type: 'User',
      email: '',
      password: '',
      name: '',
      surname: '',

    );
    notifyListeners();
  }
}
