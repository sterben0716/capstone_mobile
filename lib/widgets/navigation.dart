import 'package:capstone_clenro/UI/bin_status.dart';
import 'package:capstone_clenro/UI/home_page.dart';
import 'package:capstone_clenro/UI/map_page.dart';
import 'package:capstone_clenro/UI/sample_chart.dart';
import 'package:capstone_clenro/UI/tracking_page.dart';
import 'package:flutter/material.dart';


class Navigation extends StatefulWidget {
  const Navigation({Key? key}) : super(key: key);

  @override
  State<Navigation> createState() => _NavigationState();
}

class _NavigationState extends State<Navigation> {

  int myCurrentIndex = 0;
  List pages = const[
    HomePage(),
    BinStatus(),
    MapPage(),

  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: Container(
        height: 60,
        decoration: const BoxDecoration(boxShadow: [
          BoxShadow(
            color: Colors.black,
            blurRadius: .5,
          )
        ]),
        child: BottomNavigationBar(
          elevation: 2,
          backgroundColor: Colors.white,
          selectedItemColor: Color(0xFF009E60),
          unselectedItemColor: Colors.black,
          currentIndex: myCurrentIndex,
          onTap: (index) {
            setState(() {
              myCurrentIndex = index;
            });
          },
          items: const [
            BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
            BottomNavigationBarItem(icon: Icon(Icons.data_exploration), label: 'Bin Status'),
            BottomNavigationBarItem(icon: Icon(Icons.location_on), label: 'Location')
          ],
        ),
        ),
      body: pages[myCurrentIndex],
      );
  }
}