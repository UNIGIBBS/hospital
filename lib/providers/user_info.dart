import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class UserInfo with ChangeNotifier{
  String mail = "";

  String getMail(){
    return getMail();
  }

  reset(){
    mail = "";
    notifyListeners();
  }

  setMail(String newMail){
    mail = newMail;
    notifyListeners();
  }
}