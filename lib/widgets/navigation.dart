import 'package:capstone_clenro/UI/home_page.dart';
import 'package:capstone_clenro/UI/location.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';


class Navigation extends StatefulWidget {
  const Navigation({Key? key}) : super(key: key);

  @override
  State<Navigation> createState() => _NavigationState();
}

class _NavigationState extends State<Navigation> {

  final items = const [
    Icon(Icons.location_on_outlined, size: 30,),
    Icon(Icons.home, size: 30,),

  ];

  int index = 1;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: CurvedNavigationBar(
        items: items,
        index: index,
        onTap: (selectedIndex){
          setState(() {
            index = selectedIndex;
          });
        },
        height: 70,
        backgroundColor: Colors.lightGreen,
        animationDuration: const Duration(microseconds: 300),
      ),
      body: Container(
          color: Colors.blue,
          width: double.infinity,
          height: double.infinity,
          alignment: Alignment.center,
          child: getSelectedWidget(index: index)
      ),
    );
  }

  Widget getSelectedWidget({required int index}){
    Widget widget;
    switch(index){
      case 0:
        widget = const Location();
        break;
      default:
        widget = const HomePage();
        break;
    }
    return widget;
  }
}
