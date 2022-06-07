import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:inr_d/Views/AddCard.dart';
import 'package:inr_d/Views/TabbarScreen.dart';
import './Views/SplashScreen.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';


void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  SystemChrome.setSystemUIOverlayStyle(
      const SystemUiOverlayStyle(
        statusBarColor: Colors.transparent,
      ));
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
  ]);

  await GetStorage.init();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'INR(D)',
        theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
        home: SplashScreen()
        // home: TabbarScreen()
    );
  }
}

