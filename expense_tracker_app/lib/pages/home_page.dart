import 'package:expense_tracker_app/components/my_list_tile.dart';
import 'package:expense_tracker_app/database/expense_database.dart';
import 'package:expense_tracker_app/helper/helper_functions.dart';
import 'package:expense_tracker_app/models/expense.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  //textediting controller
  final TextEditingController nameController = TextEditingController();
  final TextEditingController amountController = TextEditingController();
  //to show for the first list
  @override
  void initState() {
    Provider.of<ExpenseDatabase>(context, listen: false).readExpense();
    super.initState();
  }

  //to clear the controller
  void clearController() {
    nameController.clear();
    amountController.clear();
  }

  //to create a new expense
  void createNewExpense() {
    showDialog(
        context: context,
        builder: (context) => AlertDialog(
              title: const Text('Create a new Expense?'),
              content: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  TextField(
                    decoration: const InputDecoration(
                      border: OutlineInputBorder(),
                      label: Text('Expense Name'),
                    ),
                    controller: nameController,
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  TextField(
                    decoration: const InputDecoration(
                      border: OutlineInputBorder(),
                      label: Text('Expense Amount'),
                    ),
                    controller: amountController,
                  ),
                ],
              ),
              actions: [
                _cancelButton(),
                _saveButton(),
              ],
            ));
  }

  //onedit pressed
  void onEditPressed(Expense expense) {
    nameController.text = expense.name;
    amountController.text = expense.amount.toString();

    showDialog(
        context: context,
        builder: (context) => AlertDialog(
              title: const Text('Update a new Expense?'),
              content: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  TextField(
                    decoration: const InputDecoration(
                      border: OutlineInputBorder(),
                      label: Text('Expense Name'),
                    ),
                    controller: nameController,
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  TextField(
                    decoration: const InputDecoration(
                      border: OutlineInputBorder(),
                      label: Text('Expense Amount'),
                    ),
                    controller: amountController,
                  ),
                ],
              ),
              actions: [
                _cancelButton(),
                _editButton(expense),
              ],
            ));
  }

  //on delete pressed
  void onDeletePressed(int id) {
    showDialog(
        context: context,
        builder: (context) => AlertDialog(
              title: const Text('Confirm Delete'),
              actions: [
                _cancelButton(),
                _deleteButton(id),
              ],
            ));
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<ExpenseDatabase>(
        builder: (context, value, child) => Scaffold(
              floatingActionButton: FloatingActionButton(
                onPressed: createNewExpense,
                child: const Icon(Icons.add),
              ),
              body: ListView.builder(
                  itemCount: value.allExpense.length,
                  itemBuilder: (context, int index) {
                    //get individual expense items

                    Expense individualExpense = value.allExpense[index];
                    return MyListTile(
                      expense: individualExpense,
                      onDeletePressed: (context) =>
                          onDeletePressed(individualExpense.id),
                      onEditPressed: (context) =>
                          onEditPressed(individualExpense),
                    );
                  }),
            ));
  }

  Widget _cancelButton() {
    return MaterialButton(
      onPressed: () {
        //pop the box
        Navigator.pop(context);
        //clear the controller
        clearController();
      },
      child: const Text('Cancel'),
    );
  }

  Widget _saveButton() {
    return MaterialButton(
      onPressed: () async {
        if (nameController.text.isEmpty) {
          // Show an error message if the name field is empty
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(content: Text('Please enter a name')),
          );
          return;
        }

        if (amountController.text.isEmpty) {
          // Show an error message if the amount field is empty
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(content: Text('Please enter an amount')),
          );
          return;
        }
        if (nameController.text.isNotEmpty && nameController.text.isNotEmpty) {
          //make an object to pass
          Expense newExpense = Expense(
              name: nameController.text,
              amount: convertStringIntoDouble(amountController.text),
              date: DateTime.now());
          //save tyo the database
          await context.read<ExpenseDatabase>().addExpense(newExpense);
        }
        //pop the box
        // ignore: use_build_context_synchronously
        Navigator.pop(context);
        //clear the controller
        clearController();
      },
      child: const Text('Save'),
    );
  }

  Widget _deleteButton(int id) {
    return MaterialButton(
      onPressed: () async {
        Navigator.pop(context);
        print(id);
        await context.read<ExpenseDatabase>().deleteExpense(id);
      },
      child: const Text('Confirm Delete?'),
    );
  }

  Widget _editButton(Expense expense) {
    return MaterialButton(
      onPressed: () async {
        //find the specific expense
        Expense updatingExpense = Expense(
            name: nameController.text.isNotEmpty
                ? nameController.text
                : expense.name,
            amount: amountController.text.isNotEmpty
                ? convertStringIntoDouble(amountController.text)
                : expense.amount,
            date: DateTime.now());

        int existingid = expense.id;
        // update the expense
        await context
            .read<ExpenseDatabase>()
            .updateExpense(existingid, updatingExpense);
        //clear the controller
        clearController();
        //pop the window
        Navigator.pop(context);
      },
      child: const Text('Save'),
    );
  }
}
