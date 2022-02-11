import 'package:flutter/material.dart';
import 'package:receitas_focorotas/components/meals_item.dart';
import 'package:receitas_focorotas/models/category.dart';
import 'package:receitas_focorotas/models/meal.dart';

class CategoriesMeals extends StatelessWidget {
  final List<Meal> meals;
  const CategoriesMeals({Key? key, required this.meals}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final category = ModalRoute.of(context)!.settings.arguments as Category;
    final categoryMeal = meals.where((meal) {
      return meal.categories.contains(category.id);
    }).toList();
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          category.title,
        ),
      ),
      body: Center(
        child: ListView.builder(
          itemCount: categoryMeal.length,
          itemBuilder: (cxt, i) {
            return MealItem(
              meal: categoryMeal[i],
            );
          },
        ),
      ),
    );
  }
}
