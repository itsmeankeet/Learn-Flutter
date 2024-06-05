import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:habit_tracker_app/models/habit.dart';

class HabitListTile extends StatelessWidget {
  final String name;
  bool isCompleted;
  void Function(bool?)? onChanged;
  void Function(BuildContext)? onEditPressed;
  void Function(BuildContext)? onDeletePressed;

  HabitListTile({
    super.key,
    required this.name,
    required this.isCompleted,
    required this.onChanged,
    required this.onEditPressed,
    required this.onDeletePressed,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
      child: Slidable(
        endActionPane: ActionPane(motion: const StretchMotion(), children: [
          //edit option
          SlidableAction(
              onPressed: onEditPressed,
              backgroundColor: Colors.grey.shade800,
              icon: Icons.edit,
              borderRadius: BorderRadius.circular(8)),
          //delete option
          SlidableAction(
              onPressed: onDeletePressed,
              backgroundColor: Colors.red,
              icon: Icons.delete,
              borderRadius: BorderRadius.circular(8))
        ]),
        child: GestureDetector(
          onTap: () {
            if (onChanged != null) {
              onChanged!(!isCompleted);
            }
          },
          child: Container(
            padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12),
                color: isCompleted
                    ? Colors.green
                    : Theme.of(context).colorScheme.secondary),
            child: ListTile(
              title: Text(name),
              leading: Checkbox(
                activeColor: Colors.green,
                value: isCompleted,
                onChanged: onChanged,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
