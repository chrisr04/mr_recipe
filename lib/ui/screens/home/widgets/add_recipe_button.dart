part of '../home_screen.dart';

class AddRecipeButton extends StatelessWidget {
  const AddRecipeButton({super.key});

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      onPressed: () => _navigateToForm(context),
      child: const Icon(
        Icons.soup_kitchen_outlined,
      ),
    );
  }

  void _navigateToForm(BuildContext context) {
    Navigator.pushNamed(context, AppRoutes.form);
  }
}
