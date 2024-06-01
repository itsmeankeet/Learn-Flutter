//this comment is very useful read this all
// // int x;
// //cannot initializr the null value in the parameeter
// //to define the null value in the parameter we have to use the ? operater which follows the variable type
// int? y;
// String? nameFromDatabase;
// //?? provide a fallback value in case the variable is null
// // String nameInApp = nameFromDatabase;
// //this statement cause an error
// String nameInApp = nameFromDatabase ?? "If name is null";

// //! after variable means you are certain this variable in not null
// /*
// Before null saftey
// if(nameFromDatabase == null) {
//   //rest of code
// }
// else{
//   return null
// }

// you can say nameFromDatabae?.name */
// void main() {
//   print(y);
//   print(nameFromDatabase!.length);
//   print(nameInApp);
// }

class Student {
  late final String name;
  late final int? score;

  Student({required this.name, this.score});

  String Percentage(int? score) {
    int totalScore = 15;
    double percentage = ((score?.toDouble() ?? 0) * 100 / totalScore);
    return score == null ? "Absent" : "${percentage.toStringAsFixed(2)}%";
  }
}

void main() {
  List<Student> students = [
    Student(name: "Ankit", score: 13),
    Student(name: "Mitch"),
    Student(name: "Dipesh", score: 10),
    Student(name: "Subash", score: 9)
  ];

  for (var i in students) {
    // ma aayeraw basdo rayexa students ko list ko first ma index 0 ani 1 ani 2
    print("${i.name} \t ${i.Percentage(i.score)}");
  }
}
