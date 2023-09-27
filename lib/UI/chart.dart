import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

class Chart extends StatefulWidget {
  const Chart({Key? key}) : super(key: key);

  @override
  State<Chart> createState() => _ChartState();
}

class _ChartState extends State<Chart> {
  @override
  Widget build(BuildContext context) {
    return Container(
        width: double.infinity,
        height: 400,
        decoration: BoxDecoration(
          color: Colors.lightGreen,
          borderRadius: BorderRadius.all(Radius.circular(10))
        ),
        child: SfCartesianChart(
          primaryXAxis: CategoryAxis(
            axisLine: AxisLine(width: 0),
            labelPlacement: LabelPlacement.onTicks,
            edgeLabelPlacement: EdgeLabelPlacement.shift,
            majorGridLines: MajorGridLines(width: 0),
            majorTickLines: MajorTickLines(width: 0),
          ),
          primaryYAxis: NumericAxis(
            majorGridLines: MajorGridLines(width: 0),
            majorTickLines: MajorTickLines(width: 0),
            axisLine: AxisLine(width: 0),
            minimum: 0,
            maximum: 5,
            interval: 1
          ),
          series: <ChartSeries<BinData, String>>[
            SplineSeries<BinData, String>(
              dataSource: <BinData>[
                BinData(1, 'M'),
                BinData(4, 'T'),
                BinData(2, 'W'),
                BinData(3, 'Th'),
                BinData(2, 'F'),
                BinData(1, 'Sa'),
                BinData(2, 'Su'),
              ],
              xValueMapper: (BinData bin,_)=>bin.height,
              yValueMapper: (BinData bin,_)=>bin.meter,
            ),
            SplineAreaSeries(
                dataSource: <BinData>[
                  BinData(1, 'M'),
                  BinData(4, 'T'),
                  BinData(2, 'W'),
                  BinData(3, 'Th'),
                  BinData(2, 'F'),
                  BinData(1, 'Sa'),
                  BinData(2, 'Su'),
                ],
                xValueMapper: (BinData bin,_)=>bin.height,
                yValueMapper: (BinData bin,_)=>bin.meter,
              gradient: LinearGradient(colors: [
                Color(0xFF342C9C),
                Color(0xFF342C9C).withAlpha(23),
              ],
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
              ),
            ),
          ],
        ),
    );
  }
}

class BinData{
  BinData(this.meter,this.height);
  final String height;
  final int meter;
}
