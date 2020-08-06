import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:drinks/screens/authenticate/authenticate.dart';
import 'package:drinks/screens/homepage/home.dart';

class Wrapper extends StatefulWidget {
  @override
  _WrapperState createState() => _WrapperState();
}

class _WrapperState extends State<Wrapper> {
  FirebaseUser user;
  void initialise() async {
    try {
      FirebaseUser u = await FirebaseAuth.instance.currentUser();
      setState(() {
        user = u;
      });
    } catch (e) {
      setState(() {
        user = null;
      });
    }
  }

  @override
  void initState() {
    initialise();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    if (user == null)
      return Authenticate();
    else
      return Home();
  }
}
