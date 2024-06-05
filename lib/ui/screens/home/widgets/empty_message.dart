part of '../home_screen.dart';

class EmptyMessage extends StatelessWidget {
  const EmptyMessage({super.key});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Padding(
        padding: const EdgeInsets.all(MrSpacing.md),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              Icons.soup_kitchen_outlined,
              size: 50.0,
              color: Theme.of(context).colorScheme.outline,
            ),
            MrTextHeading6(
              MrStrings.youHaveNotAddedAnyRecipesYet,
              color: Theme.of(context).colorScheme.outline,
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }
}
