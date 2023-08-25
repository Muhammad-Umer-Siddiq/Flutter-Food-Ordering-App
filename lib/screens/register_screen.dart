import 'package:flutter/material.dart';
import 'package:food_ordering_app/widgets/custom_widgets/custom_sized_box.dart';

import '../utilities/consts.dart';
import '../widgets/components/starting screens/background_tile.dart';
import '../widgets/custom_widgets/custom_app_name_text.dart';
import '../widgets/custom_widgets/custom_elevated_button.dart';
import '../widgets/custom_widgets/custom_text_form_field.dart';
import 'sign_in_screen.dart';
import 'terms_conditions_screen.dart';

// Fully responsive
// Tested on min size of 320 × 320
// Tested on full web size (display resolution: 1920 × 1080)

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  bool _passwordShownR = true;
  bool _passwordShownRR = true;

  // For register in screen
  void _showPasswordR() => _passwordShownR = !_passwordShownR;

  void _showPasswordRR() => _passwordShownRR = !_passwordShownRR;

  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: BackgroundTile(
      bgImage: const AssetImage('assets/images/background_pic2.jpg'),
      frontContent: Container(
        width: MediaQuery.sizeOf(context).width * 0.8,
        height: MediaQuery.sizeOf(context).height * 1,
        alignment: Alignment.center,
        child: SingleChildScrollView(
          keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.onDrag,
          reverse: true,
          child: Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                const Expanded(
                    flex: 0, child: MyAppNameText(textSizeRatio: 32)),
                const MySizedBox(),
                Text("Register",
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: MediaQuery.textScaleFactorOf(context) * 20)),
                const MySizedBox(),
                MyTextFormField(
                  labelText: 'First Name',
                  keyboardType: TextInputType.text,
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'This field cannot empty';
                    } else {
                      return null;
                    }
                  },
                ),
                const MySizedBox(),
                MyTextFormField(
                  labelText: 'Email Address',
                  keyboardType: TextInputType.emailAddress,
                  hintText: 'abc123@gmail.com',
                  validator: (value) {
                    if (!value!.endsWith('@gmail.com')) {
                      return 'Invalid Email Address';
                    } else if (value.isEmpty) {
                      return 'This field cannot empty';
                    } else {
                      return null;
                    }
                  },
                ),
                const MySizedBox(),
                MyTextFormField(
                  labelText: 'Phone Number',
                  keyboardType: TextInputType.phone,
                  maxLength: 11,
                  hintText: '03XXXXXXXX3',
                  controller: phoneControllerR,
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'Field required for delivery purposes';
                    } else {
                      return null;
                    }
                  },
                ),
                const MySizedBox(),
                MyTextFormField(
                  labelText: 'Street Address',
                  keyboardType: TextInputType.streetAddress,
                  hintText: '03XXXXXXXX3',
                  controller: streetControllerR,
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'Field required for delivery purposes';
                    } else {
                      return null;
                    }
                  },
                ),
                const MySizedBox(),
                MyTextFormField(
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'This field cannot empty';
                    } else if (value.length < 8) {
                      return 'Password should be 8 characters long';
                    } else {
                      return null;
                    }
                  },
                  controller: passwordControllerR,
                  labelText: 'Password',
                  keyboardType: TextInputType.visiblePassword,
                  obscureText: _passwordShownR,
                  suffixIcon: IconButton(
                      onPressed: () {
                        setState(() {
                          _showPasswordR();
                        });
                      },
                      icon: const Icon(
                        Icons.remove_red_eye,
                        color: Colors.white,
                      )),
                ),
                const MySizedBox(),
                MyTextFormField(
                  labelText: 'Repeat Password',
                  obscureText: _passwordShownRR,
                  suffixIcon: IconButton(
                      onPressed: () {
                        setState(() {
                          _showPasswordRR();
                        });
                      },
                      icon: const Icon(
                        Icons.remove_red_eye,
                        color: Colors.white,
                      )),
                  keyboardType: TextInputType.visiblePassword,
                  validator: (value) {
                    if (value!.isNotEmpty) {
                      if (value != passwordControllerR.text) {
                        return "Password should be same";
                      } else {
                        return null;
                      }
                    } else {
                      return "Re-enter your password";
                    }
                  },
                ),
                const MySizedBox(heightRatio: 0.06),
                MyElevatedButton(
                    textSizeRatio: 21,
                    buttonText: "Register",
                    buttonPress: () {
                      if (_formKey.currentState!.validate()) {
                        Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(
                              builder: (context) =>
                                  const TermsConditionsScreen(),
                            ));
                      }
                    }),
                const MySizedBox(heightRatio: 0.03),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(
                      "Already Registered? ",
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
                              builder: (context) => const SignInScreen(),
                            ));
                      },
                      child: Text(
                        "Sign-in",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            color: Colors.red.shade200,
                            fontSize:
                                MediaQuery.textScaleFactorOf(context) * 18),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    ));
  }
}
