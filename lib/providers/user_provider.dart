import 'package:flutter/material.dart';
import 'package:myown/model/user_model.dart';
import 'package:myown/services/user_service.dart';


class UserProvider with ChangeNotifier{
 List<UserModel> _users = [];
 List<UserModel> get users => _users;
 set users(List<UserModel> users) {
    _users = users;
    notifyListeners();
 }

  Future<void> getUsers() async {
    try {
      List<UserModel> users = await UserService().getUsers();
      _users = users;
    } catch (e) {
      // ignore: avoid_print
      print(e);
    }
  }


  Future<bool> addUser(
      {required String email,
      required String firstName,
      required String lastName,}) async {
    try {
      await UserService().addUser(
          email: email, firstName: firstName, lastName: lastName);
      return true;
    } catch (e) {
      // ignore: avoid_print
      print(e);
      return false;
    }
  }




}