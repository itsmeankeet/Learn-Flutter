import 'package:intl/intl.dart';

// Function to convert a string into a double value
double convertStringIntoDouble(String string) {
  double? value = double.tryParse(string);
  return value ?? 0;
}

// Function to format the amount as a currency string
String formatAmount(double amount) {
  final format =
      NumberFormat.currency(locale: "en_US", symbol: "\$", decimalDigits: 2);
  return format.format(amount);
}
