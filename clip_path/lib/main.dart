import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: ColumnRectangle(),
    );
  }
}

class ColumnRectangle extends StatefulWidget {
  @override
  _ColumnRectangleState createState() => _ColumnRectangleState();
}

class _ColumnRectangleState extends State<ColumnRectangle> {
  @override
  Widget build(BuildContext context) {
    CustomClipper<Rect> clipper() {}
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: ClipPath(
            clipper: MyCustomClipper(),
            child: Container(
              decoration: BoxDecoration(
                // borderRadius: BorderRadius.horizontal(
                //     left: Radius.lerp(
                //         Radius.circular(-10), Radius.circular(-10), 1.0),
                //     right: Radius.circular(50)),
                color: Colors.amber,
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class MyCustomClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    double width = size.width;
    double height = size.height;
    final path = Path();
    path.lineTo(0.0, size.height);
    path.quadraticBezierTo(
        size.width / 2, size.height - 100, size.width, size.height);
    path.lineTo(size.width, 0.0);
    path.close();
    return path;
  }

  @override
  bool shouldReclip(CustomClipper oldClipper) {
    return false;
  }
}
