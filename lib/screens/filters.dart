// ignore_for_file: non_constant_identifier_names

import 'package:flutter/material.dart';
// import 'package:meals/screens/tabs.dart';
// import 'package:meals/widgets/main_drawer.dart';
import 'package:meals/provider/filters_provider.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class FilterScreen extends ConsumerStatefulWidget {
  const FilterScreen({super.key});

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
    final activeFilters = ref.read(filterProvider);
    _glutenFreeFilterSet = activeFilters[Filter.Glutenfree]!;
    _LactoseFreeFilterSet = activeFilters[Filter.LactoseFree]!;
    _VegeterianFilterset = activeFilters[Filter.Vegetarian]!;
    _VeganFilterSet = activeFilters[Filter.Vegan]!;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Your Filters'),
        ),
        body: WillPopScope(
          onWillPop: () async {
            ref.read(filterProvider.notifier).setFilters({
              Filter.Glutenfree: _glutenFreeFilterSet,
              Filter.LactoseFree: _LactoseFreeFilterSet,
              Filter.Vegetarian: _VegeterianFilterset,
              Filter.Vegan: _VeganFilterSet,
            });
            // Navigator.of(context).pop();
            return true;
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
