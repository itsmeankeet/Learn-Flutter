void main() {
  var a = 10;
  print(a);
  var b = 'Hello this is my first dart program';
  print(b);
  List names = ['Joe', 'John', 'Ram'];
  print(names[0]);

  //to take the index of the loop
  int index = names.indexOf("Joe");
  print(index);

  //to add element in the list
  names.add("Ankit");
  print(names[3]);
  //print the length of the list
  print("Before removing the element \n");
  print(names.length);
  //to remove element from the list
  print("Removing the element john");
  names.remove("John");
  print(names.length);
}
