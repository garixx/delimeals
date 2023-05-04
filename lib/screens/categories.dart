import 'package:delimeals/models/category.dart';
import 'package:flutter/material.dart';

import '../models/meal.dart';
import '../widgets/category_grid_item.dart';
import '../screens/meals.dart';
import '../../data/dummy_data.dart';

class CategoriesScreen extends StatelessWidget {
  final List<Meal> availableMeals;
  final void Function(Meal meal) onToogleFavorite;

  const CategoriesScreen({Key? key, required this.availableMeals, required this.onToogleFavorite})
      : super(key: key);

  void _selectCategory(BuildContext context, Category category) {
    final filteredMeals = availableMeals
        .where((meal) => meal.categories.contains(category.id))
        .toList();

    Navigator.push(
        context,
        MaterialPageRoute(
            builder: (ctx) => MealsScreen(
                  title: category.title,
                  meals: filteredMeals,
                  onToogleFavorite: onToogleFavorite,
                )));
  }

  @override
  Widget build(BuildContext context) {
    return GridView(
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        childAspectRatio: 3 / 2,
        crossAxisSpacing: 20,
        mainAxisSpacing: 20,
      ),
      children: availableCategories
          .map((cat) => CategoryGridItem(
                category: cat,
                onSelectCategory: () => _selectCategory(context, cat),
              ))
          .toList(),
    );
  }
}
