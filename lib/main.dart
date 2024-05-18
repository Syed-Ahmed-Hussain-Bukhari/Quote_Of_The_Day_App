import 'package:flutter/material.dart';
import 'package:quote_app/feedback.dart';
import 'package:quote_app/feedbackPublish.dart';
import 'package:quote_app/firebase_options.dart';
import 'package:quote_app/homepage.dart';
import 'package:quote_app/profile.dart';
import 'package:quote_app/quoteCreator.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:quote_app/settings.dart';
import 'package:quote_app/splashScreen.dart';





void main() async{
  WidgetsFlutterBinding.ensureInitialized(); 
   await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(

      debugShowCheckedModeBanner: false,
      title: 'Quote App',
      theme: ThemeData(
        
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const SplashScreen(),
    );
  }
}
