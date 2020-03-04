

import 'package:pizzaapp/decorator/pizza.dart';
import 'package:pizzaapp/decorator/pizza_decorator.dart';

class OliveOil extends PizzaDecorator
{
  OliveOil(Pizza pizza) : super(pizza){
    description = 'OliveOil';
  }

  @override
  String getDescription() {
    return '${pizza.getDescription()} - $description';
  }

  @override
  double getPrice() {
    return pizza.getPrice() + 0.6;
  }
}