import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:youtube/feachures/auth/pages/login.dart';
import 'package:youtube/feachures/auth/pages/username_page.dart';
import 'package:youtube/firebase_options.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:youtube/home_page.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const ProviderScope(child: MyApp()));
}

class MyApp extends ConsumerWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: StreamBuilder(
        stream: FirebaseAuth.instance.authStateChanges(),
        builder: (context, snapshot) {
          if (!snapshot.hasData) {
            return const LoginPage();
          }
          return const UsernamePage(
            displayName: '',
            email: '',
            profilePic: '',
          );
        },
      ),
    );
  }
}
