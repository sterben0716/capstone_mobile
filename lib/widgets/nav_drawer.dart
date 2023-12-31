import 'package:capstone_clenro/UI/about_page.dart';
import 'package:flutter/material.dart';
import 'package:capstone_clenro/widgets/drawer_item.dart';

class CustomNavigationDrawer extends StatefulWidget {
  const CustomNavigationDrawer({Key? key}) : super(key: key);

  @override
  State<CustomNavigationDrawer> createState() => _CustomNavigationDrawerState();
}

class _CustomNavigationDrawerState extends State<CustomNavigationDrawer> {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Material(
        color: Colors.green,
        child: Padding(
          padding: const EdgeInsets.fromLTRB(24.0, 80, 24, 0),
          child: Column(
            children: [
              headerWidget(),
              const SizedBox(height: 10,),
              const Divider(thickness: 1, height: 10, color: Colors.lightGreen,),
              const SizedBox(height: 10,),
              DrawerItem(
                name: 'My Profile',
                icon: Icons.account_circle,
                onPressed: ()=> onItemPressed(context, index: 0),
              ),
              const SizedBox(height: 10,),
              DrawerItem(
                name: 'Settings',
                icon: Icons.settings,
                onPressed: ()=> onItemPressed(context, index: 1),
              ),
              const SizedBox(height: 10,),
              DrawerItem(
                name: 'Notifications',
                icon: Icons.notifications_active,
                onPressed: ()=> onItemPressed(context, index: 1),
              ),
              const SizedBox(height: 10,),
              DrawerItem(
                name: 'FAQs',
                icon: Icons.chat,
                onPressed: ()=> onItemPressed(context, index: 1),
              ),
              const SizedBox(height: 10,),
              DrawerItem(
                name: 'Share',
                icon: Icons.share_outlined,
                onPressed: ()=> onItemPressed(context, index: 1),
              ),
              const SizedBox(height: 10,),
              DrawerItem(
                name: 'About',
                icon: Icons.info_outline_rounded,
                onPressed: ()=> onItemPressed(context, index: 1),
              ),
              const SizedBox(height: 10,),
              DrawerItem(
                name: 'Log Out',
                icon: Icons.logout,
                onPressed: ()=> onItemPressed(context, index: 1),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void onItemPressed(BuildContext context, {required int index}){
    Navigator.pop(context);

    switch(index){
      case 0:
        Navigator.push(context, MaterialPageRoute(builder: (context)=>AboutPage()));
        break;
      default:
        Navigator.pop(context);
        break;
    }
  }
  Widget headerWidget(){
    return Row(
      children: [
        const CircleAvatar(
          radius: 40,
          backgroundImage: AssetImage('images/profpic.jpg'),
        ),
        const SizedBox(width: 20,),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: const [
            Text('Japhet Steve Ong', style: TextStyle(fontSize: 16, color: Colors.white)),
            SizedBox(height: 10,),
            Text('japhet@email.com', style: TextStyle(fontSize: 14, color: Colors.white),)
          ],
        )
      ],
    );
  }
}