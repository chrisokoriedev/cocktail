import 'dart:async';

import 'package:cocktail_app/view/home.dart';
import 'package:cocktail_app/view/maincontrol.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class WelcomeScreen extends StatefulWidget {
  const WelcomeScreen({Key? key}) : super(key: key);

  @override
  State<WelcomeScreen> createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen> {
  @override
  void initState() {
    super.initState();
    Timer(const Duration(seconds: 3),
        (() => Get.to(() => const MainControl())));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
          width: double.infinity,
          height: 900,
          decoration: const BoxDecoration(
              image: DecorationImage(
                  image: AssetImage('assets/welcome.jpeg'),
                  fit: BoxFit.cover))),
    );
  }
}
