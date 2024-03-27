import 'package:flutter/cupertino.dart';
import 'package:home_practice_1/Screens/settings.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

class ChartRing extends StatefulWidget {
  const ChartRing({super.key});

  @override
  State<ChartRing> createState() => _ChartRingState();
}

class _ChartRingState extends State<ChartRing> {
  @override
  Widget build(BuildContext context) {
    return SfCircularChart(
      onDataLabelRender: (DataLabelRenderArgs args) {
        args.text = "${args.text}.0%";
      },
      series: <CircularSeries>[
        DoughnutSeries<ChartData, String>(
          dataLabelSettings: DataLabelSettings(isVisible: true),
          dataSource: chartdata,
          innerRadius: '60%',
          startAngle: 350,
          endAngle: 350,
          pointColorMapper: (ChartData data, _) => data.color,
          xValueMapper: (ChartData data, _) => data.x,
          yValueMapper: (ChartData data, _) => data.y,
        )
      ],
    );
  }
}
