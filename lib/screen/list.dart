import 'package:appfour/screen/details.dart';
import 'package:appfour/screen/registration.dart';
import 'package:appfour/screen/user.dart';
import 'package:flutter/material.dart';

class ListScreen extends StatefulWidget {
  const ListScreen({Key? key, required this.users}) : super(key: key);
  final List<User> users;

  @override
  _ListScreenState createState() => _ListScreenState();
}

class _ListScreenState extends State<ListScreen> {
  Future<void> registration() async {
    final result = await Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => RegistrationScreen(
          user: User(widget.users.length, 'name', 'email', 'image'),
        ),
      ),
    );
    if (result != null) {
      User u = result as User;
      setState(() {
        widget.users.add(u);
      });
      ScaffoldMessenger.of(context)
        ..removeCurrentSnackBar()
        ..showSnackBar(
            SnackBar(content: Text('User \"${u.name}\" added successfully!')));
    }
  }

  Future<void> details(int index, BuildContext context) async {
    final result = await Navigator.push(
        context,
        MaterialPageRoute(
            builder: (context) => DetailsScreen(user: widget.users[index])));
    if (result != null) {
      User u = result as User;
      setState(() {
        widget.users[u.id] = u;
      });
      ScaffoldMessenger.of(context)
        ..removeCurrentSnackBar()
        ..showSnackBar(SnackBar(
            content: Text('User \"${u.name}\" updated successfully!')));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Users'),
      ),
      body: ListView.builder(
          itemCount: widget.users.length,
          itemBuilder: (context, index) {
            print("Building cell at index $index");
            return Card(
                child: GestureDetector(
              onTap: () {
                details(index, context);
              },
              child: ListTile(
                title: Text(
                  widget.users[index].name,
                  style: TextStyle(fontSize: 21),
                ),
                subtitle: Text(widget.users[index].email),
                leading: CircleAvatar(
                    backgroundImage: AssetImage(widget.users[index].image)),
                trailing: Icon(
                  widget.users[index].icon,
                  color: Colors.grey[900],
                ),
              ),
            ));
          }),
      floatingActionButton: FloatingActionButton(
        onPressed: registration,
        tooltip: 'Add Person',
        child: Icon(Icons.person_add),
      ),
    );
  }
}
