import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:meals/data/dummy_data.dart';

final Mealsprovides = Provider((ref) {
  return dummyMeals;
});
