import 'package:flutter/material.dart';
import '../common/constants.dart';

class BottomButton extends StatelessWidget {
  const BottomButton({this.onPress, this.title});
  final Function onPress;
  final String title;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPress,
      child: Container(
        alignment: Alignment.center,
        color: kBottomColor,
        margin: EdgeInsets.only(top: 15),
        height: kBottomContainerHeight,
        child: Text(
          title,
          style: kLargeButtonTextStyle,
        ),
      ),
    );
  }
}
