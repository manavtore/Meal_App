import 'package:flutter/material.dart';
import 'package:meals/provider/filters_provider.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class FilterScreen extends ConsumerWidget {
  const FilterScreen({super.key});
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final activefilters = ref.watch(filterProvider);
    return Scaffold(
        appBar: AppBar(
          title: const Text('Your Filters'),
        ),
        body: Column(
          children: [
            SwitchListTile(
              value: activefilters[Filter.Glutenfree]!,
              onChanged: (ischecked) {
                ref
                    .read(filterProvider.notifier)
                    .setFilter(Filter.Glutenfree, ischecked);
              },
              title: Text(
                'Gluten-Free',
                style: Theme.of(context).textTheme.titleLarge!.copyWith(
                      color: Theme.of(context).colorScheme.onBackground,
                    ),
              ),
              subtitle: Text(
                'Only include Gluten-free Meal',
                style: Theme.of(context).textTheme.labelMedium!.copyWith(
                      color: Theme.of(context).colorScheme.onBackground,
                    ),
              ),
              activeColor: Theme.of(context).colorScheme.secondary,
              contentPadding: const EdgeInsets.only(left: 34, right: 22),
            ),
            SwitchListTile(
              value: activefilters[Filter.LactoseFree]!,
              onChanged: (ischecked) {
                ref
                    .read(filterProvider.notifier)
                    .setFilter(Filter.LactoseFree, ischecked);
              },
              title: Text(
                'Lactose-Free',
                style: Theme.of(context).textTheme.titleLarge!.copyWith(
                      color: Theme.of(context).colorScheme.onBackground,
                    ),
              ),
              subtitle: Text(
                'Only include Lactose-free Meal',
                style: Theme.of(context).textTheme.labelMedium!.copyWith(
                      color: Theme.of(context).colorScheme.onBackground,
                    ),
              ),
              activeColor: Theme.of(context).colorScheme.secondary,
              contentPadding: const EdgeInsets.only(left: 34, right: 22),
            ),
            SwitchListTile(
              value: activefilters[Filter.Vegetarian]!,
              onChanged: (ischecked) {
                ref
                    .read(filterProvider.notifier)
                    .setFilter(Filter.Vegetarian, ischecked);
              },
              title: Text(
                'Vegetarian',
                style: Theme.of(context).textTheme.titleLarge!.copyWith(
                      color: Theme.of(context).colorScheme.onBackground,
                    ),
              ),
              subtitle: Text(
                'Only include Vegetarian Meal',
                style: Theme.of(context).textTheme.labelMedium!.copyWith(
                      color: Theme.of(context).colorScheme.onBackground,
                    ),
              ),
              activeColor: Theme.of(context).colorScheme.secondary,
              contentPadding: const EdgeInsets.only(left: 34, right: 22),
            ),
            SwitchListTile(
              value: activefilters[Filter.Vegan]!,
              onChanged: (ischecked) {
                ref
                    .read(filterProvider.notifier)
                    .setFilter(Filter.Vegan, ischecked);
              },
              title: Text(
                'Vegan',
                style: Theme.of(context).textTheme.titleLarge!.copyWith(
                      color: Theme.of(context).colorScheme.onBackground,
                    ),
              ),
              subtitle: Text(
                'Only include Vegan Meal',
                style: Theme.of(context).textTheme.labelMedium!.copyWith(
                      color: Theme.of(context).colorScheme.onBackground,
                    ),
              ),
              activeColor: Theme.of(context).colorScheme.secondary,
              contentPadding: const EdgeInsets.only(left: 34, right: 22),
            ),
          ],
        ));
  }
}
