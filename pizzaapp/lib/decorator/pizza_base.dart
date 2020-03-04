import 'package:pizzaapp/decorator/pizza.dart';

class PizzaBase extends Pizza {
  PizzaBase(String description) {
    this.description = description;
  }

  @override
  String getDescription() {
    return this.description;
  }

  @override
  double getPrice() {
    return 3.0;
  }
}
