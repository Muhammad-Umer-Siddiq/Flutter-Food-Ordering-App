import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:food_ordering_app/screens/main_food_screen.dart';
import 'package:food_ordering_app/widgets/components/main_food/drinks_tab.dart';
import 'package:food_ordering_app/widgets/components/main_food/meals_tab.dart';
import 'package:food_ordering_app/widgets/components/main_food/popular_food_tab.dart';

class FullMenuScreen extends StatefulWidget {
  const FullMenuScreen({super.key});

  @override
  State<FullMenuScreen> createState() => _FullMenuScreenState();
}

class _FullMenuScreenState extends State<FullMenuScreen> {
  void _showDialogAndroid() {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: const Text(
            'Coming Soon!',
            textScaleFactor: 1,
            textAlign: TextAlign.center,
          ),
          titleTextStyle: const TextStyle(
              fontSize: 22, color: Colors.black, fontWeight: FontWeight.bold),
          backgroundColor: Colors.white,
          content: const Text(
            "Soon you would be allow to order these food",
            textScaleFactor: 1,
            textAlign: TextAlign.center,
          ),
          contentTextStyle: const TextStyle(
            fontSize: 17,
            color: Colors.black,
          ),
          elevation: 10,
          actionsOverflowButtonSpacing: 20,
          actionsAlignment: MainAxisAlignment.spaceBetween,
          actions: [
            GestureDetector(
              onTap: () {
                Navigator.pop(context);
              },
              child: Text(
                "View Full Menu",
                style: TextStyle(fontSize: 19, color: Colors.red.shade900),
              ),
            ),
            SizedBox(
              width: 150,
              child: TextButton(
                  style: TextButton.styleFrom(backgroundColor: Colors.red),
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: const Text(
                    "Okay",
                    textAlign: TextAlign.center,
                    textScaleFactor: 1,
                    overflow: TextOverflow.ellipsis,
                    maxLines: 1,
                    style: TextStyle(fontSize: 19, color: Colors.white),
                  )),
            )
          ],
        );
      },
    );
  }

  void _showDialogIOS() {
    showDialog(
      context: context,
      builder: (context) => CupertinoAlertDialog(
        title: const Text('Coming Soon',
            textScaleFactor: 1,
            textAlign: TextAlign.center,
            style: TextStyle(
                fontSize: 22,
                color: Colors.black,
                fontWeight: FontWeight.bold)),
        actions: [
          GestureDetector(
            onTap: () {
              Navigator.pop(context);
            },
            child: Text(
              "View Full Menu",
              style: TextStyle(fontSize: 19, color: Colors.red.shade900),
            ),
          ),
          SizedBox(
            width: 150,
            child: TextButton(
                style: TextButton.styleFrom(backgroundColor: Colors.red),
                onPressed: () {
                  Navigator.pop(context);
                },
                child: const Text(
                  "Okay",
                  textAlign: TextAlign.center,
                  textScaleFactor: 1,
                  overflow: TextOverflow.ellipsis,
                  maxLines: 1,
                  style: TextStyle(fontSize: 19, color: Colors.white),
                )),
          )
        ],
        content: const Text("Soon you would be allow to order these food",
            textScaleFactor: 1,
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 17,
              color: Colors.black,
            )),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      initialIndex: 0,
      animationDuration: const Duration(milliseconds: 200),
      length: 3,
      child: Scaffold(
          appBar: AppBar(
            actions: [
              IconButton(
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const MainFoodScreen(),
                        ));
                  },
                  icon: const Icon(
                    Icons.home,
                    color: Colors.white,
                  ))
            ],
            bottom: const TabBar(
              tabs: [
                Tab(
                  child: Text(
                    "Popular",
                    style: TextStyle(fontSize: 21, color: Colors.white),
                  ),
                ),
                Tab(
                  child: Text(
                    "Meals",
                    style: TextStyle(fontSize: 21, color: Colors.white),
                  ),
                ),
                Tab(
                  child: Text(
                    "Drinks",
                    style: TextStyle(fontSize: 21, color: Colors.white),
                  ),
                ),
              ],
            ),
            automaticallyImplyLeading: false,
            toolbarHeight: 75,
            title: const Text(" F U L L   M E N U "),
            backgroundColor: Colors.red.shade700,
            titleTextStyle: const TextStyle(
                fontSize: 24, color: Colors.white, fontWeight: FontWeight.bold),
          ),
          backgroundColor: Colors.grey.shade200,
          body: const TabBarView(
            children: [
              PopularFoodTab(),
              MealsTab(),
              DrinksTab(),
            ],
          )),
    );
  }
}
