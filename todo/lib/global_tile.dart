import 'package:flutter/material.dart';
import 'package:todo/neu_button.dart';

import 'constants.dart';

class GlobalTile extends StatelessWidget {
  final String title;
  final String title2;
  final String title3;
  final Function onIconPressed;
  final IconData icon;
  final bool transform;
  const GlobalTile({
    @required this.title,
    @required this.title2,
    @required this.title3,
    this.transform = true,
    this.onIconPressed,
    this.icon,
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Transform.translate(
      offset: Offset(
          transform ? MediaQuery.of(context).size.width * 0.2 : 0.0, 0.0),
      child:
          // elevation: 0.0,
          Container(
        width: MediaQuery.of(context).size.width,
        height: 100,
        padding: EdgeInsets.only(bottom: 12.0),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: backgroundColor,
          boxShadow: [
            BoxShadow(color: shadowColor, offset: Offset(8, 6), blurRadius: 12),
            BoxShadow(
                color: lightShadowColor,
                offset: Offset(-8, -6),
                blurRadius: 12),
          ],
        ),
        child: NeuButton(
            title: title,
            title2: title2,
            title3: title3,
            icon: icon,
            onPressed: onIconPressed),
      ),
    );
  }
}
