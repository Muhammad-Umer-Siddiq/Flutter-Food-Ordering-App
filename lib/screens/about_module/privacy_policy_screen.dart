import '../../utilities/imports.dart';

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
          const CustomSizedBox(heightRatio: 0.05),
          Container(
            constraints: const BoxConstraints(maxWidth: 700),
            width: MediaQuery.sizeOf(context).width * 0.9,
            height: MediaQuery.sizeOf(context).height * 0.49,
            child: const SingleChildScrollView(
              child: Text(
                AppConsts.privacyPolicyInfo,
                textScaleFactor: 1,
                textAlign: TextAlign.center,
                textDirection: TextDirection.ltr,
                style: TextStyle(fontSize: 17.5, color: Colors.white),
              ),
            ),
          ),
          const CustomSizedBox(heightRatio: 0.05),
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
              : GestureDetector(
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
