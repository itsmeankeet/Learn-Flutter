void main() {
  Person person = new Person("Cr7HoraaA", 26);
  person.display();

  //person 1
  Person person2 = new Person("SekriHoraa", 23);
  person2.display();
}

class Person {
  String? name;
  int? age;
  //lets make a constructor
  Person(name, age) {
    this.name = name;
    this.age = age;
  }

  //function to display
  display() {
    print(name);
    print(age);
  }
}
