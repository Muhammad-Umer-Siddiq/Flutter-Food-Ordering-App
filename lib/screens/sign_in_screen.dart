import 'package:flutter/material.dart';

import '../utilities/consts.dart';
import '../widgets/components/starting screens/background_tile.dart';
import '../widgets/custom widgets/app_name_text.dart';
import '../widgets/custom widgets/elevated_button.dart';
import '../widgets/custom widgets/sized_box.dart';
import '../widgets/custom widgets/text_form_field.dart';
import 'main_food_screen.dart';
import 'register_screen.dart';

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
  bool passwordShownS = true;

  void _showPasswordS() => passwordShownS = !passwordShownS;

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
                const Expanded(
                    flex: 0, child: MyAppNameText(textSizeRatio: 32)),
                const MySizedBox(),
                Text("Sign-in",
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: MediaQuery.textScaleFactorOf(context) * 21)),
                const MySizedBox(heightRatio: 0.04),
                MyTextFormField(
                  labelText: 'Email Address',
                  controller: emailControllerS,
                  hintText: 'abc123@gmail.com',
                  validator: (value) {
                    if (value == _account1Email) {
                      return null;
                    } else {
                      return 'No such account exists';
                    }
                  },
                ),
                const MySizedBox(heightRatio: 0.03),
                MyTextFormField(
                  labelText: 'Password',
                  controller: passwordControllerS,
                  validator: (value) {
                    if (value == _account1password) {
                      return null;
                    } else {
                      return 'No such account exists';
                    }
                  },
                  suffixIcon: IconButton(
                    color: Colors.white,
                    onPressed: () {
                      setState(() {
                        _showPasswordS();
                      });
                    },
                    icon: const Icon(Icons.remove_red_eye),
                  ),
                ),
                const MySizedBox(heightRatio: 0.06),
                MyElevatedButton(
                  fontSize: 21,
                  buttonText: "Sign in",
                  buttonPress: () => Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const MainFoodScreen(),
                      )),
                ),
                const MySizedBox(heightRatio: 0.03),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(
                      "Don't have an account? ",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          fontSize: MediaQuery.textScaleFactorOf(context) * 18,
                          color: Colors.white),
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
                        style: TextStyle(
                            color: Colors.red.shade200,
                            fontSize:
                                MediaQuery.textScaleFactorOf(context) * 18),
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
