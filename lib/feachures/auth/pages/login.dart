import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../service_repo/auth_service.dart';

class LoginPage extends ConsumerWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 20, bottom: 25),
                child: Image.asset(
                  "assets/images/logo.jpg",
                  height: 150,
                ),
              ),
              const Text(
                "Welcome To ClipHub",
                style: TextStyle(
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                  color: Colors.blueGrey,
                ),
              ),
              const Spacer(),
              Padding(
                  padding: const EdgeInsets.only(bottom: 55),
                  child: GestureDetector(
                    onTap: () async {
                      ref.read(authServiceProvider).signInWithGoogle();
                      //auth service
                    },
                    child: Image.asset(
                      "assets/images/signinwithgoogle.png",
                      height: 60,
                    ),
                  ))
            ],
          ),
        ),
      ),
    );
  }
}
