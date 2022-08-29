import 'package:bisiklet_mobil/Constants/myColors.dart';
import 'package:bisiklet_mobil/Pages/loginPage.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        debugShowMaterialGrid: false,
        theme: ThemeData.dark().copyWith(
      appBarTheme: const AppBarTheme(
        centerTitle: true,
        color: Colors.transparent,
        elevation: 0,
      ),
            elevatedButtonTheme: ElevatedButtonThemeData(
                style: ElevatedButton.styleFrom(
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30.0)),
                  primary:MyColors.darkGreen,
                  onPrimary: MyColors.white,
                  padding: const EdgeInsets.all(10.0),
                )
            )
        ),
      home: const LoginPage(),
    );
  }
}
