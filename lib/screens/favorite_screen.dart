import 'package:flutter/material.dart';
import 'package:receitas_focorotas/components/meals_item.dart';
import 'package:receitas_focorotas/models/meal.dart';

class FavoriteScreen extends StatelessWidget {
  final List<Meal> favoriteMeals;
  // ignore: prefer_const_constructors_in_immutables
  FavoriteScreen({Key? key, required this.favoriteMeals}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    if (favoriteMeals.isEmpty) {
      return const Center(
        child: Text('Nenhuma refeição foi marcada como favorita'),
      );
    } else {
      return ListView.builder(
          itemCount: favoriteMeals.length,
          itemBuilder: (cxt, i) {
            return MealItem(meal: favoriteMeals[i]);
          });
    }
  }
}
