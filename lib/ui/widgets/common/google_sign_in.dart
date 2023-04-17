import 'package:flutter/material.dart';

class GoogleSignIn extends StatelessWidget {
  const GoogleSignIn({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
      ),
      padding: const EdgeInsets.symmetric(horizontal: 50, vertical: 10),
      child: const Text(
        'Sign up with Google',
        style: TextStyle(
          fontWeight: FontWeight.w600,
          fontSize: 20,
          color: Colors.black,
        ),
      ),
    );
  }
}
