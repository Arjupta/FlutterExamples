import 'package:flutter/material.dart';
import 'package:drinks/screens/authenticate/register_page.dart';
import 'package:drinks/screens/authenticate/login_page.dart';

class Authenticate extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blueGrey,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Text(
            'What Do You\nWant To Do',
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 25,
              color: Colors.white,
            ),
          ),
          SizedBox(
            height: 40,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              MaterialButton(
                color: Colors.white70,
                child: Text('Register'),
                onPressed: () {
                  Navigator.of(context)
                      .push(MaterialPageRoute(builder: (_) => Register()));
                },
              ),
              SizedBox(
                width: 10,
              ),
              MaterialButton(
                color: Colors.white70,
                child: Text('Login'),
                onPressed: () {
                  Navigator.of(context)
                      .push(MaterialPageRoute(builder: (_) => Login()));
                },
              ),
            ],
          )
        ],
      ),
    );
  }
}
