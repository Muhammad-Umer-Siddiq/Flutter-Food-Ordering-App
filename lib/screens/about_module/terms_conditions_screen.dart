import '../../utilities/imports.dart';

class TermsConditionsScreen extends StatefulWidget {
  const TermsConditionsScreen({super.key});

  @override
  State<TermsConditionsScreen> createState() => _TermsConditionsScreenState();
}

class _TermsConditionsScreenState extends State<TermsConditionsScreen> {
  // For policy Screens
  bool _agreeTermsConditions = false;
  bool _agreePrivacyPolicy = false;

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
          const CustomSizedBox(heightRatio: 0.03),
          Container(
            constraints: const BoxConstraints(maxWidth: 600),
            width: MediaQuery.sizeOf(context).width * 0.9,
            height: MediaQuery.sizeOf(context).height * 0.49,
            child: const SingleChildScrollView(
              child: Text(
                AppConsts.termsConditionsInfo,
                textScaleFactor: 1,
                textAlign: TextAlign.center,
                textDirection: TextDirection.ltr,
                style: TextStyle(fontSize: 17.5, color: Colors.white),
              ),
            ),
          ),
          _heightSizeValidate(screenHeight: 465)
              ? const CustomSizedBox()
              : const CustomSizedBox(heightRatio: 0.03),
          AppValues.userAgreedPolicy
              ? const SizedBox()
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
          _heightSizeValidate(screenHeight: 465)
              ? const SizedBox(height: 0.5)
              : const CustomSizedBox(),
          AppValues.userAgreedPolicy
              ? const SizedBox()
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
          _heightSizeValidate(screenHeight: 465)
              ? const CustomSizedBox()
              : const CustomSizedBox(heightRatio: 0.03),
          AppValues.userAgreedPolicy
              ? GestureDetector(
                  onTap: () {
                    Navigator.pop(context);
                  },
                  child: const Text(
                    "Back",
                    textScaleFactor: 1,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(fontSize: 18, color: Colors.red),
                  ),
                )
              : CustomElevatedButton(
                  buttonText: 'Continue',
                  elevation: 0,
                  borderColor: _agreePrivacyPolicy && _agreeTermsConditions
                      ? AppColors.appThemeColor
                      : Colors.red.shade300,
                  buttonColor: _agreePrivacyPolicy && _agreeTermsConditions
                      ? AppColors.appThemeColor
                      : Colors.red.shade300,
                  buttonPress: () {
                    if (_agreePrivacyPolicy == true &&
                        _agreeTermsConditions == true) {
                      AppValues.userAgreedPolicy = true;
                      Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const OnBoardingScreen(),
                          ));
                    } else {
                      Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const MainFoodScreen(),
                          ));
                    }
                  },
                ),
        ],
      ),
    ));
  }
}
