part of '../detail_screen.dart';

class RecipeDetailHelpers {
  static void navigateToHome(BuildContext context) {
    Navigator.popUntil(
      context,
      ModalRoute.withName(AppRoutes.home),
    );
  }

  static void navigateToEdit(BuildContext context, String recipeId) {
    Navigator.pushNamed(
      context,
      AppRoutes.form,
      arguments: recipeId,
    );
  }
}
