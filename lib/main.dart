import 'package:flutter/material.dart';
import 'package:todo_list/home_page.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: Scaffold(
          appBar: AppBar(
            title: Text("Todo"),
          ),
          body: HomePage(),
          floatingActionButton: FloatingActionButton(
            onPressed: () => {
              print(_square(5)),
              print(_profit()),
              print(_profit(30)),
              print(_fullName(lastName: "Maharjan", firstName: "Amar")),
              _addToCart('Potato'),
              _printNumbers(10),
              errorHandling(),
              checkAge(getAge(100)),
            },
            child: Icon(Icons.add),
          ),
        ));
  }

  /// Functions example
  /// Simple function
  double _square(double value) {
    return value * value;
  }

  /// optional parameter function
  double _profit([double sp = 50, double cp = 40]) {
    return sp - cp;
  }

  /// named parameter function
  String _fullName({String firstName, String lastName}) {
    return firstName + " " + lastName;
  }

  /// mix
  void _addToCart(String name, {quantity: 1}) {
    print(name + " " + quantity.toString());
  }

  /// assignment
  void _printNumbers(int max) {
    for (int i = 0; i < max; i++) {
      if (i == max / 2) {
        print("Halfway reached");
      }
      print(i);
    }
  }

  /// error handling {
  void errorHandling() {
    try {
      int age;
      int dogYears = 7;
      //custom exceptions
      if (dogYears != 7) throw new Exception('dog years must be 7');
      if (age == null) throw new NullThrownError();
      print(age * dogYears);
    } on NullThrownError {
      print('The value was null!!!');
    } on NoSuchMethodError {
      print('Sorry no such method');
    } catch (e) {
      print('Unknown error: ${e.toString()}');
    } finally {
      print('complete');
    }
  }

  /// Assignment start
  int getAge(int age) {
    return age;
  }

  void checkAge(int age) {
    String result;
    try {
      if (age < 18) throw new Exception("too young");
      if (age > 99) throw new Exception("too old");
    } catch (e) {
      result = e.toString();
    } finally {
      print(result);
    }
  }

  /// Assignment end

  Future<void> _showMyDialog(context) async {
    return showDialog<void>(
      context: context,
      barrierDismissible: false, // user must tap button!
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('AlertDialog Title'),
          content: SingleChildScrollView(
            child: ListBody(
              children: <Widget>[
                Text('This is a demo alert dialog.'),
                Text('Would you like to approve of this message?'),
              ],
            ),
          ),
          actions: <Widget>[
            TextButton(
              child: Text('Approve'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }
}
