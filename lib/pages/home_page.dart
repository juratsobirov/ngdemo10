import 'package:flutter/material.dart';
import 'package:ngdemo10/services/pref_service.dart';

import '../models/user_model.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  String name = "No name";

  List<User> userList = [
    User(id: 1001, username: 'Jur\'at'),
    User(id: 1002, username: 'Yunus'),
  ];

  @override
  void initState() {
    super.initState();
    Prefs.storeUserList(userList);
    _loadUserList();

    // User user = new User(
    //   id: 1001,
    //   username: "Jur'at",
    // );
    // Prefs.storeUser(user);
    // _loadUser();

    // Prefs.storeName("Jur'at");
    // _loadName();
    // Prefs.removeName();
  }

  _loadUserList() async {
    List<User>? result = await Prefs.loadUserList();
    this.name = result!.length.toString();
  }

  _loadUser() async {
    User? user = await Prefs.loadUser();
    setState(() {
      this.name = user!.toMap().toString();
    });
  }

  _loadName() async {
    String name = await Prefs.loadName();
    setState(() {
      this.name = name;
    });
    print(name);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        title: Text("Shared Preferences"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              name,
              style: TextStyle(fontSize: 20),
            ),
          ],
        ),
      ),
    );
  }
}
