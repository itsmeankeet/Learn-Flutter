// ignore_for_file: slash_for_doc_comments, prefer_final_fields

import 'package:expense_tracker_app/models/expense.dart';
import 'package:flutter/material.dart';
import 'package:isar/isar.dart';
import 'package:path_provider/path_provider.dart';

class ExpenseDatabase extends ChangeNotifier {
  /**
   *  S E T U P
   */
  //initialize the database
  static late Isar isar;
  static Future<void> initialize() async {
    final dir = await getApplicationDocumentsDirectory();
    isar = await Isar.open([ExpenseSchema], directory: dir.path);
  }
  /**
   * L I S T  O F  E X P E N S E
   */
  //list of current expense

  List<Expense> _allExpense = [];

  /**
   * O P E R A T I O N S
   */

  //create a expense

  Future<void> addExpense(Expense newExpense) async {
    //write in the database
    await isar.writeTxn(() => isar.expenses.put(newExpense));
    //re read the list
    readExpense();
  }

  //read all the expense
  Future<void> readExpense() async {
    //read all the lsit
    List<Expense> newExpenseList = await isar.expenses.where().findAll();
    //update the list
    _allExpense.clear();
    _allExpense.addAll(newExpenseList);
    //update the ui
    notifyListeners();
  }

  //update the expense

  Future<void> updateExpense(int id, Expense updatedExpense) async {
    //updatedExpense id should be same to old id
    updatedExpense.id = id;
    //update the expense
    await isar.writeTxn(() => isar.expenses.put(updatedExpense));
    //update the ui
    readExpense();
  }

  //delete the expense
  Future<void> deleteExpense(int id) async {
    //delete the expense
    await isar.writeTxn(() => isar.expenses.delete(id));
    //update the ui
    await readExpense();
  }

  /**
   * G E T T E R S
   */
  //to get the list of all expense
  List<Expense> get allExpense => _allExpense;
}
