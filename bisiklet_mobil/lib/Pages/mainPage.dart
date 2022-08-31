import 'package:bisiklet_mobil/Constants/myColors.dart';
import 'package:bisiklet_mobil/Pages/motionTabBarPage.dart';
import 'package:flutter/material.dart';

class MainPage extends StatefulWidget {
  const MainPage({Key? key}) : super(key: key);

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData.dark().copyWith(
       appBarTheme: AppBarTheme(
         color: Colors.transparent
       ),
        ),
      home: MotionTabBarPage(),

    );
  }
}
