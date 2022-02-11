import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:receitas_focorotas/components/main_drawer.dart';
import 'package:receitas_focorotas/models/meal.dart';

import 'categories_screens.dart';
import 'favorite_screen.dart';

class TabScreen extends StatefulWidget {
  final List<Meal> favoriteMeals;
  // ignore: prefer_const_constructors_in_immutables
  TabScreen({Key? key, required this.favoriteMeals}) : super(key: key);

  @override
  State<TabScreen> createState() => _TabScreenState();
}

class _TabScreenState extends State<TabScreen> {
  int _selectedScreenIndex = 0;

  final List<String> _titles = [
    'Lista de Categorias',
    'Meus Favoritos',
  ];

  late List<Widget> _screens;

  @override
  void initState() {
    super.initState();
    _screens = [
      const CategoriesScreen(),
      FavoriteScreen(
        favoriteMeals: widget.favoriteMeals,
      ),
    ];
  }

  _selectScreen(int index) {
    setState(() {
      _selectedScreenIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text(
            _titles[_selectedScreenIndex],
            style: GoogleFonts.raleway(),
          ),
        ),
        drawer: const MainDrawer(),
        body: _screens[_selectedScreenIndex],
        bottomNavigationBar: BottomNavigationBar(
          onTap: _selectScreen,
          backgroundColor: Theme.of(context).primaryColor,
          unselectedItemColor: Colors
              .white, // quando o item não estiver selecionado ele ficara da cor branca.
          selectedItemColor: Theme.of(context).colorScheme.secondary,
          currentIndex: _selectedScreenIndex,
          items: const [
            BottomNavigationBarItem(
              icon: Icon(
                Icons.category,
              ),
              label: 'Categorias',
            ),
            BottomNavigationBarItem(
              icon: Icon(
                Icons.star,
              ),
              label: 'Favoritos',
            ),
          ],
        ),
      ),
    );
  }
}
