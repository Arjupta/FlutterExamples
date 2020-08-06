import 'package:flutter/material.dart';

// Import the firebase_core plugin
import 'package:firebase_core/firebase_core.dart';
//Import the firebase_auth plugin
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:drinks/screens/authenticate/wrapper.dart';

void main() {
  runApp(MaterialApp(
    home: App(),
  ));
}

class App extends StatefulWidget {
  _AppState createState() => _AppState();
}

class _AppState extends State<App> {
  // Set default `_initialized` and `_error` state to false
  bool _initialized = false;
  bool _error = false;

  // Define an async function to initialize FlutterFire
  void initializeFlutterFire(firstInit) async {
    try {
      // Wait for Firebase to initialize and set `_initialized` state to true
      if (firstInit) {
        await Firebase.initializeApp();
        setState(() {
          _initialized = true;
        });
      } else {
        Firebase.initializeApp().then((value) => {
              setState(() {
                _initialized = true;
              })
            });
      }
    } catch (e) {
      // Set `_error` state to true if Firebase initialization fails
      setState(() {
        _error = true;
      });
    }
  }

  @override
  void initState() {
    initializeFlutterFire(true);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    // Show error message if initialization failed
    if (_error) {
      //return SomethingWentWrong();
      return Scaffold(
        backgroundColor: Colors.red[100],
        appBar: AppBar(
          centerTitle: true,
          title: Text('Drinks'),
        ),
        body: Column(
          children: <Widget>[
            Text('Something Went Wrong'),
          ],
        ),
      );
    }

    // Show a loader until FlutterFire is initialized
    if (!_initialized) {
      // return Loading();
      initializeFlutterFire(false);
      return Scaffold(
        backgroundColor: Colors.amber[200],
        appBar: AppBar(
          centerTitle: true,
          title: Text('Drinks'),
        ),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text('Please Wait'),
            const SpinKitPouringHourglass(color: Colors.white)
          ],
        ),
      );
    }
    return Wrapper();
  }
}
