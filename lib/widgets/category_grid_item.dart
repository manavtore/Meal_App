import 'package:flutter/material.dart';
import 'package:meals/models/category.dart';

class CategoryGridItem extends StatelessWidget {
  const CategoryGridItem({
    super.key,
    required this.category,
    required this.onselectedCategory,
  });

  final Category category;
  final void Function() onselectedCategory;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onselectedCategory,
      splashColor: Colors.white,
      borderRadius: BorderRadius.circular(16),
      child: Container(
          padding: const EdgeInsets.all(18),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(16),
              gradient: LinearGradient(
                colors: [
                  category.color.withOpacity(0.55),
                  category.color.withOpacity(0.9),
                ],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
              )),
          child: Text(
            category.title,
            style: Theme.of(context).textTheme.titleLarge!.copyWith(
                  color: Theme.of(context).colorScheme.onBackground,
                ),
          )),
    );
  }
}
