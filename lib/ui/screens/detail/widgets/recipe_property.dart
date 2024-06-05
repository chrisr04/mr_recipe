part of '../detail_screen.dart';

class RecipeProperty extends StatelessWidget {
  const RecipeProperty({
    super.key,
    required this.label,
    required this.content,
  });

  final String label;
  final String content;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        MrTextMedium(
          label,
          weight: FontWeight.w600,
        ),
        const MrSpacingXS(),
        MrTextMedium(content),
      ],
    );
  }
}
