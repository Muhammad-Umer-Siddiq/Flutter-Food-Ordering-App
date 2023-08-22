import 'package:flutter/material.dart';

import '../widgets/custom_widgets/custom_elevated_button.dart';
import '../widgets/custom_widgets/custom_sized_box.dart';
import 'main_food_screen.dart';

// Fully responsive
// Tested on min size of 320 × 320
// Tested on full web size (1536 × 747)
// Tested on Pixel 3a mobile

class OnBoardingScreen extends StatefulWidget {
  const OnBoardingScreen({super.key});

  @override
  State<OnBoardingScreen> createState() => _OnBoardingScreenState();
}

class _OnBoardingScreenState extends State<OnBoardingScreen> {
  final PageController pageController = PageController();
  int currentPageNo = 0;
  final int totalPages = 3;

  final List<String> _bgImages = [
    'assets/images/bg_animated_image1.png',
    'assets/images/bg_animated_image2.png',
    'assets/images/bg_animated_image3.png',
  ];
  final List<String> _titles = [
    'Order for Food',
    'Swift delivery',
    'Eat and Enjoy',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView.builder(
        controller: pageController,
        itemCount: totalPages,
        physics: const AlwaysScrollableScrollPhysics(),
        scrollDirection: Axis.horizontal,
        onPageChanged: (value) {
          setState(() {
            currentPageNo = value;
          });
        },
        itemBuilder: (context, index) => Container(
            width: double.infinity,
            height: double.infinity,
            padding: const EdgeInsets.all(8),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const MySizedBox(heightRatio: 0.13),
                Image.asset(_bgImages[index]),
                const MySizedBox(heightRatio: 0.1),
                Text(
                  _titles[index],
                  textScaleFactor: 1,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  textAlign: TextAlign.center,
                  style: const TextStyle(
                    fontSize: 28,
                    color: Colors.red,
                  ),
                ),
                const MySizedBox(),
                Container(
                  width: 80,
                  height: 25,
                  alignment: Alignment.center,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: List.generate(
                        3,
                        (containerIndex) => Container(
                              width: 15,
                              height: 15,
                              decoration: BoxDecoration(
                                  color: currentPageNo == containerIndex
                                      ? Colors.red
                                      : Colors.white,
                                  border:
                                      Border.all(color: Colors.red.shade600),
                                  borderRadius: BorderRadius.circular(7.5)),
                            )),
                  ),
                ),
                const MySizedBox(),
                MyElevatedButton(
                  buttonText: currentPageNo == 2 ? 'Get Started' : 'Skip',
                  buttonPress: () {
                    currentPageNo == 2
                        ? Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const MainFoodScreen(),
                            ))
                        : pageController.jumpToPage(totalPages - 1);
                  },
                )
              ],
            )),
      ),
    );
  }
}
