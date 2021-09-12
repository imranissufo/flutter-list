import 'package:flutter/material.dart';

class Countries extends StatefulWidget {
  const Countries({Key? key}) : super(key: key);

  @override
  _CountriesState createState() => _CountriesState();
}

class _CountriesState extends State<Countries> {
  List<String> countries = ["MZ", "EG", "SA"];
  String _country = "MZ";
  int _currentIndex = 0;
  String _newCountry = "";

  bool _isAddDisabled = true;
  bool _isNextDisabled = false;
  bool _isPreDisabled = true;

  void textChanged(String newCountry) {
    setNewCountry(newCountry);
  }

  void setNewCountry(String newCountry) {
    setState(() {
      if (newCountry.isNotEmpty) {
        _newCountry = newCountry;
        _isAddDisabled = false;
      } else {
        _isAddDisabled = true;
      }
    });
  }

  void addCountry() {
    if (_newCountry.isNotEmpty) {
      setState(() {
        countries.add(_newCountry);
        _newCountry = '';
      });
    }
  }

  void updateCountry() {
    setState(() {
      _country = countries[_currentIndex];
    });
  }

  void showNextCountry() {
    incIndex();
    updateCountry();
  }

  void showPreCountry() {
    decrementIndex();
    updateCountry();
  }

  void incIndex() {
    if (_currentIndex == countries.length - 1) {
      setState(() {
        //_currentIndex = 0;
        _isNextDisabled = true;
      });
    } else {
      setState(() {
        _isNextDisabled = false;
        _isPreDisabled = false;
        _currentIndex++;
      });
    }
  }

  void decrementIndex() {
    if (_currentIndex == 0) {
      setState(() {
        //_currentIndex = countries.length - 1;
        _isPreDisabled = true;
      });
    } else {
      setState(() {
        _currentIndex = _currentIndex - 1;
        _isPreDisabled = false;
        _isNextDisabled = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          SizedBox(
            width: 400, // specific value
            child: TextField(
              onChanged: textChanged,
              decoration: const InputDecoration(
                  border: OutlineInputBorder(), hintText: 'Enter your guess'),
            ),
          ),
          SizedBox(
            width: 100, // specific value
            child: MaterialButton(
              color: Colors.amber,
              onPressed: _isAddDisabled ? null : addCountry,
              child: Row(children: [
                Text("Add"),
                Icon(Icons.add),
              ]),
            ),
          ),
          Text(
            _country,
            style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 27,
                color: Colors.amber[700]),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              MaterialButton(
                color: Colors.amber,
                onPressed: _isPreDisabled ? null : showPreCountry,
                child: Row(children: [
                  Icon(Icons.keyboard_arrow_left),
                  Text("Previous"),
                ]),
              ),
              MaterialButton(
                color: Colors.amber,
                onPressed: _isNextDisabled ? null : showNextCountry,
                child: Row(children: [
                  Text("Next"),
                  Icon(Icons.keyboard_arrow_right),
                ]),
              ),
            ],
          )
        ],
      ),
    );
  }
}
