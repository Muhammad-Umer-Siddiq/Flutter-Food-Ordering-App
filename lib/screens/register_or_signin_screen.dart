import 'package:flutter/material.dart';

import 'register_screen.dart';
import 'sign_in_screen.dart';

class RegisterOrSignInScreen extends StatelessWidget {
  const RegisterOrSignInScreen({super.key});

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
          left: MediaQuery.of(context).size.width * 0.075,
          right: MediaQuery.of(context).size.width * 0.075,
          top: 60,
          bottom: 20,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text(
                "Order @ Eat",
                style: TextStyle(
                    fontStyle: FontStyle.italic,
                    fontSize: 38,
                    color: Colors.white),
              ),
              const SizedBox(height: 10),
              const Text(
                "Nothing Acts faster than our order!",
                style: TextStyle(color: Colors.white, fontSize: 19),
              ),
              const SizedBox(height: 240),
              ElevatedButton(
                  style: ElevatedButton.styleFrom(
                      elevation: 20,
                      backgroundColor: Colors.red,
                      fixedSize:
                          Size(MediaQuery.of(context).size.width * 0.7, 50)),
                  onPressed: () {
                    Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const RegisterScreen(),
                        ));
                  },
                  child: const Text(
                    "Register",
                    style: TextStyle(color: Colors.white, fontSize: 20),
                  )),
              const SizedBox(height: 33),
              InkWell(
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const SignInScreen(),
                      ));
                },
                child: const Text(
                  "Sign-in",
                  style: TextStyle(color: Colors.white, fontSize: 18),
                ),
              )
            ],
          ),
        ),
      ],
    ));
  }
}
