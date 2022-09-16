import 'package:flutter/material.dart';

import '../screens/filters_screen.dart';

class MainDrawer extends StatelessWidget {

  // Widget buildListTile(String title, IconData icon, Function tapHandler) {

  //   return ListTile(
  //     leading: Icon(
  //       icon,
  //       size: 26,
  //     ),
  //     title: Text(
  //       title,
  //       style:const TextStyle(
  //         fontFamily: 'RobotoCondensed',
  //         fontSize: 24,
  //         fontWeight: FontWeight.bold,
  //       ),
  //     ),
  //     onTap: tapHandler(),
  //   );
  // }

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: <Widget>[
          Container(
            height: 120,
            width: double.infinity,
            padding: EdgeInsets.all(20),
            alignment: Alignment.centerLeft,
            color: Theme.of(context).accentColor,
            child: Text(
              'Cooking Up!',
              style: TextStyle(
                  fontWeight: FontWeight.w900,
                  fontSize: 30,
                  color: Theme.of(context).primaryColor),
            ),
          ),
          const SizedBox(
            height: 20
          ),
          ListTile(
      leading:const  Icon(
        Icons.restaurant,
        size: 26,
      ),
      title:const Text(
        'Meals',
        style: TextStyle(
          fontFamily: 'RobotoCondensed',
          fontSize: 24,
          fontWeight: FontWeight.bold,
        ),
      ),
      onTap: () {
        Navigator.of(context).pop;
            Navigator.of(context).pushNamed('/');
          },
    ),
      ListTile(
      leading:const  Icon(
        Icons.settings,
        size: 26,
      ),
      title:const Text(
        'Filters',
        style: TextStyle(
          fontFamily: 'RobotoCondensed',
          fontSize: 24,
          fontWeight: FontWeight.bold,
        ),
      ),
      onTap:  () {
            Navigator.of(context).pop;
            Navigator.of(context).pushNamed(FiltersScreen.routeName);
          },
    ),


        ],
      ),
    );
  }
}
