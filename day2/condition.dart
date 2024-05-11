import 'dart:ffi';

void main() {
  int age = 15;
  if (age > 18) {
    print("You are a voter");
  } else if (age > 15 && age < 18) {
    print("Wait for few years to be voter");
  } else {
    print("Your are not a voter");
  }

  switch (age) {
    case 15:
      print("Your age is 15");
      break;
    case 18:
      print("You can be voter");
      break;
  }
}
