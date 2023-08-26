import 'package:flutter/material.dart';

import '../utilities/consts.dart';
import '../widgets/components/starting screens/background_tile.dart';
import '../widgets/custom widgets/sized_box.dart';

// Fully responsive
// Tested on min size of 320 × 320
// Tested on full web size (1536 × 747)
// Tested on Pixel 3a mobile

class PrivacyPolicyScreen extends StatelessWidget {
  const PrivacyPolicyScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: BackgroundTile(
      bgImage: const AssetImage('assets/images/policy_bg_pic.jpg'),
      frontContent: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            "Privacy Policy",
            textAlign: TextAlign.center,
            textScaleFactor: 1,
            style: TextStyle(
                fontSize: MediaQuery.sizeOf(context).height > 465 ? 33 : 30,
                color: Colors.white,
                fontWeight: FontWeight.bold),
          ),
          const MySizedBox(heightRatio: 0.05),
          Container(
            constraints: const BoxConstraints(maxWidth: 700),
            width: MediaQuery.sizeOf(context).width * 0.9,
            height: MediaQuery.sizeOf(context).height * 0.48,
            child: const SingleChildScrollView(
              child: Text(
                privacyPolicyInfo,
                textScaleFactor: 1,
                textAlign: TextAlign.center,
                textDirection: TextDirection.ltr,
                style: TextStyle(fontSize: 17.5, color: Colors.white),
              ),
            ),
          ),
          const MySizedBox(heightRatio: 0.05),
          GestureDetector(
            onTap: () {
              Navigator.pop(context);
            },
            child: const Text(
              "Back to Terms & Conditions",
              textScaleFactor: 1,
              overflow: TextOverflow.ellipsis,
              style: TextStyle(fontSize: 18, color: Colors.red),
            ),
          )
        ],
      ),
    ));
  }
}
