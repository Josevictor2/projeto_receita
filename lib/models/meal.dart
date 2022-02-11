enum Complexity {
  simple,
  medium,
  difficult,
}

enum Cost {
  cheap,
  fair,
  expensive,
}

class Meal {
  final String id;
  final List categories;
  final String title;
  final String imageUrl;
  final List ingredientes;
  final List steps;
  final int duration;
  final bool isGlutenFree;
  final bool isLactoseFree;
  final bool isVegan;
  final bool isVegetarian;
  final Complexity complexity;
  final Cost cost;

  Meal({
    required this.complexity,
    required this.cost,
    required this.ingredientes,
    required this.steps,
    required this.duration,
    required this.id,
    required this.categories,
    required this.title,
    required this.imageUrl,
    required this.isGlutenFree,
    required this.isLactoseFree,
    required this.isVegan,
    required this.isVegetarian,
  });

  String get complexityText {
    switch (complexity) {
      case (Complexity.simple):
        return 'Simples';
      case (Complexity.medium):
        return 'Médio';
      case (Complexity.difficult):
        return 'Dificil';
      default:
        return 'Desconhecida';
    }
  }

  String get costText {
    switch (cost) {
      case (Cost.cheap):
        return 'Barato';
      case (Cost.fair):
        return 'Justo';
      case (Cost.expensive):
        return 'Caro';
      default:
        return 'Desconhecido';
    }
  }
}
