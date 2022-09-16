import 'package:flutter/material.dart';

import '../widgets/main_drawer.dart';

class FiltersScreen extends StatefulWidget {
  static const routeName = '/filters';


  final Map<String, bool> currentFilters;
  final Function saveFilters;

   FiltersScreen(this.currentFilters, this.saveFilters);

  @override
  _FiltersScreenState createState() => _FiltersScreenState();
}

class _FiltersScreenState extends State<FiltersScreen> {
  bool _glutenFree = false;
  bool _vegetarian = false;
  bool _vegan = false;
  bool _lactoseFree = false;

  @override
  initState() {
    _glutenFree = widget.currentFilters['gluten']!;
    _lactoseFree = widget.currentFilters['lactose']!;
    _vegetarian = widget.currentFilters['vegetarian']!;
    _vegan = widget.currentFilters['vegan']!;
    super.initState();
  }

  Widget _buildSwitchListTile(
    String title,
    String description,
    bool currentValue,
    // Function updateValue,
  ) {

    return SwitchListTile(
      title: Text(title),
      value: currentValue,
      subtitle: Text(description),
      onChanged:  (newValue) {
        if (title == 'Gluten-free'){
                        _glutenFree = newValue;
                  } else  if (title == 'Lactose-free'){
                        _lactoseFree = newValue;
                  }else  if (title == 'Vegan'){
                        _vegan = newValue;
                  } else  if (title == 'Vegetarian'){
                        _vegetarian = newValue;
                  } 
                  setState(() {});}                  
                    ,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Your Filters'),
        actions: <Widget>[
          IconButton(
            icon:const Icon(Icons.save),
            onPressed: () {
              final selectedFilters = {
                'gluten': _glutenFree,
                'lactose': _lactoseFree,
                'vegan': _vegan,
                'vegetarian': _vegetarian,
              };
              widget.saveFilters(selectedFilters);
            },
          )
        ],
      ),
      drawer: MainDrawer(),
      body: 
      Column( 
        children: <Widget>[
          Container(
            padding:const EdgeInsets.all(20),
            child: Text(
              'Adjust your meal selection.',
              style: Theme.of(context).textTheme.titleLarge,
            ),
          ),
          Expanded(
            child: 
             ListView(
              
              children: <Widget>[
                _buildSwitchListTile(
                  'Gluten-free',
                  'Only include gluten-free meals.',
                  _glutenFree,
          
                ),
                _buildSwitchListTile(
                  'Lactose-free',
                  'Only include lactose-free meals.',
                  _lactoseFree,
                  // (newValue) {
                  //   setState(
                  //     () {
                  //       _lactoseFree = newValue;
                  //     },
                  //   );
                  // },
                ),
                _buildSwitchListTile(
                  'Vegetarian',
                  'Only include vegetarian meals.',
                  _vegetarian,
                  // (newValue) {
                  //   setState(
                  //     () {
                  //       _vegetarian = newValue;
                  //     },
                  //   );
                  // },
                ),
                _buildSwitchListTile(
                  'Vegan',
                  'Only include vegan meals.',
                  _vegan,
                  // (newValue) {
                  //   setState(
                  //     () {
                  //       _vegan = newValue;
                  //     },
                  //   );
                  // },
                ),
              ],
            ),
          ),
        ],
      ),
      // Center(child: Text('bucerta'),),
    );
  }
}
