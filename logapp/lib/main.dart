import 'package:flutter/material.dart';
import 'package:logger/logger.dart';
import 'package:logapp/log_printer.dart';
import 'package:firebase_analytics/firebase_analytics.dart';
import 'package:firebase_analytics/observer.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  static FirebaseAnalytics analytics = FirebaseAnalytics();
  static FirebaseAnalyticsObserver observer =
      FirebaseAnalyticsObserver(analytics: analytics);
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      navigatorObservers: <NavigatorObserver>[observer],
      home: MyHomePage(
          title: 'Log App', analytics: analytics, observer: observer),
    );
  }
}

class MyHomePage extends StatefulWidget {
  final FirebaseAnalytics analytics;
  final FirebaseAnalyticsObserver observer;

  MyHomePage({Key key, this.title, this.analytics, this.observer})
      : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;
  final logger = Logger(printer: SimplePrinter("myClass"));

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
    logger.v('You don\'t always want to see all of these');
    logger.d('Logs a debug message');
    logger.i('Public Function called');
    logger.w('This might become a problem');
    logger.e('Something has happened');
    _sendAnalytics();
  }

  Future<Null> _sendAnalytics() async {
    await widget.analytics
        .logEvent(name: "tap_to_plus", parameters: <String, dynamic>{
      'string': 'string',
      'int': 42,
      'long': 12345678910,
      'double': 42.0,
      'bool': true,
    });
  }

  Future<Null> _currentScreen() async {
    await widget.analytics.setCurrentScreen(
        screenName: "homescreen", screenClassOverride: "Main");
  }

  @override
  Widget build(BuildContext context) {
    _currentScreen();
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'You have pushed the button this many times:',
            ),
            Text(
              '$_counter',
              style: Theme.of(context).textTheme.headline4,
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: Icon(Icons.add),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
