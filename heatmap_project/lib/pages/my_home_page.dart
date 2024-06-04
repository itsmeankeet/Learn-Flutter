import 'package:flutter/material.dart';
import 'package:flutter_heatmap_calendar/flutter_heatmap_calendar.dart';

class MyHomePage extends StatelessWidget {
  const MyHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return HeatMap(
      datasets: {
        DateTime(2024, 6, 6): 1,
        DateTime(2024, 6, 7): 2,
        DateTime(2024, 6, 8): 3,
        DateTime(2024, 6, 9): 4,
        DateTime(2024, 6, 10): 5,
        DateTime(2024, 6, 11): 6,
        DateTime(2024, 6, 12): 7,
        DateTime(2024, 6, 13): 8,
        DateTime(2024, 6, 14): 9,
      },
      scrollable: true,
      size: 40,
      colorsets: {
        1: const Color.fromARGB(255, 72, 207, 77),
        2: const Color.fromARGB(255, 58, 171, 62),
        3: Colors.green.shade300,
        4: const Color.fromARGB(255, 14, 198, 23),
        5: Colors.green.shade600,
        6: Colors.green.shade700,
        7: Color.fromARGB(255, 17, 230, 27),
        8: const Color.fromARGB(255, 3, 245, 19),
      },
      textColor: Colors.white,
      startDate: DateTime.now(),
      endDate: DateTime.now().add(const Duration(days: 10)),
      onClick: (value) {
        ScaffoldMessenger.of(context)
            .showSnackBar(SnackBar(content: Text(value.toString())));
      },
    );
  }
}
