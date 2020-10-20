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
    return Scaffold(
      body: SafeArea(
        child: Stack(
          children: [
            CustomPaint(
              size: Size(
                  double.infinity,
                  double
                      .infinity), //You can Replace this with your desired WIDTH and HEIGHT
              painter: SideNavPainter(),
            ),
            Container(
                margin: EdgeInsets.only(
                    top: MediaQuery.of(context).size.height * 0.13, left: 10),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    CircleAvatar(
                      backgroundColor: Colors.white,
                      radius: 35,
                      child: Icon(
                        Icons.ac_unit,
                        size: 50,
                        color: Colors.black,
                      ),
                    ),
                    Expanded(
                      child: ListView.builder(
                        itemBuilder: (context, index) {
                          return Icon(Icons.ac_unit_outlined);
                        },
                        itemCount: 4,
                      ),
                    )
                  ],
                ))
          ],
        ),
      ),
    );
  }
}

class SideNavPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    Paint paint = new Paint()
      ..color = Color.fromARGB(255, 33, 150, 243)
      ..style = PaintingStyle.fill
      ..strokeWidth = 1;
    double barWidth = size.width * 0.13;
    double curveWidth = size.width * 0.30;
    double bezierWidth = size.width * 0.17;
    double curveHeight = size.height * 0.19;
    Path path = Path();
    path.lineTo(0, size.height);
    path.lineTo(barWidth, size.height);
    path.lineTo(barWidth, size.height * 0.33);
    path.quadraticBezierTo(
        barWidth, size.height * 0.30, bezierWidth, size.height * 0.28);
    path.cubicTo(curveWidth, size.height * 0.25, curveWidth, size.height * 0.13,
        bezierWidth, size.height * 0.10);
    path.quadraticBezierTo(barWidth, size.height * 0.08, barWidth, 0);
    path.lineTo(barWidth, 0);
    path.close();

    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}
