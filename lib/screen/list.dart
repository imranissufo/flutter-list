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
  final GlobalKey<AnimatedListState> _listKey = GlobalKey();

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
        _listKey.currentState!
            .insertItem(u.id, duration: const Duration(milliseconds: 300));
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

  void deleteUser(int id) {
    setState(() {
      final index = widget.users.indexWhere((u) => u.id == id);
      var user = widget.users.removeAt(index);
      _listKey.currentState!.removeItem(
        index,
        (context, animation) {
          return FadeTransition(
            opacity: CurvedAnimation(
                parent: animation, curve: const Interval(0.5, 1.0)),
            child: SizeTransition(
              sizeFactor: CurvedAnimation(
                  parent: animation, curve: const Interval(0.0, 1.0)),
              axisAlignment: 0.0,
              child: _buildItem(user),
            ),
          );
        },
        duration: const Duration(milliseconds: 600),
      );
    });
  }

  Widget _buildItem(User user) {
    return ListTile(
      key: ValueKey<User>(user),
      title: Text(
        user.name,
        style: TextStyle(fontSize: 21),
      ),
      subtitle: Text(user.email),
      leading: CircleAvatar(backgroundImage: AssetImage(user.image)),
      trailing: IconButton(
        icon: const Icon(Icons.delete),
        onPressed: () => deleteUser(user.id),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Users'),
      ),
      body: SafeArea(
        child: AnimatedList(
            key: _listKey,
            initialItemCount: widget.users.length,
            itemBuilder: (context, index, animation) {
              return Card(
                  child: GestureDetector(
                onTap: () {
                  details(index, context);
                },
                child: _buildItem(widget.users[index]),
              ));
            }),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: registration,
        tooltip: 'Add Person',
        child: Icon(Icons.person_add),
      ),
    );
  }
}
