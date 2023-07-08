import 'package:meals/models/meal.dart';
import 'package:meals/screens/meals.dart';
import 'package:flutter/material.dart';
import 'package:meals/data/dummy_data.dart';
import 'package:meals/widgets/category_grid_item.dart';
import 'package:meals/models/category.dart';

class CategoriesScreen extends StatefulWidget {
  const CategoriesScreen({
    super.key,
    required this.availableMeals,
  });

  final List<Meal> availableMeals;

  @override
  State<CategoriesScreen> get createState {
    return _CategoriesScreenState();
  }
}

class _CategoriesScreenState extends State<CategoriesScreen>
    with SingleTickerProviderStateMixin {
  late AnimationController _animationcontroler;

  @override
  void initState() {
    super.initState();
    _animationcontroler = AnimationController(
      vsync: this,
      duration: const Duration(
        milliseconds: 300,
      ),
      upperBound: 1,
      lowerBound: 0,
    );
    _animationcontroler.forward();
  }

  @override
  void dispose() {
    _animationcontroler.dispose();
    super.dispose();
  }

  void _selectCategory(BuildContext context, Category category) {
    final filteredMeal = widget.availableMeals
        .where((meal) => meal.categories.contains(category.id))
        .toList();

    Navigator.of(context).push(MaterialPageRoute(
      builder: (ctx) => MealsScreen(
        title: category.title,
        meals: filteredMeal,
      ),
    ));
  }

  @override
  Widget build(BuildContext context) {
    return
        // Scaffold(
        //   appBar: AppBar(
        //     title: const Text('Pick your Category'),
        //   ),
        // body:
        AnimatedBuilder(
            animation: _animationcontroler,
            child: GridView(
                padding: const EdgeInsets.all(24),
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  childAspectRatio: 3 / 2,
                  crossAxisSpacing: 20,
                  mainAxisSpacing: 20,
                ),
                children: [
                  for (final category in availableCategories)
                    CategoryGridItem(
                      category: category,
                      onselectedCategory: () {
                        _selectCategory(context, category);
                      },
                    )
                ]),
            builder: (context, child) => Padding(
                  padding: EdgeInsets.only(
                      top: 100 - _animationcontroler.value * 100),
                  child: child,
                )

            //   },
            );

    // );
  }
}
