import 'package:bisiklet_mobil/Pages/motionTabBarPage.dart';
import 'package:flutter/material.dart';
import 'package:motion_tab_bar/motiontabbar.dart';

class MainPage extends StatefulWidget {
  const MainPage({Key? key}) : super(key: key);

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: MotionTabBarPage(),

    );
  }
}
