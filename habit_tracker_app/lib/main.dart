import 'package:flutter/material.dart';
import 'package:habit_tracker_app/databases/habit_database.dart';
import 'package:habit_tracker_app/pages/home_page.dart';
import 'package:habit_tracker_app/theme/theme_provider.dart';
import 'package:provider/provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  //initialize the database
  await HabitDatabase.initialize();
  await HabitDatabase().saveFirstLaunchDate();
  runApp(MultiProvider(
    providers: [
      //themeProvider
      ChangeNotifierProvider(create: (context) => ThemeProvider()),
      //habitdatabase provider
      ChangeNotifierProvider(
        create: (context) => HabitDatabase(),
      )
    ],
    child: const MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: Provider.of<ThemeProvider>(context).themeData,
      home: const HomePage(),
    );
  }
}
