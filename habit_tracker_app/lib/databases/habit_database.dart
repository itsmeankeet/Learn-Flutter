import 'package:flutter/material.dart';
import 'package:habit_tracker_app/models/app_setting.dart';
import 'package:habit_tracker_app/models/habit.dart';
import 'package:isar/isar.dart';
import 'package:path_provider/path_provider.dart';

class HabitDatabase extends ChangeNotifier {
  // Initialize the database
  static late Isar isar;
  static Future<void> initialize() async {
    final dir = await getApplicationDocumentsDirectory();
    isar =
        await Isar.open([HabitSchema, AppSettingSchema], directory: dir.path);
  }

  // Save our first date of the app
  Future<void> saveFirstLaunchDate() async {
    final existingSettings = await isar.appSettings.where().findFirst();
    if (existingSettings == null) {
      final settings = AppSetting()..firstLaunchDate = DateTime.now();
      await isar.writeTxn(() => isar.appSettings.put(settings));
    }
  }

  // Get our first date of the app
  Future<DateTime?> getFirstLaunchDate() async {
    final settings = await isar.appSettings.where().findFirst();
    return settings?.firstLaunchDate;
  }

  // List of habits
  List<Habit> currentHabits = [];

  // CREATE a new habit
  Future<void> addHabit(String habitName) async {
    final habit = Habit()..habit = habitName;
    await isar.writeTxn(() => isar.habits.put(habit));
    await readHabits(); // Ensure this is awaited
  }

  // Read all habits from the db
  Future<void> readHabits() async {
    List<Habit> habits = await isar.habits.where().findAll();
    currentHabits = habits; // Directly assign instead of clearing and adding
    notifyListeners();
  }

  // Update habit completion status
  Future<void> updateHabitCompletion(int id, bool isCompleted) async {
    final habit = await isar.habits.get(id);
    if (habit != null) {
      await isar.writeTxn(() async {
        final today = DateTime.now();
        final todayDate = DateTime(today.year, today.month, today.day);
        if (isCompleted) {
          if (!habit.completeddays.contains(todayDate)) {
            habit.completeddays.add(todayDate);
          }
        } else {
          habit.completeddays.removeWhere((date) =>
              date.year == todayDate.year &&
              date.month == todayDate.month &&
              date.day == todayDate.day);
        }
        await isar.habits.put(habit);
      });
    }
    await readHabits();
  }

  // Update habit name
  Future<void> updateHabitName(int id, String newName) async {
    final habit = await isar.habits.get(id);
    if (habit != null) {
      await isar.writeTxn(() async {
        habit.habit = newName;
        await isar.habits.put(habit);
      });
    }
    await readHabits();
  }

  // Delete habit
  Future<void> deleteHabit(int id) async {
    await isar.writeTxn(() async {
      await isar.habits.delete(id);
    });
    await readHabits();
  }
}
