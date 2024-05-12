void main() {
  Person person = new Person();
  person.setter("Ankit Adhikari", 20);
  print(person.returnAge());
  print(person.returnName());
}

class Person {
  String name = "";
  int age = 0;
  void setter(name, age) {
    this.name = name;
    this.age = age;
  }

  int returnAge() {
    return this.age;
  }

  String returnName() {
    return this.name;
  }
}
