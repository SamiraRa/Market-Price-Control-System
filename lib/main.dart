// import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:market_price_control_app/UI/homepage.dart';
import 'package:market_price_control_app/UI/signup_page.dart';
import 'package:market_price_control_app/local_storage/boxes.dart';
import 'package:market_price_control_app/local_storage/hive_adapters.dart';
import 'package:market_price_control_app/models/user_login.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Hive.initFlutter();
  await HiveAdapter().hiveAdapterbox();
//   await Firebase.initializeApp(
//   options: DefaultFirebaseOptions.currentPlatform,
// );
  // await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  UserLogin? loginData;
  @override
  void initState() {
    super.initState();
    loginData = Boxes.getLoginData().get('userLogin');
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Market Price Control',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: (loginData != null && loginData!.username.isNotEmpty) ? const Homepage() : const SignupPage(),
    );
  }
}
