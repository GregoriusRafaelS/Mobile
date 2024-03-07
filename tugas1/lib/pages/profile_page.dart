import 'package:flutter/material.dart';

class User {
  final String name;
  final String nim;
  final String imageAsset;

  User({required this.name, required this.nim, required this.imageAsset});
}

class ProfilePage extends StatelessWidget {
  final List<User> users = [
    User(
      name: "Gregorius Rafael Santosa",
      nim: "123210102",
      imageAsset: "assets/images/rafael.jpg",
    ),
    User(
      name: "Muhammad Ahnaf Ardiansyah",
      nim: "123210069",
      imageAsset: "assets/images/ahnaf-1.jpg",
    ),
    User(
      name: "Gregorius Rafael Santosa",
      nim: "123210102",
      imageAsset: "assets/images/rafael.jpg",
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Profile'),
      ),
      body: ListView.builder(
        itemCount: users.length,
        itemBuilder: (BuildContext context, int index) {
          return ListTile(
            leading: CircleAvatar(
              // backgroundImage: AssetImage("assets/images/rafael.jpg"),
              backgroundImage: AssetImage(users[index].imageAsset),
              // backgroundImage: AssetImage("assets/images/ahnaf.jpg"),
            ),
            title: Text(users[index].name),
            subtitle: Text('NIM: ${users[index].nim}'),
          );
        },
      ),
    );
  }
}