import 'package:amary_cafe/data/api/model/name.dart';

class Menu {
  final List<Name> foods;
  final List<Name> drinks;

  Menu({required this.foods, required this.drinks});

  factory Menu.empty() {
    return Menu(foods: [], drinks: []);
  }
}
