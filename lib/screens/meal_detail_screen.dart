import 'package:flutter/material.dart';
import 'package:receitas_focorotas/models/meal.dart';

class MealDetailScreen extends StatelessWidget {
  final bool Function(Meal) isFavorite;
  final Function(Meal) onToggleFavorite;
  // ignore: prefer_const_constructors_in_immutables
  MealDetailScreen(
      {Key? key, required this.onToggleFavorite, required this.isFavorite})
      : super(key: key);

  _createSectionTitle(BuildContext context, String title) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 10),
      child: Text(
        title,
        style: Theme.of(context).textTheme.headline6,
      ),
    );
  }

  Widget _createSectionContainer(Widget child) {
    return Container(
        width: 330,
        height: 250,
        padding: const EdgeInsets.all(10),
        margin: const EdgeInsets.all(10),
        decoration: BoxDecoration(
          color: Colors.white,
          border: Border.all(color: Colors.grey),
          borderRadius: BorderRadius.circular(10),
        ),
        child: child);
  }

  @override
  Widget build(BuildContext context) {
    final meal = ModalRoute.of(context)!.settings.arguments as Meal;
    return Scaffold(
        appBar: AppBar(
          title: Text(meal.title),
        ),
        body: SafeArea(
          child: SingleChildScrollView(
            child: Column(
              children: [
                SizedBox(
                  height: 250,
                  width: double.infinity,
                  child: Image.network(
                    meal.imageUrl,
                    fit: BoxFit.cover,
                  ),
                ),
                _createSectionTitle(context, 'ingredientes'),
                _createSectionContainer(
                  ListView.builder(
                    itemCount: meal.ingredientes.length,
                    itemBuilder: (cxt, i) {
                      return Card(
                        child: Padding(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 10,
                            vertical: 5,
                          ),
                          child: Text(
                            meal.ingredientes[i],
                          ),
                        ),
                        color: Theme.of(context).colorScheme.secondary,
                      );
                    },
                  ),
                ),
                _createSectionTitle(context, 'Passos'),
                _createSectionContainer(ListView.builder(
                    itemCount: meal.steps.length,
                    itemBuilder: (cxt, i) {
                      return Column(
                        children: [
                          ListTile(
                            leading: CircleAvatar(
                              child: Text('${i + 1}'),
                            ),
                            title: Text(meal.steps[i]),
                          ),
                          const Divider(),
                        ],
                      );
                    })),
              ],
            ),
          ),
        ),
        floatingActionButton: FloatingActionButton(
          child: Icon(isFavorite(meal) ? Icons.star : Icons.star_border),
          onPressed: () {
            onToggleFavorite(meal);
          },
        ));
  }
}
