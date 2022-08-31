import 'package:bisiklet_mobil/Constants/myColors.dart';
import 'package:bisiklet_mobil/Screens/bikes.dart';
import 'package:bisiklet_mobil/Screens/history.dart';
import 'package:bisiklet_mobil/Screens/settings.dart';
import 'package:bisiklet_mobil/Screens/user.dart';
import 'package:flutter/material.dart';
import 'package:motion_tab_bar/MotionTabBarView.dart';
import 'package:motion_tab_bar/MotionTabController.dart';
import 'package:motion_tab_bar/motiontabbar.dart';

 class MotionTabBarPage extends StatefulWidget {
   MotionTabBarPage({Key? key}) : super(key: key);

  @override
  State<MotionTabBarPage> createState() => _MotionTabBarPageState();

}


class _MotionTabBarPageState extends State<MotionTabBarPage> with TickerProviderStateMixin {
   final screens =[BikesPage(),HistoryPage(),SettingsPage(),UserPage()];
   late MotionTabController _controller;
   @override
  void initState() {
     _controller=MotionTabController(vsync:this,initialIndex: 0);
    super.initState();
  }
   @override
   Widget build(BuildContext context) {

     return Scaffold(
       body: MotionTabBarView(
         controller: _controller,
         children: screens,
       ),
         bottomNavigationBar: MotionTabBar(
           labels: ["Araçlar","Geçmiş","Ayarlar","Kullanıcı"],
           initialSelectedTab: "Araçlar",
           tabIconColor: MyColors.darkGreen,
           tabSelectedColor: MyColors.green,
           icons: [Icons.pedal_bike_outlined,Icons.history_outlined,Icons.settings,Icons.person_outline],
           textStyle: TextStyle(color: MyColors.black),
           onTabItemSelected: (int value){
             setState(() {
               _controller.index=value;
             });

           },
         ),
     );
   }
}
