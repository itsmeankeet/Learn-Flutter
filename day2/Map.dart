void main() {
  Map player = {
    "football": "Ronaldo",
    "volleyball": "Nishida",
    "cricket": "Dhoni"
    //aagadi ko chai string hunu paryo paxadi ko data chai dynamic hunu payo list huna ne payo hai tw
  };
  print(player["football"]);
  print(player["Cricket"]);
  //to see all the keys in the map
  print(player.keys);
  //to print all the elements in the map
  print(player.values);
  //change the map
  player["football"] = "Cristinao Ronaldo";
  print(player["football"]);
  //to add new elements
  player["Hockey"] = "Messi";
  print(player.values);
  //remove garna key dene hai tw
  player.remove("Hockey");
  print(player.values);
}
