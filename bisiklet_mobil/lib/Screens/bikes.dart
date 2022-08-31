import 'package:flutter/material.dart';

class BikesPage extends StatelessWidget {
  const BikesPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions : [IconButton(
            onPressed:(){},
            icon: Icon(
              Icons.add
            ))]
      ),
      body: Center(child: Text('Bike Page')),

    );
  }
}
