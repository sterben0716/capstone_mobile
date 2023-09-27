import 'package:flutter/material.dart';
import 'package:capstone_clenro/widgets/nav_drawer.dart';



class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePage();
}

class _HomePage extends State<HomePage> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        drawer: const CustomNavigationDrawer(),
        appBar: AppBar(
          title: const Text('Dashboard'),
          centerTitle: false,
          backgroundColor: Colors.green,
        ),
        body: SafeArea(
            child: CustomScrollView(
              slivers: [
                SliverToBoxAdapter(
                  child: SizedBox(height: 230, child: _head ()),
                ),
                const SliverToBoxAdapter(
                  child: Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Collection History',
                          style: TextStyle(
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
                          child: Image.asset('images/calendar.png', height: 40,),
                        ),
                        title: const Text(
                          'Bolonsiri Public Cemetery',
                          style: TextStyle(
                            fontSize: 17,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        subtitle: const Text(
                          '2023-06-20 08:42:34',
                          style: TextStyle(
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      );
                    }
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
                    color: Colors.lightGreen,
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
                          child: Container(
                            height: 40,
                            width: 40,
                            color: const Color.fromRGBO(250, 250, 250, 0.1),
                            child: const Icon(
                              Icons.notification_add_outlined,
                              size: 30,
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ),
                      const Padding(
                        padding: EdgeInsets.only(top: 20, left: 10),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              ' Good Day!',
                              style: TextStyle(
                                fontWeight: FontWeight.w500,
                                fontSize: 40,
                                color: Colors.white,
                              ),
                            ),
                            Text(
                              '   Sterben',
                              style: TextStyle(
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
                      color: Color.fromRGBO(47, 125, 121, 0.3),
                      offset: Offset(0, 6),
                      blurRadius: 12,
                      spreadRadius: 6,
                    ),
                  ],
                  color: Colors.lightGreen,
                  borderRadius: BorderRadius.circular(15),
                ),
                child: const Column(
                  children: [
                    SizedBox(height: 10),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 15),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'Last Garbage Collection:',
                            style: TextStyle(
                              fontWeight: FontWeight.w500,
                              fontSize: 16,
                              color: Colors.white,
                            ),
                          ),
                          Icon(
                            Icons.more_horiz,
                            color: Colors.white,
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: 10),
                    Row(
                      children: [
                        Text('   \September 20. 2023',
                            style: TextStyle(
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

