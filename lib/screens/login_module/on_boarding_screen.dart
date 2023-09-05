import '../../utilities/imports.dart';

class OnBoardingScreen extends StatefulWidget {
  const OnBoardingScreen({super.key});

  @override
  State<OnBoardingScreen> createState() => _OnBoardingScreenState();
}

class _OnBoardingScreenState extends State<OnBoardingScreen> {
  final PageController _pageController = PageController();
  int _currentPageNo = 0;
  final int _totalPages = 3;

  final List<String> _bgImages = [
    'assets/images/image1.png',
    'assets/images/image2.png',
    'assets/images/image3.png',
  ];
  final List<String> _titles = [
    'FIND YOUR FOOD',
    'FAST DELIVERY',
    "SECURE THE TOP-NOTCH DEALS IN YOUR AREA."
  ];
  final List<String> _description = [
    "Choose the best food from our shop, we provide a wide variety of food from all over the world",
    "You just have to wait for your order to arrive and our courier will deliver your food so fast and safely",
    "Snag the top bargains and discounts out there and cut down on your expenses with every purchase"
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView.builder(
        controller: _pageController,
        itemCount: _totalPages,
        physics: const AlwaysScrollableScrollPhysics(),
        scrollDirection: Axis.horizontal,
        onPageChanged: (value) {
          setState(() {
            _currentPageNo = value;
          });
        },
        itemBuilder: (context, index) => BackgroundTile(
            padding: const EdgeInsets.all(8),
            opacity: 60,
            bgImage: AssetImage(_bgImages[index]),
            frontContent: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                const CustomSizedBox(),
                Text(
                  _titles[index],
                  textScaleFactor: 1,
                  textAlign: TextAlign.center,
                  style: const TextStyle(
                    fontSize: 24,
                    color: Colors.white,
                  ),
                ),
                const CustomSizedBox(),
                Text(
                  _description[index],
                  textScaleFactor: 1,
                  textAlign: TextAlign.start,
                  style: const TextStyle(
                    fontSize: 15,
                    color: Colors.white,
                  ),
                ),
                const CustomSizedBox(),
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
                              width: _currentPageNo == containerIndex ? 9 : 8,
                              height: 8,
                              decoration: BoxDecoration(
                                  color: _currentPageNo == containerIndex
                                      ? Colors.red
                                      : Colors.white,
                                  border:
                                      Border.all(color: Colors.red.shade600),
                                  borderRadius: BorderRadius.circular(7.5)),
                            )),
                  ),
                ),
                const CustomSizedBox(),
                CustomElevatedButton(
                  maxWidth: 380,
                  buttonWidthRatio: 0.68,
                  elevation: 20,
                  buttonText:
                      _currentPageNo == _totalPages - 1 ? "Let's Eat" : "Next",
                  buttonPress: () {
                    _currentPageNo == _totalPages - 1
                        ? Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const MainFoodScreen(),
                            ))
                        : _pageController.jumpToPage(_currentPageNo + 1);
                  },
                ),
                const CustomSizedBox(
                  heightRatio: 0.03,
                ),
              ],
            )),
      ),
    );
  }
}
