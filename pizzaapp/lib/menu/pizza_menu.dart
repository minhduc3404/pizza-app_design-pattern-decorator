import 'package:pizzaapp/decorator/basil.dart';
import 'package:pizzaapp/decorator/oliveoil.dart';
import 'package:pizzaapp/decorator/pizza.dart';
import 'package:pizzaapp/decorator/pizza_base.dart';
import 'package:pizzaapp/menu/pizza_topping_data.dart';

class PizzaMenu
{
  Map<int, PizzaToppingData> _pizzaToppingDataMap = {
    1: PizzaToppingData('Basil'),
    2: PizzaToppingData('Olive Oil'),
  };

  getPizzaToppingData()=>_pizzaToppingDataMap;

  Pizza getPizza(int index, Map<int, PizzaToppingData> pizzaToppingData)
  {
    switch(index)
    {
      case 0:
        return _getMargherita();
      case 1:
        return _getPepperoni();
      case 2:
        return _getCustom(index, pizzaToppingData);
    }
  }

  Pizza _getMargherita() {
    Pizza pizza = PizzaBase('Margherita');
    pizza = OliveOil(pizza);
    return pizza;
  }
  Pizza _getPepperoni() {
    Pizza pizza = PizzaBase('Pepperoni');
    pizza = Basil(pizza);
    return pizza;
  }

  Pizza _getCustom(int index, Map<int, PizzaToppingData> pizzaToppingData) {
    Pizza pizza = PizzaBase('Custom');
    if(pizzaToppingData[1].selected) pizza = Basil(pizza);
    if(pizzaToppingData[2].selected) pizza = OliveOil(pizza);
    return pizza;
  }
}