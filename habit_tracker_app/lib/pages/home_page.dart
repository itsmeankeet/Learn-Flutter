import 'package:flutter/material.dart';
import 'package:habit_tracker_app/components/habit_list_tile.dart';
import 'package:habit_tracker_app/components/my_drawer.dart';
import 'package:habit_tracker_app/components/my_heatmap.dart';
import 'package:habit_tracker_app/databases/habit_database.dart';
import 'package:habit_tracker_app/models/habit.dart';
import 'package:habit_tracker_app/util/habit_util.dart';
import 'package:provider/provider.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  void initState() {
    super.initState();
    //to display the lis of habit in the first state
    // Read existing habits in the database
    Provider.of<HabitDatabase>(context, listen: false).readHabits();
  }

  final TextEditingController textController = TextEditingController();

  void createHabit() {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        content: TextField(
          controller: textController,
          decoration: const InputDecoration(
            hintText: 'Create new habit',
          ),
        ),
        actions: [
          MaterialButton(
            onPressed: () {
              Navigator.pop(context);
              textController.clear();
            },
            child: const Text("Cancel"),
          ),
          MaterialButton(
            onPressed: () {
              String habitName = textController.text;
              context.read<HabitDatabase>().addHabit(habitName);
              Navigator.pop(context);
              textController.clear();
            },
            child: const Text("Confirm"),
          ),
        ],
      ),
    );
  }

  void onChanged(bool? value, Habit currentHabit) {
    if (value != null) {
      context
          .read<HabitDatabase>()
          .updateHabitCompletion(currentHabit.id, value);
    }
  }

  void editHabit(Habit habit) {
    textController.text = habit.habit;
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text("Edit a habit"),
        content: TextField(
          controller: textController,
        ),
        actions: [
          MaterialButton(
            onPressed: () {
              Navigator.pop(context);
              textController.clear();
            },
            child: const Text("Cancel"),
          ),
          MaterialButton(
            onPressed: () {
              String newHabit = textController.text;
              context.read<HabitDatabase>().updateHabitName(habit.id, newHabit);
              Navigator.pop(context);
              textController.clear();
            },
            child: const Text("Update"),
          ),
        ],
      ),
    );
  }

  void deleteHabit(BuildContext context, Habit habit) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text("Confirm Delete?"),
        actions: [
          MaterialButton(
            onPressed: () {
              Navigator.pop(context);
              textController.clear();
            },
            child: const Text("Cancel"),
          ),
          MaterialButton(
            onPressed: () {
              context.read<HabitDatabase>().deleteHabit(habit.id);
              Navigator.pop(context);
              textController.clear();
            },
            child: const Text("Confirm Delete"),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.surface,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
        foregroundColor: Theme.of(context).colorScheme.inversePrimary,
      ),
      drawer: const MyDrawer(),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Theme.of(context).colorScheme.tertiary,
        onPressed: createHabit,
        child: Icon(
          Icons.add,
          color: Theme.of(context).colorScheme.inversePrimary,
        ),
      ),
      body: ListView(children: [
        //heatmap
        _buildHeatMap(),

        const SizedBox(
          height: 30,
        ),
        //habits
        _buildHabitList()
      ]),
    );
  }

  Widget _buildHabitList() {
    final habit = context.watch<HabitDatabase>();
    List<Habit> currentHabits = habit.currentHabits;

    return ListView.builder(
      itemCount: currentHabits.length,
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemBuilder: (context, int index) {
        final currentHabit = currentHabits[index];
        bool isCompletedToday =
            isHabitCompletedToday(currentHabit.completeddays);

        return HabitListTile(
          name: currentHabit.habit,
          isCompleted: isCompletedToday,
          onChanged: (value) => onChanged(value, currentHabit),
          onEditPressed: (context) => editHabit(currentHabit),
          onDeletePressed: (context) => deleteHabit(context, currentHabit),
        );
      },
    );
  }

  Widget _buildHeatMap() {
    //habit database
    final habitDatabase = context.watch<HabitDatabase>();
    //current habit
    List<Habit> currentHabits = habitDatabase.currentHabits;

    return FutureBuilder<DateTime?>(
        future: habitDatabase.getFirstLaunchDate(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return MyHeatmap(
                startDate: snapshot.data!,
                datasets: prepDataSets(currentHabits));
          } else {
            return Container();
          }
        });
  }
}
