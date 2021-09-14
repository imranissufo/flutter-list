import 'dart:io';

void main() {
  //variablesAndPrinting();
  //forLoops();
  //whileAndIfAndContinue();
  //readInput();

  User u1 = new User("imran");
  u1.id = 1;
  u1.printUserData();

  User u2 = new User.withEmail("imran", "email");
  u2.id = 2;
  u2.printUserData();

  User u3 = new User.withEmailAndAge("imran", "email", 33);
  u3.id = 3;
  u3.printUserData();

  print(User.MAX_AGE);
}

//simplified method for one instruction methods
void simpleMethod1() => print('object');
void simpleMethod2() {
  print('object');
}

void readInput() {
  //NON nullable string
  String message = "some value";
  print(message);

  print("Please enter your name");
  //nullable string = String?
  String? username = stdin.readLineSync();
  print("Hello $username");

  print("Please enter your age");
  int age = int.parse(stdin.readLineSync()!);
  print("Age $age");

  print("Please enter your age");
  String? userInput = stdin.readLineSync();
  if (userInput != null) {
    int age = int.parse(userInput);
    print("Age $age");
  }

  var theList = ["MZ", "SA"];
  var theIndex = 0;
  print(getItem(theList, theIndex));
}

String? getItem(List<String> myList, int index) {
  if (index < myList.length && index >= 0) {
    return myList[index];
  } else {
    return null;
  }
}

void whileAndIfAndContinue() {
  int x = 0;
  while (x < 10) {
    print("Value of X = $x");
    x++;
    if (x < 5) {
      print("continue...");
      continue;
    }
    print("breaking...");
    break;
  }
}

void forLoops() {
  for (var i = 0, j = 10, k = 20; i < 10; i++, j++, k++) {
    print("Current index $i, $j, $k");
  }

  var list = [10, 20, 30, 40, 50, 60, 70];
  List<int> list2 = [10, 20, 30, 40, 50, 60, 70];

  for (var item in list) {
    print(item);
    print("$item");
  }

  List<String> list3 = ["MZ", "SA", "EN"];
  for (var item in list3) {
    print(item);
    print("$item");
  }

  for (var i = 0; i < list3.length; i++) {
    print(list3[i]);
  }
}

void variablesAndPrinting() {
  int x = 10;
  print(x);

  String message = "hello";
  print("Message value is $message ");

  double salary = 14.25;
  print("Printing salary value $salary\$");

  var email = "me@gmail.com";
  print("$email");

  var age = 40;
  print("Age $age");
}

class User {
  static var MAX_AGE = 100;

  int id = 0;
  String name = "";

  //nullable fields
  int? age;
  String? email;

/*
  User(String name) {
    this.name = name;
  }
*/

  User(this.name);
  User.withEmail(this.name, this.email);
  User.withEmailAndAge(this.name, this.email, this.age);

  //User({required this.name, this.age}); //Named arguments constructor
  // var u1 = User(name:'Sheikh', age:31)
  // var u2 = User(age:41, name:'Mufti')

  void printUserData() {
    print("$id User $name is $age years old and you can contact him on $email");
  }
}
