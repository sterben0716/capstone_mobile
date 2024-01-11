import 'package:capstone_clenro/UI/login_page.dart';
import 'package:capstone_clenro/UI/sidebar_pages/about_page.dart';
import 'package:capstone_clenro/UI/sidebar_pages/edit_profile.dart';
import 'package:capstone_clenro/UI/sidebar_pages/profile_page.dart';
import 'package:capstone_clenro/models/user.dart';
import 'package:flutter/material.dart';
import 'package:capstone_clenro/widgets/drawer_item.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:quickalert/models/quickalert_type.dart';
import 'package:quickalert/widgets/quickalert_dialog.dart';

class CustomNavigationDrawer extends StatefulWidget {
  const CustomNavigationDrawer({Key? key}) : super(key: key);

  @override
  State<CustomNavigationDrawer> createState() => _CustomNavigationDrawerState();
}

class _CustomNavigationDrawerState extends State<CustomNavigationDrawer> {
  User? user;

  @override
  void initState() {
    super.initState();
    getDataFromStorage();
  }

  Future? getDataFromStorage() async {
    user = await User.getUser();
    setState(() {});
  }
  void showAlert()async {
    QuickAlert.show(
      context: context,
      type: QuickAlertType.warning,
      title: 'Are you sure',
      text: 'do you want to log out?',
      confirmBtnText: 'Yes',
      cancelBtnText: 'No',
      confirmBtnColor: Colors.teal,
      showCancelBtn: true,
      onConfirmBtnTap: () {
        Navigator.push(context, MaterialPageRoute(builder: (context) => LoginPage()),
        );
      }
    );
  }

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Material(
        color: const Color(0xFF009E60),
        child: Padding(
          padding: const EdgeInsets.fromLTRB(24.0, 80, 24, 0),
          child: Column(
            children: [
              headerWidget(),
              const SizedBox(height: 10,),
              const Divider(thickness: 1, height: 10, color: Colors.white,),
              const SizedBox(height: 10,),
              DrawerItem(
                name: 'Account',
                icon: Icons.account_circle,
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => ProfilePage()),
                  );
                }
              ),
              const SizedBox(height: 10,),
              DrawerItem(
                name: 'Profile Settings',
                icon: Icons.settings,
                onPressed: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) => EditProfile()),
                  );
                }
              ),
              const SizedBox(height: 10,),
              DrawerItem(
                name: 'Notifications',
                icon: Icons.notifications_active,
                onPressed: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) => LoginPage()),
                  );
                },
              ),
              const SizedBox(height: 10,),
              DrawerItem(
                name: 'About',
                icon: Icons.info,
                onPressed: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) => AboutPage()),
                  );
                },
              ),
              const SizedBox(height: 10,),
              DrawerItem(
                name: 'Log Out',
                icon: Icons.logout,
                onPressed: () {
                  showAlert();
                },
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget headerWidget(){
    return Row(
      children: [
        const CircleAvatar(
          radius: 30,
          backgroundImage: AssetImage('images/profpic.jpg'),
        ),
        const SizedBox(width: 20,),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('${user?.username}', style: GoogleFonts.sofiaSans(fontSize: 16, color: Colors.white)),
            const SizedBox(height: 5,),
            Text('${user?.email}', style: GoogleFonts.sofiaSans(fontSize: 14, color: Colors.white),)
          ],
        )
      ],
    );
  }
}