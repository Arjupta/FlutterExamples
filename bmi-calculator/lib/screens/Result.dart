import 'package:flutter/material.dart';
import '../common/constants.dart';
import '../components/reusable_card.dart';
import '../components/bottom_button.dart';

class Result extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('BMI Calculator'),
      ),
      body: Container(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Expanded(
            flex: 1,
            child: Text(
              "Your Result",
              style: kTitleTextStyle,
            ),
          ),
          Expanded(
            flex: 5,
            child: ReusableCard(
              colour: kActiveCardColor,
              cardChild: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    "Result",
                    style: kResultTextStyle,
                  ),
                  Text(
                    "18.9",
                    style: kBMITextStyle,
                  ),
                  Text(
                    "Your Result is low jdksjdkddjwldkjdlkwjojfwjwokd",
                    textAlign: TextAlign.center,
                    style: kBodyTextStyle,
                  ),
                ],
              ),
            ),
          ),
          BottomButton(
            onPress: () {
              Navigator.pop(context);
            },
            title: "RE-CALCULATE",
          ),
        ],
      )),
    );
  }
}
