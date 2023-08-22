import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:food_ordering_app/utilities/lists.dart';

import '../../../screens/each_food_details_screen.dart';
import '../../custom_widgets/custom_card_widget.dart';
import '../../custom_widgets/custom_sized_box.dart';

class PopularFoodTab extends StatefulWidget {
  const PopularFoodTab({super.key});

  @override
  State<PopularFoodTab> createState() => _PopularFoodTabState();
}

class _PopularFoodTabState extends State<PopularFoodTab> {
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
    return GridView.builder(
      scrollDirection: Axis.vertical,
      itemCount: popularFoodList.length,
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2, mainAxisExtent: 195),
      itemBuilder: (context, mealsIndex) {
        return Padding(
          padding: const EdgeInsets.all(10),
          child: MyCard(
            elevation: 6,
            cardTap: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => EachFoodDetailsScreen(
                      isFoodInApi: false,
                      foodCustomItem: popularFoodList[mealsIndex],
                    ),
                  ));
            },
            contentWidget: Column(
              children: [
                const MySizedBox(heightRatio: 0.02),
                Expanded(
                  flex: 0,
                  child: SizedBox(
                    height: 90,
                    width: 105,
                    child: Image.asset(
                      popularFoodList[mealsIndex].foodImageURL.toString(),
                      fit: BoxFit.contain,
                    ),
                  ),
                ),
                Text(
                  popularFoodList[mealsIndex].foodName.toString(),
                  style: const TextStyle(
                    fontSize: 19.5,
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
