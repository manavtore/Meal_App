// ignore_for_file: non_constant_identifier_names

import 'package:flutter/material.dart';
// import 'package:meals/screens/tabs.dart';
// import 'package:meals/widgets/main_drawer.dart';

enum Filter { Glutenfree, LactoseFree, Vegetarian, Vegan }

class FilterScreen extends StatefulWidget {
  const FilterScreen({super.key});

  @override
  State<FilterScreen> createState() => _FilterScreenState();
}

class _FilterScreenState extends State<FilterScreen> {
  var _glutenFreeFilterSet = false;
  // ignore: non_constant_identifier_names
  var _LactoseFreeFilterSet = false;
  var _VegeterianFilterset = false;
  var _VeganFilterSet = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Your Filters'),
        ),
        // drawer: Maindrawer(onSelectScreen: (identifier) {
        //   Navigator.of(context).pop();
        //   if (identifier == 'meals') {
        //     Navigator.of(context)
        //         .push(MaterialPageRoute(
        //           builder: (ctx) => const TabsScreen()
        //           ));
        //   }
        // }

        // ),
        body: WillPopScope(
          onWillPop: () async {
            Navigator.of(context).pop({
              Filter.Glutenfree: _glutenFreeFilterSet,
              Filter.LactoseFree: _LactoseFreeFilterSet,
              Filter.Vegetarian: _VegeterianFilterset,
              Filter.Vegan: _VeganFilterSet,
            });
            return false;
          },
          child: Column(children: [
            SwitchListTile(
              value: _glutenFreeFilterSet,
              onChanged: (ischecked) {
                setState(() {
                  _glutenFreeFilterSet = ischecked;
                });
              },
              title: Text(
                'Gluten-Free',
                style: Theme.of(context).textTheme.titleLarge!.copyWith(
                      color: Theme.of(context).colorScheme.onBackground,
                    ),
              ),
              subtitle: Text('only include Gluten-free Meal',
                  style: Theme.of(context).textTheme.labelMedium!.copyWith(
                        color: Theme.of(context).colorScheme.onBackground,
                      )),
              activeColor: Theme.of(context).colorScheme.tertiary,
              contentPadding: const EdgeInsets.only(left: 34, right: 22),
            ),
            SwitchListTile(
              value: _LactoseFreeFilterSet,
              onChanged: (ischecked) {
                setState(() {
                  _LactoseFreeFilterSet = ischecked;
                });
              },
              title: Text(
                'Lactose-Free',
                style: Theme.of(context).textTheme.titleLarge!.copyWith(
                      color: Theme.of(context).colorScheme.onBackground,
                    ),
              ),
              subtitle: Text('only include Lactose-free Meal',
                  style: Theme.of(context).textTheme.labelMedium!.copyWith(
                        color: Theme.of(context).colorScheme.onBackground,
                      )),
              activeColor: Theme.of(context).colorScheme.tertiary,
              contentPadding: const EdgeInsets.only(left: 34, right: 22),
            ),
            SwitchListTile(
              value: _VegeterianFilterset,
              onChanged: (ischecked) {
                setState(() {
                  _VegeterianFilterset = ischecked;
                });
              },
              title: Text(
                'Vegetarian',
                style: Theme.of(context).textTheme.titleLarge!.copyWith(
                      color: Theme.of(context).colorScheme.onBackground,
                    ),
              ),
              subtitle: Text('only include vegetarian Meal',
                  style: Theme.of(context).textTheme.labelMedium!.copyWith(
                        color: Theme.of(context).colorScheme.onBackground,
                      )),
              activeColor: Theme.of(context).colorScheme.tertiary,
              contentPadding: const EdgeInsets.only(left: 34, right: 22),
            ),
            SwitchListTile(
              value: _VeganFilterSet,
              onChanged: (ischecked) {
                setState(() {
                  _VeganFilterSet = ischecked;
                });
              },
              title: Text(
                'Vegan',
                style: Theme.of(context).textTheme.titleLarge!.copyWith(
                      color: Theme.of(context).colorScheme.onBackground,
                    ),
              ),
              subtitle: Text('only include Vegan Meal',
                  style: Theme.of(context).textTheme.labelMedium!.copyWith(
                        color: Theme.of(context).colorScheme.onBackground,
                      )),
              activeColor: Theme.of(context).colorScheme.tertiary,
              contentPadding: const EdgeInsets.only(left: 34, right: 22),
            ),
          ]),
        ));
  }
}
