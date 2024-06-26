part of '../form_screen.dart';

class FormHelpers {
  static void showCreateModalSuccess(BuildContext context) {
    FormSuccessModal.show(
      context,
      title: MrStrings.yourRecipeWasCreatedSuccessfully,
      onBack: () => Navigator.of(context).popUntil(
        ModalRoute.withName(AppRoutes.home),
      ),
    );
  }

  static void showUpdateModalSuccess(BuildContext context, String recipeId) {
    FormSuccessModal.show(
      context,
      title: MrStrings.yourRecipeWasUpdatedSuccessfully,
      onBack: () => Navigator.of(context).pushNamedAndRemoveUntil(
        AppRoutes.detail,
        ModalRoute.withName(AppRoutes.home),
        arguments: recipeId,
      ),
    );
  }
}
