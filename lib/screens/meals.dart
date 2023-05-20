import 'package:flutter/material.dart';
import 'package:meals/models/meal.dart';
import 'package:meals/screens/meal_details.dart';
import 'package:meals/widgets/meal_item.dart';

class MealsScreen extends StatelessWidget {
  const MealsScreen({super.key, required this.title, required this.meals});

  final String? title;
  final List<Meal> meals;

  void selectMeal(BuildContext context, Meal meal) {
    Navigator.of(context).push(
        MaterialPageRoute(builder: (ctx) => MealDetailsScreen(meal: meal)));
  }

  @override
  Widget build(context) {
    Widget content = ListView.builder(
        itemCount: meals.length,
        itemBuilder: (ctx, index) => MealItem(
              meal: meals[index],
              onSelectMeal: (Meal) {
                selectMeal(context, Meal);
              },
            ));

    if (meals.isEmpty) {
      content = const Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              'ky re aee bhikmangya ky dekh rha hai',
              style: TextStyle(
                color: Colors.green,
              ),
              // style: Theme.of(context).textTheme.headlineLarge!.copyWith(
              //       color: Theme.of(context).colorScheme.onBackground,
              //     ),
            ),
            SizedBox(
              height: 24,
            ),
            Text(
              'Try selecting any other item!',
              style: TextStyle(
                color: Colors.green,
              ),
              // style: Theme.of(context).textTheme.bodyLarge!.copyWith(
              //       color: Theme.of(context).colorScheme.onBackground,
              //     ),
            ),
          ],
        ),
      );
    }

    if (title == null) {
      return content;
    }

    return Scaffold(
      appBar: AppBar(
        title: Text(title!),
      ),
      body: content,
    );
  }
}
