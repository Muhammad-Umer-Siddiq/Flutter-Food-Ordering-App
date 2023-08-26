import 'package:flutter/material.dart';

import '../utilities/consts.dart';
import '../widgets/components/starting screens/background_tile.dart';
import '../widgets/custom widgets/elevated_button.dart';
import '../widgets/custom widgets/sized_box.dart';
import 'on_boarding_screen.dart';
import 'privacy_policy_screen.dart';

// Fully responsive
// Tested on min size of 320 × 320
// Tested on full web size (1536 × 747)
// Tested on Pixel 3a mobile

class TermsConditionsScreen extends StatefulWidget {
  const TermsConditionsScreen({super.key});

  @override
  State<TermsConditionsScreen> createState() => _TermsConditionsScreenState();
}

class _TermsConditionsScreenState extends State<TermsConditionsScreen> {
  // For policy Screens
  bool _agreeTermsConditions = false;
  bool _agreePrivacyPolicy = false;
  bool hasUserAgreed = false;

  bool _heightSizeValidate({required int screenHeight}) {
    if (MediaQuery.sizeOf(context).width < screenHeight) {
      return true;
    } else {
      return false;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: BackgroundTile(
      bgImage: const AssetImage('assets/images/policy_bg_pic.jpg'),
      frontContent: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Text(
            "Terms & Conditions",
            textAlign: TextAlign.center,
            textScaleFactor: 1,
            style: TextStyle(
                fontSize: MediaQuery.sizeOf(context).height > 465 ? 33 : 30,
                color: Colors.white,
                fontWeight: FontWeight.bold),
          ),
          const MySizedBox(heightRatio: 0.03),
          Container(
            constraints: const BoxConstraints(maxWidth: 700),
            width: MediaQuery.sizeOf(context).width * 0.9,
            height: MediaQuery.sizeOf(context).height * 0.48,
            child: const SingleChildScrollView(
              child: Text(
                termsConditionsInfo,
                textScaleFactor: 1,
                textAlign: TextAlign.center,
                textDirection: TextDirection.ltr,
                style: TextStyle(fontSize: 17.5, color: Colors.white),
              ),
            ),
          ),
          _heightSizeValidate(screenHeight: 465)
              ? const MySizedBox()
              : const MySizedBox(heightRatio: 0.03),
          hasUserAgreed
              ? const Text('')
              : Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    Checkbox(
                      value: _agreeTermsConditions,
                      side: const BorderSide(color: Colors.white),
                      onChanged: (value) => setState(() {
                        _agreeTermsConditions = !_agreeTermsConditions;
                      }),
                    ),
                    Text(
                      "I agree with Terms and Conditions",
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(
                          fontSize:
                              MediaQuery.sizeOf(context).width > 420 ? 19 : 16,
                          color: Colors.white),
                    )
                  ],
                ),
          hasUserAgreed
              ? const Text('')
              : _heightSizeValidate(screenHeight: 465)
                  ? const SizedBox(height: 0.5)
                  : const MySizedBox(),
          hasUserAgreed
              ? const Text('')
              : Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    Checkbox(
                      value: _agreePrivacyPolicy,
                      side: const BorderSide(color: Colors.white),
                      onChanged: (value) => setState(() {
                        _agreePrivacyPolicy = !_agreePrivacyPolicy;
                      }),
                    ),
                    Text(
                      "I agree with Order @ Eat ",
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(
                          fontSize:
                              MediaQuery.sizeOf(context).width > 420 ? 19 : 16,
                          color: Colors.white),
                    ),
                    GestureDetector(
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const PrivacyPolicyScreen(),
                            ));
                      },
                      child: Text(
                        "Privacy Policy",
                        style: TextStyle(
                            fontSize: MediaQuery.sizeOf(context).width > 420
                                ? 19
                                : 16,
                            color: Colors.red),
                      ),
                    ),
                  ],
                ),
          hasUserAgreed
              ? const Text('')
              : _heightSizeValidate(screenHeight: 465)
                  ? const MySizedBox()
                  : const MySizedBox(heightRatio: 0.03),
          hasUserAgreed
              ? const Text('')
              : MyElevatedButton(
                  buttonText: 'Continue',
                  elevation: 0,
                  borderColor: _agreeTermsConditions == true &&
                          _agreePrivacyPolicy == true
                      ? Colors.red
                      : Colors.red.shade300,
                  buttonColor: _agreeTermsConditions == true &&
                          _agreePrivacyPolicy == true
                      ? Colors.red.shade600
                      : Colors.red.shade300,
                  buttonPress: () {
                    if (_agreePrivacyPolicy == true &&
                        _agreeTermsConditions == true) {
                      setState(() {
                        hasUserAgreed = true;
                      });
                      Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const OnBoardingScreen(),
                          ));
                    }
                  },
                ),
        ],
      ),
    ));
  }
}
