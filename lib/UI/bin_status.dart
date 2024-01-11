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
        title: Text('Bin Status',
          style: GoogleFonts.sofiaSans(fontSize: 22, fontWeight: FontWeight.bold),
        ),
        centerTitle: false,
        backgroundColor: Color(0xFF009E60),
      ),
      body: Row(
        children: [
          Expanded(flex: 4, child: Container(
            padding: EdgeInsets.symmetric(horizontal: Constants.defaultPadding *2),
            child: Column(
              children: [
                SizedBox(height: 20,),
                Row(children: [
                Expanded(child: Container(
                  padding: EdgeInsets.all(Constants.defaultPadding),
                  height: 160,
                  width: 250,
                  decoration: const BoxDecoration(
                    color: Color(0xFF00A36C),
                    borderRadius: BorderRadius.all(Radius.circular(10))
                  ),
                  child: Row(children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                      Text('Waste Level', style: GoogleFonts.sofiaSans(
                          color: Colors.white,
                          fontSize: 24,
                          fontWeight: FontWeight.w600
                      ),),
                        const SizedBox(height: 7,),
                        RichText(text: TextSpan(
                          text: 'Percentage',
                          style: GoogleFonts.sofiaSans(
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
                        percent: 0.7,
                        circularStrokeCap: CircularStrokeCap.round,
                        animation: true,
                        animationDuration: 2000,
                        backgroundColor: Constants.bgColor,
                        linearGradient: const LinearGradient(colors: [
                          Color(0xFF78E5E7),
                          Color(0xFF4265D6),
                          Color(0xFF526ADA),
                        ],
                          begin: Alignment.topCenter, end: Alignment.bottomCenter),
                        center: Text(
                          '70%',
                          style: GoogleFonts.sofiaSans(
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
                const SizedBox(height: 30,),
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

