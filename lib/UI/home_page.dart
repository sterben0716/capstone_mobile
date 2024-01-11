import 'package:capstone_clenro/models/user.dart';
import 'package:capstone_clenro/widgets/list_data.dart';
import 'package:flutter/material.dart';
import 'package:capstone_clenro/widgets/nav_drawer.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:quickalert/quickalert.dart';



class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePage();
}

class _HomePage extends State<HomePage> {

  var username = '';
  User? user;
  var userList = [];

  @override
  void initState() {
    super.initState();
    getDataFromStorage();
  }

  Future? getDataFromStorage() async {
    user = await User.getUser();
    setState(() {});
  }
  void showAlert() async{
    QuickAlert.show(
        context: context,
        title: "Successfully Collected",
        text: "October 22, 2023 | 11:38 AM",
        type: QuickAlertType.success,
        showConfirmBtn: false,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        drawer: const CustomNavigationDrawer(),
        appBar: AppBar(
          title: Text('Dashboard',
              style: GoogleFonts.sofiaSans(fontWeight: FontWeight.bold, fontSize: 22),
          ),
          centerTitle: false,
          backgroundColor: Color(0xFF009E60),
        ),
        body: SafeArea(
            child: CustomScrollView(
              slivers: [
                SliverToBoxAdapter(
                  child: Container(height: 230, child: _head ()),
                ),
                SliverToBoxAdapter(
                  child: Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Collection History',
                          style: GoogleFonts.sofiaSans(
                            fontWeight: FontWeight.w600,
                            fontSize: 25,
                            color: Colors.black,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                SliverList(delegate: SliverChildBuilderDelegate(
                        (context, index) {
                      return ListTile(
                        leading: ClipRRect(
                          borderRadius: BorderRadius.circular(5),
                          child: Image.asset('images/${geter()[index].image!}', height: 40,),
                        ),
                        title: Text(
                          geter()[index].location!,
                          style: GoogleFonts.sofiaSans(
                            fontSize: 17,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        subtitle: Text(
                          geter()[index].date!,
                          style: GoogleFonts.sofiaSans(
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        trailing: const Icon(Icons.navigate_next_outlined),
                        contentPadding: const EdgeInsets.all(1),
                        onTap: (){
                          showAlert();
                        },
                      );
                    },
                  childCount: geter().length,
                )
                )
              ],
            )
        )
    );
  }

  Widget _head(){
    return SafeArea(
        child: Stack(
          children: [
            Column(
              children: [
                Container(
                  width: double.infinity,
                  height: 150,
                  decoration: const BoxDecoration(
                    color: Color(0xFF00A36C),
                    borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(20),
                      bottomRight: Radius.circular(20),
                    ),
                  ),
                  child: Stack(
                    children: [
                      Positioned(
                        top: 35,
                        left: 340,
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(7),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(top: 20, left: 10),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              ' Welcome!',
                              style: GoogleFonts.sofiaSans(
                                fontWeight: FontWeight.w500,
                                fontSize: 40,
                                color: Colors.white,
                              ),
                            ),
                            Text(
                              '  ${user?.username}',
                              style: GoogleFonts.sofiaSans(
                                fontWeight: FontWeight.w600,
                                fontSize: 30,
                                color: Colors.white,
                              ),
                            ),
                          ],
                        ),
                      )
                    ],
                  ),
                ),
              ],
            ),
            Positioned(
              top: 115,
              left: 37,
              child: Container(
                height: 90,
                width: 320,
                decoration: BoxDecoration(
                  boxShadow: const [
                    BoxShadow(
                      color: Color.fromRGBO(49, 125, 121, 0.3),
                      offset: Offset(0, 6),
                      blurRadius: 12,
                      spreadRadius: 6,
                    ),
                  ],
                  color: const Color(0xFF00A36C),
                  borderRadius: BorderRadius.circular(15),
                ),
                child: Column(
                  children: [
                    const SizedBox(height: 10),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 15),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'Last Garbage Collection:',
                            style: GoogleFonts.sofiaSans(
                              fontWeight: FontWeight.w500,
                              fontSize: 16,
                              color: Colors.white,
                            ),
                          ),
                          const Icon(
                            Icons.more_horiz,
                            color: Colors.white,
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 10),
                    Row(
                      children: [
                        Text('   \September 20. 2023',
                            style: GoogleFonts.sofiaSans(
                              fontWeight: FontWeight.bold,
                              fontSize: 25,
                              color: Colors.white,
                            )
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            )
          ],
        )
    );
  }
}

