import 'package:flutter/material.dart';

class User {
  final int id;
  final String name;
  final String email;
  final String image;
  final IconData icon = Icons.person;

  const User(this.id, this.name, this.email, this.image);
}
