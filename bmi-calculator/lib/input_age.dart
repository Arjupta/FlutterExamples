import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:bmi_calculator/icon_content.dart';
import 'package:bmi_calculator/reusable_card.dart';

const bottomContainerHeight = 80.0;
const normalCardColor = Color(0xFF1D11E3);
const activeCardColor = Color(0x771D11E3);
const bottomColor = Color(0xFF1D8285);
enum Gender { male, female }

class InputPage extends StatefulWidget {
  @override
  _InputPageState createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {
  // Color maleCardColor = normalCardColor;
  // Color femaleCardColor = normalCardColor;

  // void updateColor(Gender gender) {
  //   //male card pressed
  //   if (gender == Gender.male) {
  //     if (maleCardColor == normalCardColor)
  //       setState(() {
  //         maleCardColor = activeCardColor;
  //         femaleCardColor = normalCardColor;
  //       });
  //     else
  //       setState(() {
  //         maleCardColor = normalCardColor;
  //       });
  //   }
  //   //female card pressed
  //   if (gender == Gender.female) {
  //     if (femaleCardColor == normalCardColor)
  //       setState(() {
  //         femaleCardColor = activeCardColor;
  //         maleCardColor = normalCardColor;
  //       });
  //     else
  //       setState(() {
  //         femaleCardColor = normalCardColor;
  //       });
  //   }
  // }

  Gender selectedGender;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('BMI CALCULATOR'),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Expanded(
            child: Row(
              children: [
                Expanded(
                  child: ReusableCard(
                    colour: selectedGender == Gender.male
                        ? activeCardColor
                        : normalCardColor,
                    cardChild: IconWidget(
                      label: 'Male',
                      icon: FontAwesomeIcons.mars,
                    ),
                    function: () {
                      print("male");
                      // updateColor(Gender.male);
                      setState(() {
                        selectedGender = Gender.male;
                      });
                    },
                  ),
                ),
                Expanded(
                  child: ReusableCard(
                    colour: selectedGender == Gender.female
                        ? activeCardColor
                        : normalCardColor,
                    cardChild: IconWidget(
                      label: 'Female',
                      icon: FontAwesomeIcons.venus,
                    ),
                    function: () {
                      print("female");
                      // updateColor(Gender.female);
                      setState(() {
                        selectedGender = Gender.female;
                      });
                    },
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: ReusableCard(
              colour: normalCardColor,
            ),
          ),
          Expanded(
            child: Row(
              children: [
                Expanded(
                  child: ReusableCard(
                    colour: normalCardColor,
                  ),
                ),
                Expanded(
                  child: ReusableCard(
                    colour: normalCardColor,
                  ),
                ),
              ],
            ),
          ),
          Container(
            color: bottomColor,
            margin: EdgeInsets.only(top: 15),
            height: bottomContainerHeight,
          ),
        ],
      ),
    );
  }
}
