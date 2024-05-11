void main() {
  Person person = new Person(name: "Cr7HoraaA", age: 26);
  person.display();

  //person 1 normal tarika lae ne sakinxa hai tra yesari gare ne hunxa hai
  Person person2 = new Person(name: "SekriHoraa", age: 22);
  person2.display();
}

class Person {
  String? name;
  int? age;
  //lets make a constructor
  Person({name, age}) {
    this.name = name;
    this.age = age;
  }

  //function to display
  display() {
    print(name);
    print(age);
  }
}
