import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:pizzaapp/menu/pizza_topping_data.dart';

class CustomSelection extends StatelessWidget {
  final Map<int, PizzaToppingData> toppingPizza;
  final Function onSelected;

  CustomSelection({this.toppingPizza, this.onSelected});

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Wrap(
      crossAxisAlignment: WrapCrossAlignment.start,
      alignment: WrapAlignment.start,
      children: List<Widget>.generate(toppingPizza.length, (int index) {
        return chipForRow(toppingPizza[index + 1].label, index + 1);
      }),
    );
  }

  Widget chipForRow(String label, int index) => ChoiceChip(
    padding: EdgeInsets.all(4),
        label: Text(
          label,
          style: TextStyle(
            color: toppingPizza[index].selected ? Colors.white : Colors.black,
          ),
        ),
        selected: toppingPizza[index].selected,
        onSelected: (bool isSelect) => {onSelected(index, isSelect)}
  );
}
