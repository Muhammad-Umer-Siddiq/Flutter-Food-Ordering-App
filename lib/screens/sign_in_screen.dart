import 'package:flutter/material.dart';

import '../widgets/custom_widgets/custom_app_name_text.dart';
import '../widgets/custom_widgets/custom_elevated_button.dart';
import '../widgets/custom_widgets/custom_sized_box_media_query.dart';
import 'main_food_screen.dart';
import 'register_screen.dart';

class SignInScreen extends StatelessWidget {
  const SignInScreen({super.key});

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
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const MySizedBox(heightRatio: 0.07),
                  const MyAppNameText(),
                  const SizedBox(height: 10),
                  const Text("Sign-in",
                      style: TextStyle(color: Colors.white, fontSize: 19)),
                  const SizedBox(height: 15),
                  SizedBox(
                    width: 250,
                    child: TextFormField(
                      cursorColor: Colors.white,
                      cursorHeight: 21,
                      textAlignVertical: TextAlignVertical.center,
                      validator: (value) {
                        return null;
                      },
                      style: const TextStyle(color: Colors.white, fontSize: 19),
                      keyboardType: TextInputType.emailAddress,
                      decoration: const InputDecoration(
                          enabledBorder: UnderlineInputBorder(
                            borderSide: BorderSide(color: Colors.white),
                          ),
                          focusedBorder: UnderlineInputBorder(
                            borderSide: BorderSide(color: Colors.white),
                          ),
                          errorBorder: UnderlineInputBorder(
                            borderSide: BorderSide(color: Colors.red),
                          ),
                          labelStyle: TextStyle(color: Colors.white),
                          floatingLabelStyle:
                              TextStyle(color: Colors.white, fontSize: 20),
                          labelText: 'Email Address'),
                    ),
                  ),
                  const SizedBox(height: 15),
                  SizedBox(
                    width: 250,
                    child: TextFormField(
                      cursorColor: Colors.white,
                      cursorHeight: 21,
                      textAlignVertical: TextAlignVertical.center,
                      validator: (value) {
                        return null;
                      },
                      style: const TextStyle(color: Colors.white, fontSize: 19),
                      keyboardType: TextInputType.visiblePassword,
                      decoration: const InputDecoration(
                          enabledBorder: UnderlineInputBorder(
                            borderSide: BorderSide(color: Colors.white),
                          ),
                          focusedBorder: UnderlineInputBorder(
                            borderSide: BorderSide(color: Colors.white),
                          ),
                          errorBorder: UnderlineInputBorder(
                            borderSide: BorderSide(color: Colors.red),
                          ),
                          labelStyle: TextStyle(color: Colors.white),
                          floatingLabelStyle:
                              TextStyle(color: Colors.white, fontSize: 20),
                          labelText: 'Password'),
                    ),
                  ),
                  const SizedBox(height: 10),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      InkWell(
                        onTap: () {},
                        child: Text(
                          "Forget Password?",
                          style: TextStyle(
                              color: Colors.green.shade300, fontSize: 17),
                        ),
                      ),
                      SizedBox(
                        width: MediaQuery.of(context).size.width * 0.1,
                      ),
                    ],
                  ),
                  const SizedBox(height: 60),
                  MyElevatedButton(
                    childText: "Sign in",
                    buttonPress: () => Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const MainFoodScreen(),
                        )),
                  ),
                  const SizedBox(height: 40),
                  Row(
                    children: [
                      const MySizedBox(widthRatio: 0.09),
                      const Text(
                        "Don't have an account? ",
                        style: TextStyle(fontSize: 18, color: Colors.white),
                      ),
                      InkWell(
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => const RegisterScreen(),
                              ));
                        },
                        child: Text(
                          "Register",
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
