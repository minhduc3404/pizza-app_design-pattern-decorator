
import 'package:pizzaapp/decorator/pizza.dart';
import 'package:pizzaapp/decorator/pizza_decorator.dart';

class Basil extends PizzaDecorator
{
  Basil(Pizza pizza) : super(pizza){
    description = 'Basil';
  }

  @override
  String getDescription() {
    // TODO: implement getDescription
    return '${pizza.getDescription()} - $description';
  }

  @override
  double getPrice() {
    // TODO: implement getPrice
    return pizza.getPrice() + 0.2;
  }
}