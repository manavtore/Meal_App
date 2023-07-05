import 'package:flutter/material.dart';
import 'package:meals/screens/categories.dart';
import 'package:meals/screens/filters.dart';
import 'package:meals/screens/meals.dart';
import 'package:meals/widgets/main_drawer.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:meals/provider/favourites_provideer.dart';
import 'package:meals/provider/filters_provider.dart';

const KInitialFilters = {
  Filter.Glutenfree: false,
  Filter.LactoseFree: false,
  Filter.Vegetarian: false,
  Filter.Vegan: false,
};

class TabsScreen extends ConsumerStatefulWidget {
  const TabsScreen({
    super.key,
  });

  @override
  ConsumerState<TabsScreen> get createState {
    return _TabsScreen();
  }
}

class _TabsScreen extends ConsumerState<TabsScreen> {
  int _selectedPageIndex = 0;

  void showinfoMessage(String message) {}

  void _selectpage(int index) {
    setState(() {
      _selectedPageIndex = index;
    });
  }

  void _setScreen(String identifier) async {
    Navigator.of(context).pop();
    if (identifier == 'filters') {
      await Navigator.of(context).push<Map<Filter, bool>>(
        MaterialPageRoute(builder: (ctx) => const FilterScreen()),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    final availableMeals = ref.watch(favouritemealprovider);

    Widget activePage = CategoriesScreen(
      availableMeals: availableMeals,
    );

    var activePagetitle = 'Your Favourites';

    if (_selectedPageIndex == 1) {
      final favoriteMeal = ref.watch(favouritemealprovider);
      activePage = MealsScreen(
        meals: favoriteMeal,
      );
      activePagetitle = 'Your Favourite';
    }

    return Scaffold(
      appBar: AppBar(
        title: Text(activePagetitle),
      ),
      drawer: Maindrawer(onSelectScreen: _setScreen),
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
          ),
        ],
      ),
    );
  }
}
