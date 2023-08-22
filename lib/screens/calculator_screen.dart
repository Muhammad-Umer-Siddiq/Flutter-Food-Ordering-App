import 'package:flutter/material.dart';

import '../utilities/colors.dart';
import '../utilities/helpers.dart';
import '../utilities/lists.dart';
import '../utilities/values.dart';
import '../widgets/components/calculator/display_container.dart';
import '../widgets/components/calculator/on_screen_button.dart';

class CalculatorScreen extends StatefulWidget {
  const CalculatorScreen({super.key});

  @override
  State<CalculatorScreen> createState() => _CalculatorScreenState();
}

class _CalculatorScreenState extends State<CalculatorScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: Drawer(
        backgroundColor: Colors.orange.shade200,
        child: ListView(
          children: const [
            DrawerHeader(
              child: Column(),
            ),
            Column(),
          ],
        ),
      ),
      appBar: AppBar(
          elevation: 0,
          backgroundColor: CalculatorColors().appbarColor,
          actions: [
            IconButton(
              tooltip: 'Home',
              icon: const Icon(
                Icons.home_outlined,
                color: Colors.black,
                size: 28,
              ),
              onPressed: () {
                Navigator.pop(context);
              },
            ),
          ]),
      backgroundColor: CalculatorColors().backgroundColor,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
              child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              SizedBox(height: MediaQuery.sizeOf(context).height * 0.03),
              DisplayContainer(insideText: userQuestion),
              DisplayContainer(
                  childAlignment: Alignment.centerRight,
                  insideText: userAnswer,
                  topPadding: 1,
                  textSize: 50),
            ],
          )),
          Expanded(
            flex: 2,
            child: SizedBox(
              width: MediaQuery.sizeOf(context).width * 1,
              child: Padding(
                padding: const EdgeInsets.all(3.0),
                child: GridView.builder(
                  itemCount: screenButtons.length,
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    mainAxisExtent: buttonSize,
                    crossAxisCount: totalButtons,
                  ),
                  itemBuilder: (context, index) {
                    // Clear Button
                    if (index == 0) {
                      return OnScreenButton(
                        buttonSingleTap: () => setState(() {
                          userQuestion = '';
                          userAnswer = '';
                        }),
                        buttonText: screenButtons[index],
                        buttonColor: CalculatorColors().clearButtonColor,
                      );
                    }
                    // Delete Button
                    else if (index == 1) {
                      return OnScreenButton(
                        buttonLongPress: () => setState(() {
                          userQuestion = '';
                        }),
                        buttonSingleTap: () => setState(() {
                          userQuestion = userQuestion.substring(
                              0, userQuestion.length - 1);
                        }),
                        buttonText: screenButtons[index],
                        buttonColor: CalculatorColors().deleteButtonColor,
                      );
                    }
                    // Equals to Button
                    else if (index == screenButtons.length - 3) {
                      return OnScreenButton(
                        buttonSingleTap: () => setState(() {
                          CalculatorHelpers().equalPressed();
                        }),
                        textSize: 40,
                        textColor: CalculatorColors().equalsTextColor,
                        buttonText: screenButtons[index],
                        buttonColor: CalculatorColors().equalsButtonColor,
                      );
                    }

                    // Rest Number Buttons
                    else {
                      return OnScreenButton(
                        buttonSingleTap: () => setState(() {
                          userQuestion += screenButtons[index];
                        }),
                        buttonText: screenButtons[index],
                        textColor: CalculatorHelpers()
                                .specialOperators(screenButtons[index])
                            ? CalculatorColors()
                                .specialOperatorTextColor // For special operators
                            : CalculatorColors().numbersTextColor,
                        buttonColor: CalculatorHelpers()
                                .specialOperators(screenButtons[index])
                            ? CalculatorColors().specialOperatorButtonColor
                            : CalculatorColors().numbersButtonColor,
                      );
                    }
                  },
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
