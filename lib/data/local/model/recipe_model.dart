import 'package:mr_recipe/domain/domain.dart';

class RecipeModel extends Recipe {
  RecipeModel({
    required super.id,
    required super.name,
    required super.description,
    required super.preparationTime,
    required super.cookingTime,
    required super.ingredients,
  });

  factory RecipeModel.fromJson(Map<String, dynamic> json) => RecipeModel(
        id: json['id'] ?? '',
        name: json['name'] ?? '',
        description: json['description'] ?? '',
        preparationTime: json['preparation_time'] ?? 0,
        cookingTime: json['cooking_time'] ?? 0,
        ingredients: List<String>.from(json['ingredients'] ?? <String>[]),
      );

  factory RecipeModel.fromDomain(Recipe recipe) => RecipeModel(
        id: recipe.id,
        name: recipe.name,
        description: recipe.description,
        preparationTime: recipe.preparationTime,
        cookingTime: recipe.cookingTime,
        ingredients: recipe.ingredients,
      );

  Map<String, dynamic> toMap() => {
        'id': id,
        'name': name,
        'description': description,
        'preparation_time': preparationTime,
        'cooking_time': cookingTime,
        'ingredients': ingredients,
      };
}
