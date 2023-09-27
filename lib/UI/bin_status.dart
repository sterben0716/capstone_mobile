import 'package:capstone_clenro/UI/chart.dart';
import 'package:capstone_clenro/utils/constants.dart';
import 'package:capstone_clenro/widgets/nav_drawer.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';


class BinStatus extends StatefulWidget {
  const BinStatus({Key? key}) : super(key: key);

  @override
  State<BinStatus> createState() => _BinStatusState();
}

class _BinStatusState extends State<BinStatus> {


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: const CustomNavigationDrawer(),
      appBar: AppBar(
        title: const Text('Bin Status'),
        centerTitle: false,
        backgroundColor: Colors.green,
      ),
      body: Row(
        children: [
          Expanded(flex: 4, child: Container(
            padding: EdgeInsets.symmetric(horizontal: Constants.defaultPadding *2),
            child: Column(
              children: [
              Row(children: [
                Expanded(child: Container(
                  padding: EdgeInsets.all(Constants.defaultPadding),
                  height: 160,
                  width: 250,
                  decoration: const BoxDecoration(
                    color: Colors.lightGreen,
                    borderRadius: BorderRadius.all(Radius.circular(10))
                  ),
                  child: Row(children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                      Text('Waste Level', style: GoogleFonts.ubuntu(
                          color: Colors.white,
                          fontSize: 24,
                          fontWeight: FontWeight.w600
                      ),),
                        SizedBox(height: 7,),
                        RichText(text: TextSpan(
                          text: 'Percentage',
                          style: GoogleFonts.ubuntu(
                            color: Colors.white
                          )
                        ))
                    ],
                    ),
                    SizedBox(width: Constants.defaultPadding *2,),
                    SizedBox(
                      child: CircularPercentIndicator(
                        radius: 50,
                        lineWidth: 15,
                        percent: 0.6,
                        circularStrokeCap: CircularStrokeCap.round,
                        backgroundColor: Constants.bgColor,
                        linearGradient: const LinearGradient(colors: [
                          Color(0xFF526ADA),
                          Color(0xFF526ADA),
                          Color(0xFF78E5E7)
                        ],
                          begin: Alignment.topCenter, end: Alignment.bottomCenter),
                        center: Text(
                          '70%',
                          style: GoogleFonts.ubuntu(
                            color: Colors.white,
                            fontSize: 18,
                            fontWeight: FontWeight.w800
                          ),
                        ),
                      ),
                    ),
                  ],
                  ),
                )
                ),
              ],
              ),
                SizedBox(height: 30,),
                const Chart(),
            ],
            ),
          )
          )
        ],
      ),
    );
  }
}

