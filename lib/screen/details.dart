import 'package:appfour/screen/registration.dart';
import 'package:appfour/screen/user.dart';
import 'package:flutter/material.dart';

class DetailsScreen extends StatelessWidget {
  // In the constructor, require a User.
  const DetailsScreen({Key? key, required this.user}) : super(key: key);

  // Declare a field that holds the User.
  final User user;

  static String getFirstWord(String inputString) {
    List<String> wordList = inputString.split(" ");
    if (wordList.isNotEmpty) {
      return wordList[0];
    } else {
      return ' ';
    }
  }

  // void registration() {
  //   Navigator.push(context,
  //       MaterialPageRoute(builder: (context) => ProfileScreen(user: user)));
  // }

  @override
  Widget build(BuildContext context) {
    // Use the User to create the UI.
    return Scaffold(
      appBar: AppBar(
        //title: Text(user.name),
        title: Text("User Profile: " + getFirstWord(user.name)),
      ),
      body: ListView(
        children: [
          CircleAvatar(
              backgroundColor: Colors.amber,
              radius: 120,
              child: CircleAvatar(
                  radius: 110, backgroundImage: AssetImage(user.image))),
          Card(
            child: ListTile(
                title: Text(user.name),
                subtitle: Text("name"),
                leading: Icon(Icons.person),
                trailing: Icon(Icons.card_membership)),
          ),
          Card(
            child: ListTile(
                title: Text(user.email),
                subtitle: Text("email"),
                leading: Icon(Icons.email),
                trailing: Icon(Icons.alternate_email)),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          editRegistration(context);
        },
        tooltip: 'Update Registration',
        child: Icon(Icons.edit),
      ),
    );
  }

  Future<void> editRegistration(BuildContext context) async {
    final result = await Navigator.push(
        context,
        MaterialPageRoute(
            builder: (context) => RegistrationScreen(user: user)));
    if (result != null) {
      User u = result as User;
      Navigator.pop(context, u);
    }
  }
}
