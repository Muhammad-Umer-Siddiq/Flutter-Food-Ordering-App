import 'package:flutter/material.dart';

import '../utilities/lists.dart';
import '../widgets/components/main food/categories_tile.dart';
import '../widgets/components/main food/discount_offer_tile.dart';
import '../widgets/components/main food/header_text.dart';
import '../widgets/components/main food/popular_food_tile.dart';
import '../widgets/custom widgets/elevated_button.dart';
import '../widgets/custom widgets/responsive_text.dart';
import '../widgets/custom widgets/sized_box.dart';
import 'cart_screen.dart';
import 'full_menu_screen.dart';
import 'privacy_policy_screen.dart';
import 'sign_in_screen.dart';
import 'terms_conditions_screen.dart';

// Fully responsive
// Tested on min size of 320 × 320
// Tested on full web size (1536 × 747)
// Tested on Pixel 3a mobile
// needed to perfect the UI

class MainFoodScreen extends StatefulWidget {
  const MainFoodScreen({super.key});

  @override
  State<MainFoodScreen> createState() => _MainFoodScreenState();
}

class _MainFoodScreenState extends State<MainFoodScreen> {
  @override
  Widget build(BuildContext context) {
    int width = MediaQuery.sizeOf(context).width.toInt();

    return Scaffold(
      appBar: AppBar(
        surfaceTintColor: Colors.white,
        elevation: 0,
        toolbarHeight: 60,
        actions: [
          IconButton(
            highlightColor: Colors.transparent,
            mouseCursor: MaterialStateMouseCursor.clickable,
            tooltip: 'My Cart',
            icon: const Icon(
              Icons.shopping_cart,
              size: 26,
              color: Colors.black,
            ),
            onPressed: () {
              Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(
                    builder: (context) => CartScreen(cartItems: cartItems),
                  ));
            },
          ),
        ],
      ),
      drawer: Drawer(
        backgroundColor: Colors.white,
        elevation: 0,
        child: ListView(
          children: [
            SizedBox(
              height: MediaQuery.sizeOf(context).height * 0.28,
              child: DrawerHeader(
                  child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(50),
                    child: Image.asset(
                      'assets/images/profile_pic.jpg',
                      height: 90,
                      width: 90,
                      fit: BoxFit.cover,
                    ),
                  ),
                  const Text(
                    "Ahmed",
                    style: TextStyle(fontSize: 21, fontWeight: FontWeight.bold),
                  ),
                  const Text(
                    "ahmed123@gmail.com",
                    style: TextStyle(fontSize: 18),
                  )
                ],
              )),
            ),
            Column(
              children: [
                ListTile(
                  title: const Text(
                    "Profile",
                    style: TextStyle(fontSize: 18),
                  ),
                  onTap: () {},
                  leading: const Icon(Icons.person),
                ),
                ListTile(
                  onTap: () {},
                  title: const Text(
                    "Settings",
                    style: TextStyle(fontSize: 18),
                  ),
                  leading: const Icon(Icons.settings),
                ),
                ListTile(
                  title: const Text(
                    "About us",
                    style: TextStyle(fontSize: 18),
                  ),
                  leading: const Icon(Icons.fastfood_rounded),
                  onTap: () {},
                ),
                ListTile(
                  onTap: () {},
                  title: const Text(
                    "Order History",
                    style: TextStyle(fontSize: 18),
                  ),
                  leading: const Icon(Icons.history),
                ),
                ListTile(
                  onTap: () {},
                  title: const Text(
                    "Need Help?",
                    style: TextStyle(fontSize: 18),
                  ),
                  leading: const Icon(Icons.contact_support),
                ),
                ListTile(
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const TermsConditionsScreen(),
                        ));
                  },
                  title: const Text(
                    "Terms & Conditions",
                    style: TextStyle(fontSize: 18),
                  ),
                  leading: const Icon(Icons.policy),
                ),
                ListTile(
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const PrivacyPolicyScreen(),
                        ));
                  },
                  title: const Text(
                    "Privacy Policy",
                    style: TextStyle(fontSize: 18),
                  ),
                  leading: const Icon(Icons.privacy_tip_outlined),
                ),
                const MySizedBox(heightRatio: 0.05),
                MyElevatedButton(
                  buttonText: 'Log out',
                  buttonWidthRatio: 0.4,
                  elevation: 0,
                  buttonPress: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const SignInScreen(),
                        ));
                  },
                ),
              ],
            ),
          ],
        ),
      ),
      body: SingleChildScrollView(
        child: Container(
          height: MediaQuery.of(context).size.height * 1,
          width: MediaQuery.of(context).size.width * 1,
          padding: const EdgeInsets.all(4),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Center(
                child: MyResponsiveText(
                  'Hi Ahmed',
                  scaleFactor: width > 770 ? 0.016 : 0.02,
                  color: Colors.grey.shade700,
                ),
              ),
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  MyResponsiveText(
                    'What would you like to ',
                    scaleFactor: width > 770 ? 0.016 : 0.02,
                    color: Colors.black,
                    fontWeight: FontWeight.w600,
                  ),
                  MyResponsiveText(
                    'eat?',
                    scaleFactor: width > 770 ? 0.016 : 0.02,
                    color: Colors.red.shade900,
                    fontWeight: FontWeight.w600,
                  )
                ],
              ),
              const MySizedBox(heightRatio: 0.025),
              const Expanded(flex: 0, child: DiscountOfferTile()),
              const MySizedBox(),
              const HeaderText("Categories"),
              const CategoriesTile(),
              Flexible(
                fit: FlexFit.loose,
                child: SizedBox(
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const HeaderText(
                        "Popular",
                        textAlign: TextAlign.center,
                      ),
                      GestureDetector(
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => const FullMenuScreen(),
                              ));
                        },
                        child: Text(
                          "View Full Menu",
                          textScaleFactor: 1,
                          overflow: TextOverflow.ellipsis,
                          textAlign: TextAlign.end,
                          style: TextStyle(
                              color: Colors.redAccent.shade700, fontSize: 16),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Flexible(
                  flex: width > 1000 ? 2 : 1, child: const PopularFoodTile()),
            ],
          ),
        ),
      ),
    );
  }
}
