import 'package:pizzaapp/decorator/pizza.dart';

abstract class PizzaDecorator extends Pizza {
  final Pizza pizza;

  PizzaDecorator(this.pizza);

  @override
  String getDescription() {
    // TODO: implement getDescription
    return pizza.getDescription();
  }

  @override
  double getPrice() {
    // TODO: implement getPrice
    return pizza.getPrice();
  }
}
