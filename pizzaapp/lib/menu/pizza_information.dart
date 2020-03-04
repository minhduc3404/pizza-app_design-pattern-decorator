import 'package:flutter/cupertino.dart';
import 'package:pizzaapp/decorator/pizza.dart';

class PizzaInformation extends StatelessWidget {
  final Pizza pizza;

  PizzaInformation(this.pizza);

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: <Widget>[
        Text('Name: ${pizza.getDescription()}'),
        Text('Price: ${pizza.getPrice()}')
      ],
    );
  }
}
