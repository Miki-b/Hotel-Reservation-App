import 'package:firebase/Dashboard.dart';
import 'package:firebase/HotelsMap.dart';
import 'package:firebase/SignUp.dart';
import 'package:flutter/material.dart';
import 'package:firebase/home.dart';
import 'package:firebase_core/firebase_core.dart';
import 'Book.dart';
import 'HomeScreen.dart';
import 'HotelProfile.dart';
import 'Payment.dart';
import 'Search.dart';
import 'auth_gate.dart';
import 'map.dart';
import 'package:firebase/Mainpage.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      debugShowCheckedModeBanner: false,
      initialRoute: '/',
      routes: {
        '/': (context) => AuthGate(),
        '/home': (context) => AuthGate(),
        '/mainpage': (context) => HomeScreen(),
        '/signUp': (context) => SignUp(),
        '/dashboard': (context) => Dashboard(),
        '/map': (context) => Maps(),
        '/search': (context) => Search(),
        '/HotelProfile': (context) => HotelProfile(),
        '/Book': (context) => Book(),
        '/pay': (context) => Payment(),
      },
    );
  }
}
