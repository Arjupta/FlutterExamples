import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';

void main() {
  runApp(MaterialApp(
    title: 'Google_signin',
    theme: ThemeData(
      primarySwatch: Colors.blue,
      visualDensity: VisualDensity.adaptivePlatformDensity,
    ),
    home: MyHomePage(),
  ));
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  String _name, _phone;
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Google_SignIn'),
        ),
        body: Container(
          child: Column(
            children: [
              RaisedButton(
                onPressed: () async {
                  await FirebaseAuth.instance.signInAnonymously();
                  bool result = await showForm(context);
                  print(result);
                },
                child: Text('Register'),
              ),
              RaisedButton(
                onPressed: () async {
                  await FirebaseAuth.instance.signOut();
                },
                child: Text('Log out'),
              ),
            ],
          ),
        ));
  }

//  GoogleSignIn _googleSignIn = GoogleSignIn();
//     FirebaseAuth _auth = FirebaseAuth.instance;
//     Firestore _db = Firestore.instance;
//     String _name, _phone;
//     final _formKey = GlobalKey<FormState>();

  Future<bool> showForm(con) {
    final _formKey = GlobalKey<FormState>();
    bool _success = false;

    return showModalBottomSheet(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(
            top: Radius.circular(25.0),
          ),
        ),
        backgroundColor: Colors.amber,
        isScrollControlled: true,
        context: con,
        builder: (BuildContext context) {
          return SingleChildScrollView(
            child: AnimatedPadding(
              duration: const Duration(milliseconds: 100),
              curve: Curves.decelerate,
              padding: EdgeInsets.only(
                bottom: MediaQuery.of(context).viewInsets.bottom,
              ),
              child: Container(
                height: 200,
                child: Center(
                  child: Form(
                    key: _formKey,
                    child: Padding(
                      padding: EdgeInsets.symmetric(horizontal: 18),
                      child: Wrap(
                        children: <Widget>[
                          TextFormField(
                            decoration: const InputDecoration(
                                labelText: 'Name', hintText: 'John Doe'),
                            validator: (String value) {
                              if (value.isEmpty) {
                                return 'Name cannot be blank';
                              }
                              return null;
                            },
                            onSaved: (String value) {
                              _name = value;
                            },
                          ),
                          TextFormField(
                            decoration: const InputDecoration(
                                labelText: 'Phone Number',
                                hintText: '9999900000'),
                            validator: (String value) {
                              if (value.isEmpty) {
                                return 'Please enter your number';
                              }
                              if (value == '9999900000') {
                                return 'Invalid number';
                              }
                              if (value.length < 10) {
                                return 'Enter 10 digit number';
                              }
                              return null;
                            },
                            onSaved: (String value) {
                              _phone = value;
                            },
                          ),
                          Row(
                            mainAxisSize: MainAxisSize.max,
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: <Widget>[
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: RaisedButton(
                                  color: Color(0xffe4faff),
                                  child: Text("Submit"),
                                  onPressed: () async {
                                    if (_formKey.currentState.validate()) {
                                      _formKey.currentState.save();
                                      _success = await signUp(context);
                                      Navigator.pop(context);
                                    }
                                  },
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: FlatButton(
                                  color: Colors.transparent,
                                  child: Text("Already a user?"),
                                  onPressed: () async {
                                    _success = await signIn(context);
                                    Navigator.pop(context);
                                  },
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ),
          );
        }).then((value) => _success);
  }

  Future<bool> signUp(con) async {
    GoogleSignIn _googleSignIn = GoogleSignIn();
    FirebaseAuth _auth = FirebaseAuth.instance;
    Firestore _db = Firestore.instance;
    try {
      print("try");
      GoogleSignInAccount googleUser =
          await _googleSignIn.signIn().catchError((onError) {
        print(onError);
      });
      GoogleSignInAuthentication googleAuth = await googleUser.authentication;
      final AuthCredential credential = GoogleAuthProvider.getCredential(
        idToken: googleAuth.idToken,
        accessToken: googleAuth.accessToken,
      );

      FirebaseUser user = (await _auth.signInWithCredential(credential)).user;
      Map<String, dynamic> userData = {
        'name': _name,
        'phone': _phone,
        'email': googleUser.email
      };
      var doc = await _db.collection('app-user').document(user.uid).get();
      //.document(user.uid).get();
      if (!doc.exists) {
        await _db
            .collection('app-user')
            .document(user.uid)
            .setData(userData)
            .then((value) => {
                  // Scaffold.of(con).showSnackBar(SnackBar(
                  //   //TODO : Toast widget "User Created"
                  //   content: Text("User Created"),
                  // ))
                });
        print("User Created");
      } else {
        // Scaffold.of(con).showSnackBar(SnackBar(
        //   //TODO : Toast widget "Already a User"
        //   content: Text("Already a User"),
        // ));
        print("Already a User");
      }
      return true;
    } catch (e) {
      print("catch - $e");
      await _auth.signOut();
      await _auth.signInAnonymously();
      return false;
    }
  }

  Future<bool> signIn(con) async {
    GoogleSignIn _googleSignIn = GoogleSignIn();
    FirebaseAuth _auth = FirebaseAuth.instance;
    Firestore _db = Firestore.instance;
    try {
      print("try");
      GoogleSignInAccount googleUser =
          await _googleSignIn.signIn().catchError((onError) {
        print("chacha " + onError);
      });
      GoogleSignInAuthentication googleAuth = await googleUser.authentication;
      final AuthCredential credential = GoogleAuthProvider.getCredential(
        idToken: googleAuth.idToken,
        accessToken: googleAuth.accessToken,
      );
      FirebaseUser user = (await _auth.signInWithCredential(credential)).user;
      var doc = await _db.collection('app-user').document(user.uid).get();
      if (!doc.exists) {
        // Scaffold.of(con).showSnackBar(SnackBar(
        //   //TODO : Toast widget "User Created"
        //   content: Text("Not a User"),
        // ));
        print("Not a user");
        await _auth.signOut();
        await _auth.signInAnonymously();
        return false;
      } else {
        // Scaffold.of(con).showSnackBar(SnackBar(
        //   //TODO : Toast widget "Already a User"
        //   content: Text("Logged In"),
        // ));
        print("Logged In");
        return true;
      }
    } catch (e) {
      print("catch - $e");
      await _auth.signOut();
      await _auth.signInAnonymously();
      return false;
    }
  }
}
//  Column(
//   mainAxisAlignment: MainAxisAlignment.center,
//   mainAxisSize: MainAxisSize.min,
//   children: <Widget>[
//     TextFormField(
//       decoration: const InputDecoration(
//           labelText: 'Name', hintText: 'John Doe'),
//       validator: (String value) {
//         if (value.isEmpty) {
//           return 'Name cannot be blank';
//         }
//         return null;
//       },
//       onSaved: (String value) {
//         // _name = value;
//       },
//     ),
//     TextFormField(
//       decoration: const InputDecoration(
//           labelText: 'Phone Number', hintText: '9999900000'),
//       validator: (String value) {
//         if (value.isEmpty) {
//           return 'Please enter your number';
//         }
//         if (value == '9999900000') {
//           return 'Invalid number';
//         }
//         if (value.length < 10) {
//           return 'Enter 10 digit number';
//         }
//       },
//       onSaved: (String value) {
//         // _phone = value;
//       },
//     ),
//     RaisedButton(
//         child: const Text('Close BottomSheet'),
//         onPressed: () {
//           Navigator.pop(context);
//           _success = false;
//         })
//   ],
// ),
