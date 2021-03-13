import 'package:firebase_auth/firebase_auth.dart';
import 'package:scoped_model/scoped_model.dart';
import 'package:flutter/material.dart';



class UserModel extends Model {
  String _studentID;
  String _name;
  String _email;
  String _imageUrl;


  // Getters
  String get studentID => _studentID;
  String get name => _name;
  String get email => _email;
  String get imageUrl => _imageUrl;

  //Setters
  void setUserModel(User user) {
    _studentID = user.uid;
    _name = user.displayName;
    _email = user.email;
    _imageUrl = user.photoURL;
  }
  void setImageUrl(String value) {
    _imageUrl = value;
    notifyListeners();

  }
  void setEmail(String value) {
    _email = value;
    notifyListeners();

  }
  void setName(String value) {
    _name = value;
    notifyListeners();

  }
  void setStudentID(String value) {
    _studentID = value;
    notifyListeners();
  }
}