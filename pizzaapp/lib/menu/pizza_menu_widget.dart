import 'package:flutter/material.dart';
import 'package:pizzaapp/decorator/pizza.dart';
import 'package:pizzaapp/menu/pizza_information.dart';
import 'package:pizzaapp/menu/pizza_topping_data.dart';

import 'custom_selection.dart';
import 'pizza_menu.dart';

class PizzaMenuPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _PizzaMenuState();
  }
}

class _PizzaMenuState extends State<PizzaMenuPage> {
  final PizzaMenu _pizzaMenu = PizzaMenu();

  var _selectedIndex = 0;
  Pizza _pizza;

  Map<int, PizzaToppingData> _pizzaToppingsDataMap;

  @override
  void initState() {
    super.initState();
    _pizzaToppingsDataMap = _pizzaMenu.getPizzaToppingData();
    _pizza = _pizzaMenu.getPizza(0, _pizzaToppingsDataMap);
  }

  void onSelectChanged(int value){
    setIndexChange(value);
    setPizzaSelect(value);
  }

  void setIndexChange(int value) {
    setState((){
      _selectedIndex = value;
    });
  }

  void setPizzaSelect(int val)
  {
    setState(() {
      _pizza = _pizzaMenu.getPizza(val, _pizzaToppingsDataMap);
    });
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ScrollConfiguration(
        behavior: ScrollBehavior(),
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 32),
          child: _pizzaMenuBody(),
        ),
      ),
    );
  }

  _pizzaMenuBody() => Container(
        child: Column(
          children: <Widget>[
            Row(
              children: <Widget>[
                Text(
                  'Select your pizza:',
                  style: Theme.of(context).textTheme.title,
                ),
              ],
            ),
            //pizza selection
            PizzaSelection(selectedIndex: _selectedIndex, onChanged: onSelectChanged),
            CustomSelection(toppingPizza: _pizzaToppingsDataMap, onSelected: (index, isSelect)=>{
              onCustomChoiceChange(index, isSelect)
            },),
            PizzaInformation(_pizza)
          ],
        ),
      );

  onCustomChoiceChange(index, isSelect) {
    setState(() {
      _pizzaToppingsDataMap[index].selected = isSelect;
      setPizzaSelect(_selectedIndex);
    });
  }
}


class PizzaSelection extends StatelessWidget {
  final pizzaList = ['Margherita', 'Pepperoni', 'Custom'];

  final int selectedIndex;
  final ValueSetter<int> onChanged;

  PizzaSelection({this.selectedIndex, this.onChanged});

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Container(
      child: ListView.builder(
          itemCount: pizzaList.length,
          scrollDirection: Axis.vertical,
          shrinkWrap: true,
          itemBuilder: (ctx, index) => _itemMenu(ctx, index)),
    );
  }

  _itemMenu(BuildContext ctx, int index) => RadioListTile(
        title: Text(pizzaList[index]),
        value: index,
        groupValue: selectedIndex,
        activeColor: Colors.black,
        controlAffinity: ListTileControlAffinity.platform,
        onChanged: this.onChanged,
        selected: index == selectedIndex,
      );
}
