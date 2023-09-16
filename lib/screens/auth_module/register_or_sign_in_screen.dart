import '../../utilities/imports.dart';

class GetStartedScreen extends StatelessWidget {
  const GetStartedScreen({super.key});

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
            const MyAppNameText(fontSize: 34),
            const CustomSizedBox(),
            const Text(
              "Nothing Acts faster than our order!",
              textAlign: TextAlign.center,
              overflow: TextOverflow.ellipsis,
              style: TextStyle(
                fontSize: 19,
                color: Colors.white,
              ),
            ),
            const CustomSizedBox(heightRatio: 0.35),
            CustomElevatedButton(
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
            const CustomSizedBox(heightRatio: 0.03),
            GestureDetector(
              onTap: () {
                Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const SignInScreen(),
                    ));
              },
              child: const Text(
                "Sign-in",
                overflow: TextOverflow.ellipsis,
                style: TextStyle(
                  fontSize: 20,
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
