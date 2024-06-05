part of '../form_screen.dart';

class FormLoadingIndicator extends StatelessWidget {
  const FormLoadingIndicator({super.key});

  @override
  Widget build(BuildContext context) {
    return const SliverFillRemaining(
      hasScrollBody: false,
      child: Column(
        children: [
          Expanded(
            child: Center(
              child: CircularProgressIndicator(),
            ),
          ),
        ],
      ),
    );
  }
}
