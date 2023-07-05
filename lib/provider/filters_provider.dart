import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:meals/provider/meals_provider.dart';

enum Filter { Glutenfree, LactoseFree, Vegetarian, Vegan }

class FiltersNotifier extends StateNotifier<Map<Filter, bool>> {
  FiltersNotifier()
      : super({
          Filter.Glutenfree: false,
          Filter.LactoseFree: false,
          Filter.Vegetarian: false,
          Filter.Vegan: false,
        });
  void setFilters(Map<Filter, bool> choosenFilters) {
    state = choosenFilters;
  }

  void setFilter(Filter filter, bool isActive) {
    state = {
      ...state,
      filter: isActive,
    };
  }
}

final filterProvider =
    StateNotifierProvider<FiltersNotifier, Map<Filter, bool>>(
  (ref) => FiltersNotifier(),
);

final filteredMealProvider = Provider((ref) {
  final meals = ref.watch(Mealsprovides);

  final activefilters = ref.watch(filterProvider);

  meals.where((meal) {
    if (activefilters[Filter.Glutenfree]! && !meal.isGlutenFree) {
      return false;
    }
    if (activefilters[Filter.LactoseFree]! && !meal.isLactoseFree) {
      return false;
    }
    if (activefilters[Filter.Vegetarian]! && !meal.isVegetarian) {
      return false;
    }
    if (activefilters[Filter.Vegan]! && !meal.isVegan) {
      return false;
    }
    return true;
  }).toList();
});
