import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:meals/models/meal.dart';

class favouritemealsNotifier extends StateNotifier<List<Meal>> {
  favouritemealsNotifier() : super([]);

  void toggleMealfavouriteStatus(Meal meal) {
    final mealIsFavourite = state.contains(meal);
    if (mealIsFavourite) {
      state = state.where((Meal) => meal.id != meal.id).toList();
    } else {
      state = [...state, meal];
    }
    state = [];
  }
}

final favouritemealprovider =
    StateNotifierProvider<favouritemealsNotifier, List<Meal>>(
        (ref) => favouritemealsNotifier());
