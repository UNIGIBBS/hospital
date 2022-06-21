

import 'package:flutter/cupertino.dart';
import 'package:hospital/pages/sign_in_page.dart';
import 'package:hospital/pages/sign_up_page.dart';

Widget signupPage = SignUpPage();
Widget signinPage = SignInPage();

class SLpage with ChangeNotifier{

  bool _isLogin = false;

  bool get isLogin => _isLogin;
  Widget get Login{
    return _isLogin? signinPage : signupPage;
  }
  void toggleLogin(){
    _isLogin = !_isLogin;
    notifyListeners();
  }


}