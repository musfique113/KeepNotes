import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:googlekeep/home.dart';
import 'login_info.dart';
import 'login.dart';
import 'package:firebase_core/firebase_core.dart';

Future<void> main()  async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  bool isLogIn = false;
  getLoggedInState() async {
    await LocalDataSaver.getLogData().then((value) {
      setState(() {
        isLogIn = value.toString() == "null";// Initialize to false if value is null
      });
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getLoggedInState();
  }

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: isLogIn ? Home() : Login(),
    );
  }
}
