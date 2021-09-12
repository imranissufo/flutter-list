import 'package:appfour/screen/list.dart';
import 'package:appfour/screen/user.dart';
import 'package:faker/faker.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  var faker = new Faker();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Users App',
      theme: ThemeData(
        primarySwatch: Colors.amber,
      ),
      home: ListScreen(
        users: List.generate(
          7,
          (i) => User(
            i,
            faker.person.name(),
            faker.internet.email(),
            //'assets/person${++i}\.png',
            'assets/avatar (${++i}\).png',
          ),
        ),
      ),
      //home: MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}
