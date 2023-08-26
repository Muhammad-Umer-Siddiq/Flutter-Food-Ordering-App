import 'package:flutter/material.dart';

import '../widgets/components/starting screens/background_tile.dart';
import '../widgets/custom widgets/app_name_text.dart';
import '../widgets/custom widgets/elevated_button.dart';
import '../widgets/custom widgets/sized_box.dart';
import 'register_screen.dart';
import 'sign_in_screen.dart';

// Fully responsive
// Tested on min size of 320 × 320
// Tested on full web size (1536 × 747)

class RegisterOrSignInScreen extends StatelessWidget {
  const RegisterOrSignInScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: BackgroundTile(
      bgImage: const AssetImage('assets/images/background_pic2.jpg'),
      frontContent: SizedBox(
        height: double.infinity,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisSize: MainAxisSize.max,
          children: [
            const MyAppNameText(textSizeRatio: 34),
            const MySizedBox(),
            Text(
              "Nothing Acts faster than our order!",
              textAlign: TextAlign.center,
              overflow: TextOverflow.ellipsis,
              style: TextStyle(
                fontSize: MediaQuery.textScaleFactorOf(context) * 19,
                color: Colors.white,
              ),
            ),
            const MySizedBox(heightRatio: 0.35),
            MyElevatedButton(
              buttonText: 'Register',
              fontSize: 22,
              buttonPress: () {
                Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const RegisterScreen(),
                    ));
              },
            ),
            const MySizedBox(heightRatio: 0.03),
            GestureDetector(
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const SignInScreen(),
                    ));
              },
              child: Text(
                "Sign-in",
                overflow: TextOverflow.ellipsis,
                style: TextStyle(
                  fontSize: MediaQuery.textScaleFactorOf(context) * 20,
                  color: Colors.white,
                ),
              ),
            )
          ],
        ),
      ),
    ));
  }
}
