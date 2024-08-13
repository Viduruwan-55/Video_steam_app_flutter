import 'package:flutter/material.dart';
import 'package:youtube/Widgets/image_btn.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => HomePageState();
}

class HomePageState extends State<HomePage> {
  int currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffFFFFFF),
      body: SafeArea(
          child: Column(
        children: [
          Row(
            children: [
              Image.asset(
                "",
                height: 36,
              ),
              const SizedBox(
                width: 4,
              ),
              const Spacer(),
            ],
          ),
        ],
      )),
    );
  }
}
