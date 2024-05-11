void main() {
  Person person = new Person();
  person.name = "Cr7HoraaA";
  person.age = 26;
  person.display();

  //person 1
  Person person2 = new Person();
  person2.name = "SekriHoraa";
  person2.age = 23;
  person2.display();
}

class Person {
  String? name;
  int? age;

  //function to display
  display() {
    print(name);
    print(age);
  }
}
