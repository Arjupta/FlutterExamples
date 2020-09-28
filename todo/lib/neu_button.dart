import 'package:flutter/material.dart';

import 'constants.dart';

class NeuButton extends StatelessWidget {
  final String title;
  final String title2;
  final String title3;
  final Color fileColor;
  final IconData icon;
  final Function onPressed;
  const NeuButton(
      {@required this.title,
      @required this.title2,
      this.fileColor,
      @required this.title3,
      @required this.icon,
      this.onPressed,
      Key key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 85,
      width: MediaQuery.of(context).size.width,
      child: ListTile(
        title: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            NeuIcon(icon: icon, fileColor: fileColor, onPressed: onPressed),
            SizedBox(
              width: 24.0,
            ),
            Flexible(
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      title,
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(fontSize: 16.0),
                    ),
                    SizedBox(
                      height: 4,
                    ),
                    Text(
                      title2,
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(fontSize: 14.0, color: Colors.black54),
                    ),
                    SizedBox(
                      height: 8,
                    ),
                    Text(
                      title3,
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(color: Colors.black54, fontSize: 14.0),
                    ),
                  ]),
            ),
          ],
        ),
      ),
    );
  }
}

class NeuIcon extends StatelessWidget {
  const NeuIcon({
    Key key,
    @required this.icon,
    this.fileColor,
    this.onPressed,
  }) : super(key: key);

  final IconData icon;
  final Color fileColor;
  final Function onPressed;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 65,
      width: 65,
      child: IconButton(
        icon: Icon(icon),
        color: fileColor ?? Colors.grey[570],
        onPressed: onPressed,
      ),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(5),
        color: backgroundColor,
        boxShadow: [
          BoxShadow(color: shadowColor, offset: Offset(10, 10), blurRadius: 12),
          BoxShadow(
              color: lightShadowColor,
              offset: Offset(-10, -10),
              blurRadius: 12),
        ],
      ),
    );
  }
}
