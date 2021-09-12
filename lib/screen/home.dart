import 'package:appfour/screen/list.dart';
import 'package:appfour/screen/user.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(
    MaterialApp(
      title: 'Passing Data',
      home: ListScreen(
        users: List.generate(
          7,
          (i) => User(
            i,
            'name$i surname$i',
            'user$i@gmail.com',
            'assets/person.png',
          ),
        ),
      ),
    ),
  );
}
