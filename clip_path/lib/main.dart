import 'package:clip_path/routing.dart';
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
  List<SideNavRouteItem> screenList = [
    SideNavRouteItem(icon: Icons.home, name: "Home"),
    SideNavRouteItem(icon: Icons.person_outline, name: "Profile"),
    SideNavRouteItem(icon: Icons.notifications, name: "Notification"),
    SideNavRouteItem(icon: Icons.search, name: "Search"),
    SideNavRouteItem(icon: Icons.star, name: "Favourite"),
  ];
  SideNavRouteItem selected;

  @override
  void initState() {
    super.initState();
    selected = screenList.first;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Stack(
          children: [
            CustomPaint(
              size: Size(double.infinity, double.infinity),
              painter: SideNavPainter(),
            ),
            Container(
              width: MediaQuery.of(context).size.width * 0.3,
              margin: EdgeInsets.only(
                  top: MediaQuery.of(context).size.height * 0.13, left: 5),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  CircleAvatar(
                    backgroundColor: Colors.white,
                    radius: 35,
                    child: Icon(
                      selected.icon,
                      size: 50,
                      color: Colors.black,
                    ),
                  ),
                  SizedBox(height: 40),
                  Flexible(
                    child: ListView.builder(
                      itemBuilder: (context, index) {
                        if (selected.key != screenList.elementAt(index).key)
                          return Padding(
                            padding: EdgeInsets.symmetric(vertical: 8.0),
                            child: Align(
                              alignment: Alignment.centerLeft,
                              child: NavBarTile(
                                screen: screenList.elementAt(index),
                                onTap: () {
                                  selected = screenList.elementAt(index);
                                  setState(() {});
                                },
                              ),
                            ),
                          );
                        else
                          return SizedBox();
                      },
                      itemCount: screenList.length,
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}

class NavBarTile extends StatefulWidget {
  final Function onTap;
  final SideNavRouteItem screen;
  NavBarTile({this.onTap, this.screen});
  @override
  _NavBarTileState createState() => _NavBarTileState();
}

class _NavBarTileState extends State<NavBarTile> {
  @override
  Widget build(BuildContext context) {
    return CircleAvatar(
      backgroundColor: Colors.white,
      radius: 22,
      child: InkWell(
        onTap: widget.onTap,
        child: Icon(
          widget.screen.icon,
          size: 35,
          color: Colors.black,
        ),
      ),
    );
  }
}

class SideNavPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    var rect = Offset.zero & size;

    Paint paint = new Paint()
      ..style = PaintingStyle.fill
      ..shader = LinearGradient(
        begin: Alignment.topRight,
        end: Alignment.bottomLeft,
        stops: [0.3, 0.7],
        colors: [
          Color.fromRGBO(207, 38, 138, 1),
          Color.fromRGBO(107, 7, 114, 1),
        ],
      ).createShader(rect);
    double barWidth = size.width * 0.15;
    double curveWidth = size.width * 0.30;
    double bezierWidth = size.width * 0.19;
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
