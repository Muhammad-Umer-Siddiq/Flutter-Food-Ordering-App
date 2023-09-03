import '../../utilities/imports.dart';

// Fully responsive
// Tested on min size of 320 × 320
// Tested on full web size (display resolution: 1920 × 1080)

class SignInScreen extends StatefulWidget {
  const SignInScreen({super.key});

  @override
  State<SignInScreen> createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> {
  final _formKey = GlobalKey<FormState>();
  bool _passwordShownS = true;

  void _showPasswordS() => setState(() => _passwordShownS = !_passwordShownS);

  final String _account1Email = 'ahmed123@gmail.com';
  final String _account1password = 'ahmed9999';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: BackgroundTile(
      bgImage: const AssetImage('assets/images/background_pic2.jpg'),
      frontContent: Container(
        alignment: Alignment.center,
        width: MediaQuery.sizeOf(context).width * 0.8,
        height: MediaQuery.sizeOf(context).height * 1,
        child: SingleChildScrollView(
          reverse: true,
          keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.onDrag,
          child: Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                const Expanded(flex: 0, child: MyAppNameText(fontSize: 32)),
                const CustomSizedBox(),
                const Text("Sign-in",
                    style: TextStyle(color: Colors.white, fontSize: 21)),
                const CustomSizedBox(heightRatio: 0.03),
                CustomTextFormFiled(
                  keyboardType: TextInputType.emailAddress,
                  labelText: 'Email Address',
                  controller: AppConsts.emailControllerS,
                  hintText: 'abc123@gmail.com',
                  validator: (value) {
                    if (value == _account1Email) {
                      return null;
                    } else {
                      return 'No such email exists';
                    }
                  },
                ),
                const CustomSizedBox(),
                CustomTextFormFiled(
                  labelText: 'Password',
                  obscureText: _passwordShownS,
                  controller: AppConsts.passwordControllerS,
                  validator: (value) {
                    if (value == _account1password) {
                      return null;
                    } else {
                      return 'Password is incorrect';
                    }
                  },
                  suffixIcon: IconButton(
                    color: Colors.white,
                    onPressed: () => _showPasswordS(),
                    icon: const Icon(Icons.remove_red_eye),
                  ),
                ),
                const CustomSizedBox(heightRatio: 0.06),
                CustomElevatedButton(
                  fontSize: 21,
                  buttonText: "Sign in",
                  buttonPress: () => _formKey.currentState!.validate()
                      ? Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const MainFoodScreen(),
                          ))
                      : null,
                ),
                const CustomSizedBox(heightRatio: 0.03),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    const Text(
                      "Don't have an account? ",
                      textAlign: TextAlign.center,
                      style: TextStyle(fontSize: 18, color: Colors.white),
                    ),
                    InkWell(
                      onTap: () {
                        Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const RegisterScreen(),
                            ));
                      },
                      child: Text(
                        "Register",
                        textAlign: TextAlign.center,
                        style:
                            TextStyle(color: Colors.red.shade200, fontSize: 18),
                      ),
                    ),
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    ));
  }
}
