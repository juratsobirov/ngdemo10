import 'dart:convert';

import 'package:shared_preferences/shared_preferences.dart';

import '../models/user_model.dart';



class Prefs {

  // user related
  static storeUser(User user) async{
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String userString = jsonEncode(user.toMap());
    prefs.setString("user", userString);
  }
  static Future<User?> loadUser() async{
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String? userString = prefs.getString("user");
    if(userString == null || userString.isEmpty) return null;

    Map<String, dynamic> map = jsonDecode(userString);
    return User.fromMap(map);
  }

  static Future<bool> removeUser()async{
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.remove("user");
  }



  // name related
 static storeName(String name) async{
   SharedPreferences prefs = await SharedPreferences.getInstance();
   prefs.setString("name", name);
 }

 static Future<String> loadName() async{
   SharedPreferences prefs = await SharedPreferences.getInstance();
   String? name = prefs.getString("name");
   return name ?? "";
 }

 static Future<bool> removeName() async{
   SharedPreferences prefs = await SharedPreferences.getInstance();
   return prefs.remove("name");
 }
}