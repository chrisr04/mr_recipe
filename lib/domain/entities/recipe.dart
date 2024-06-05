class Recipe {
  const Recipe({
    required this.id,
    required this.name,
    required this.description,
    required this.preparationTime,
    required this.cookingTime,
    required this.ingredients,
  });

  final String id;
  final String name;
  final String description;
  final int preparationTime;
  final int cookingTime;
  final List<String> ingredients;
}
