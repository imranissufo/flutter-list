import 'package:appfour/screen/user.dart';
import 'package:flutter/material.dart';

class RegistrationScreen extends StatefulWidget {
  RegistrationScreen({Key? key, required this.user}) : super(key: key);

  final User user;

  @override
  _RegistrationScreenState createState() => _RegistrationScreenState();
}

class _RegistrationScreenState extends State<RegistrationScreen> {
  String _name = "";
  String _email = "";
  String _image = "assets/person.png";
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    if (true) {}
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'User Registration',
        ),
      ),
      body: Form(
        key: _formKey,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.all(7.0),
              child: Text(
                "User Registration",
                style: TextStyle(
                    fontFamily: 'Raleway',
                    fontSize: 21,
                    color: Colors.grey[900]),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(7.0),
              child: Text(
                "Enter your name, email and image url for registration",
                style: TextStyle(
                    fontFamily: 'Raleway',
                    fontSize: 11,
                    color: Colors.grey[500]),
              ),
            ),
            Padding(
              padding: EdgeInsets.all(7.0), // specific value
              child: TextFormField(
                onSaved: (value) {
                  _name = value!;
                },
                decoration: const InputDecoration(
                    icon: const Icon(Icons.person),
                    border: OutlineInputBorder(),
                    labelText: 'Name',
                    hintText: 'Enter a name'),
                // The validator receives the text that the user has entered.
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please provide a name';
                  }
                  return null;
                },
                initialValue:
                    widget.user.name == 'name' ? '' : widget.user.name,
              ),
            ),
            Padding(
              padding: EdgeInsets.all(7.0),
              child: TextFormField(
                onSaved: (value) {
                  _email = value!;
                },
                decoration: const InputDecoration(
                    icon: const Icon(Icons.email),
                    border: OutlineInputBorder(),
                    labelText: 'Email',
                    hintText: 'Enter email'),
                // The validator receives the text that the user has entered.
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please provide an email';
                  }
                  return null;
                },
                initialValue:
                    widget.user.email == 'email' ? '' : widget.user.email,
              ),
            ),
            Padding(
              padding: EdgeInsets.all(7.0), // specific value
              child: TextFormField(
                onSaved: (value) {
                  _image = value!;
                },
                decoration: const InputDecoration(
                    icon: const Icon(Icons.image),
                    border: OutlineInputBorder(),
                    labelText: 'Image Url',
                    hintText: 'Enter image url'),
                // The validator receives the text that the user has entered.
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please provide an image url';
                  }
                  return null;
                },
                initialValue:
                    widget.user.image == 'image' ? _image : widget.user.image,
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 7.0, vertical: 7),
              child: MaterialButton(
                height: 50,
                color: Colors.amber,
                onPressed: () {
                  // Validate returns true if the form is valid, or false otherwise.
                  if (_formKey.currentState!.validate()) {
                    // If the form is valid, display a snackbar. In the real world,
                    // you'd often call a server or save the information in a database.
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(content: Text('Processing Data')),
                    );
                    _formKey.currentState!.save();
                    addUser();
                  }
                },
                child:
                    Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                  Icon(
                    Icons.person_add,
                    //color: Colors.white,
                  ),
                  Text(
                    "Submit",
                    //style: TextStyle(color: Colors.white),
                  ),
                ]), //const Text('Submit'),
              ),
            ),
          ],
        ),
      ),
    );
  }

  void nameChanged(String value) {}
  void addUser() {
    if (_name.isNotEmpty) {
      User u = User(widget.user.id, _name, _email, _image);
      Navigator.pop(context, u);
    }
  }
}
