import 'package:flutter/material.dart';
import 'package:flutter_heatmap_calendar/flutter_heatmap_calendar.dart';

class MyHeatmap extends StatelessWidget {
  final DateTime startDate;
  final Map<DateTime, int>? datasets;

  const MyHeatmap({Key? key, required this.startDate, required this.datasets})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return HeatMap(
      startDate: startDate,
      endDate: DateTime.now(),
      datasets: datasets,
      showText: true,
      colorMode: ColorMode.color,
      defaultColor: Theme.of(context).colorScheme.secondary,
      textColor: Theme.of(context).colorScheme.inversePrimary,
      showColorTip: false,
      size: 40,
      colorsets: {
        1: Colors.green.shade300,
        2: Colors.green.shade400,
        3: Colors.green.shade500,
        4: Colors.green.shade600,
        5: Colors.green.shade700,
        6: Colors.green.shade800,
        7: Colors.green.shade900,
        8: const Color(0xFF005700), // Custom dark green
        9: const Color(0xFF003300),
      },
    );
  }
}
