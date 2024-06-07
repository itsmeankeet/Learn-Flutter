// ignore_for_file: prefer_const_constructors

import 'package:expense_tracker_app/helper/helper_functions.dart';
import 'package:expense_tracker_app/models/expense.dart';
import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';

class MyListTile extends StatelessWidget {
  final Expense expense;
  void Function(BuildContext)? onEditPressed;
  void Function(BuildContext)? onDeletePressed;
  MyListTile(
      {super.key,
      required this.expense,
      required this.onEditPressed,
      required this.onDeletePressed});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      child: Container(
        decoration: BoxDecoration(
            color: Colors.grey.shade300,
            borderRadius: BorderRadius.circular(8)),
        child: Slidable(
          endActionPane: ActionPane(motion: const StretchMotion(), children: [
            //edit options
            SlidableAction(
              borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(8), bottomLeft: Radius.circular(8)),
              backgroundColor: Colors.grey.shade600,
              onPressed: onEditPressed,
              icon: Icons.edit,
            ),
            //delete option
            SlidableAction(
              borderRadius: BorderRadius.only(
                  topRight: Radius.circular(8),
                  bottomRight: Radius.circular(8)),
              backgroundColor: Colors.red,
              onPressed: onDeletePressed,
              icon: Icons.delete,
            ),
          ]),
          child: ListTile(
            title: Text(expense.name),
            trailing: Text(formatAmount(
              expense.amount,
            )),
          ),
        ),
      ),
    );
  }
}
