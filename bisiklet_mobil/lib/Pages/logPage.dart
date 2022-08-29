import 'package:bisiklet_mobil/Constants/languageItem.dart';
import 'package:flutter/material.dart';

class LogPage extends StatefulWidget {
  const LogPage({Key? key}) : super(key: key);

  @override
  State<LogPage> createState() => _LogPageState();
}

class _LogPageState extends State<LogPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(LanguageItem.loginAppTitle),
      ),

    );
  }
}
