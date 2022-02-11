import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:receitas_focorotas/data/dummy_data.dart';
import 'package:receitas_focorotas/screens/categories_meals_screen.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:receitas_focorotas/screens/categories_screens.dart';
import 'package:receitas_focorotas/screens/meal_detail_screen.dart';
import 'package:receitas_focorotas/screens/settings_sreen.dart';
import 'package:receitas_focorotas/screens/tabs_screen.dart';
import 'package:receitas_focorotas/utils/app_routes.dart';

import 'models/meal.dart';
import 'models/settings.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  Settings settings = Settings();
  List<Meal> _avalaibleMeals = dummyMeals;
  final List<Meal> _favoriteMeals = [];

  void _filterMeals(Settings settings) {
    setState(() {
      this.settings = settings;

      _avalaibleMeals = dummyMeals.where((meal) {
        final filterGluten = settings.isGlutenFree && !meal.isGlutenFree;
        final filterLactose = settings.isLactoseFree && !meal.isLactoseFree;
        final filterVegan = settings.isVegan && !meal.isVegan;
        final filterVegetarian = settings.isVegetarian && !meal.isVegetarian;
        return !filterGluten &&
            !filterLactose &&
            !filterVegan &&
            !filterVegetarian;
      }).toList();
    });
  }

  bool _isFavorite(Meal meal) {
    return _favoriteMeals.contains(meal);
  }

  void _toggleFavorite(Meal meal) {
    setState(() {
      _favoriteMeals.contains(meal)
          ? _favoriteMeals.remove(meal)
          : _favoriteMeals.add(meal);
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primarySwatch: Colors.pink,
        colorScheme: ColorScheme.fromSwatch().copyWith(
          primary: Colors.pink,
          secondary: Colors.amber,
        ),
        canvasColor: const Color.fromRGBO(255, 254, 229, 1),
        textTheme: GoogleFonts.robotoCondensedTextTheme(
          Theme.of(context).textTheme,
        ).copyWith(
          headline6: GoogleFonts.robotoCondensed(
            fontSize: 20,
            fontWeight: FontWeight.bold,
            color: Colors.black87,
            textStyle: Theme.of(context).textTheme.headline6,
          ),
          // bodyText1: GoogleFonts.raleway(
          //   fontSize: 20,
          //   fontWeight: FontWeight.w700,
          // ),
        ),
      ),
      routes: {
        AppRoutes.home: (cxt) => TabScreen(
              favoriteMeals: _favoriteMeals,
            ),
        AppRoutes.categoriesMeals: (cxt) =>
            CategoriesMeals(meals: _avalaibleMeals),
        AppRoutes.mealDetail: (cxt) => MealDetailScreen(
              isFavorite: _isFavorite,
              onToggleFavorite: _toggleFavorite,
            ),
        AppRoutes.settings: (cxt) => SettingScreen(
              onSettingsChanged: _filterMeals,
              settings: settings,
            ),
      },
      onUnknownRoute: (settings) {
        return MaterialPageRoute(builder: (_) {
          return TabScreen(
            favoriteMeals: _favoriteMeals,
          );
        });
      },
    );
  }
}
