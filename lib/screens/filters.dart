// ignore_for_file: non_constant_identifier_names

import 'package:flutter/material.dart';
// import 'package:meals/screens/tabs.dart';
// import 'package:meals/widgets/main_drawer.dart';
import 'package:meals/provider/filters_provider.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class FilterScreen extends ConsumerStatefulWidget {
  const FilterScreen({super.key, required this.currentFilter});
  final Map<Filter, bool> currentFilter;

  @override
  ConsumerState<FilterScreen> get createState => _FilterScreenState();
}

class _FilterScreenState extends ConsumerState<FilterScreen> {
  var _glutenFreeFilterSet = false;
  var _LactoseFreeFilterSet = false;
  var _VegeterianFilterset = false;
  var _VeganFilterSet = false;

  @override
  void initState() {
    super.initState();
    _glutenFreeFilterSet = widget.currentFilter[Filter.Glutenfree]!;
    _LactoseFreeFilterSet = widget.currentFilter[Filter.LactoseFree]!;
    _VegeterianFilterset = widget.currentFilter[Filter.Vegetarian]!;
    _VeganFilterSet = widget.currentFilter[Filter.Vegan]!;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Your Filters'),
        ),
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
