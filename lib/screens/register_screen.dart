import 'package:flutter/material.dart';

import '../widgets/custom_widgets/custom_app_name_text.dart';
import '../widgets/custom_widgets/custom_elevated_button.dart';
import '../widgets/custom_widgets/custom_sized_box_media_query.dart';
import '../widgets/custom_widgets/custom_text_field.dart';
import 'main_food_screen.dart';
import 'sign_in_screen.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Stack(
      children: [
        Container(
          decoration: const BoxDecoration(
              color: Colors.black,
              image: DecorationImage(
                  fit: BoxFit.cover,
                  opacity: 80,
                  image: AssetImage(
                    "assets/images/backgroun_pic2.jpg",
                  ))),
        ),
        Positioned(
          left: MediaQuery.of(context).size.width * 0.08,
          right: MediaQuery.of(context).size.width * 0.075,
          top: 60,
          bottom: 20,
          child: SingleChildScrollView(
            child: Form(
              key: _formKey,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const MyAppNameText(),
                  const SizedBox(height: 10),
                  const Text("Register",
                      style: TextStyle(color: Colors.white, fontSize: 19)),
                  const SizedBox(height: 15),
                  const MyTextFormField(
                    textLabel: 'First Name',
                    keyboard: TextInputType.text,
                  ),
                  const SizedBox(height: 15),
                  const MyTextFormField(
                    textLabel: 'Email Address',
                    keyboard: TextInputType.emailAddress,
                  ),
                  const SizedBox(height: 15),
                  const MyTextFormField(
                    textLabel: 'Phone Number',
                    keyboard: TextInputType.phone,
                  ),
                  const SizedBox(height: 15),
                  const MyTextFormField(
                    textLabel: 'Password',
                    keyboard: TextInputType.visiblePassword,
                  ),
                  const SizedBox(height: 60),
                  MyElevatedButton(
                    childText: "Register",
                    buttonPress: () => Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const MainFoodScreen(),
                        )),
                  ),
                  const SizedBox(height: 40),
                  Row(
                    children: [
                      const MySizedBox(widthRatio: 0.14),
                      const Text(
                        "Already Registered? ",
                        style: TextStyle(fontSize: 18, color: Colors.white),
                      ),
                      InkWell(
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => const SignInScreen(),
                              ));
                        },
                        child: Text(
                          "Sign-in",
                          style: TextStyle(
                              color: Colors.red.shade200, fontSize: 18),
                        ),
                      ),
                    ],
                  )
                ],
              ),
            ),
          ),
        ),
      ],
    ));
  }
}
