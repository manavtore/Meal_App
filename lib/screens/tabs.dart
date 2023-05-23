import 'package:flutter/material.dart';
import 'package:meals/models/meal.dart';
import 'package:meals/screens/categories.dart';
import 'package:meals/screens/meals.dart';

class TabsScreen extends StatefulWidget {
  const TabsScreen({super.key});

  @override
  State<TabsScreen> createState() {
    return _TabsScreen();
  }
}

class _TabsScreen extends State<TabsScreen> {
  int _selectedPageIndex = 0;

  void _selectpage(int index) {
    setState(() {
      _selectedPageIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    Widget activePage = const CategoriesScreen();
    var activePagetitle = 'Your Favourites';
    final List<Meal> _favouriteMeals = [];

    void _toggleMealFavourite(Meal meal) {
      final isExisting = _favouriteMeals.contains(meal);

      if (isExisting) {
        _favouriteMeals.remove(meal);
      } else {
        _favouriteMeals.add(meal);
      }
    }

    if (_selectedPageIndex == 1) {
      activePage = const MealsScreen(meals: []);
      activePagetitle = 'Your Favourite';
    }

    return Scaffold(
      appBar: AppBar(
        title: Text(activePagetitle),
      ),
      body: activePage,
      bottomNavigationBar: BottomNavigationBar(
        onTap: _selectpage,
        currentIndex: _selectedPageIndex,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.set_meal),
            label: 'Categories',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.star),
            label: 'Favourite',
          )
        ],
      ),
    );
  }
}
