void main() {
  var dartIsGreat = null;

  dartIsGreat ??=
      "Yeah"; //assugn yeah to the dartIsGreat because it has null vlaue
  print(dartIsGreat);
  dartIsGreat ??=
      "Nope"; //doesnot change because the value is not null in dartIsGreat
  print(dartIsGreat);
}
