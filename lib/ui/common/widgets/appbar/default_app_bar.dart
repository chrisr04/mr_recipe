import 'package:flutter/material.dart';
import 'package:mr_recipe/ui/common/widgets/text/text.dart';

class MrAppBar extends StatelessWidget implements PreferredSizeWidget {
  const MrAppBar({super.key, required this.title});

  final String title;

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: MrTextHeading6(
        title,
        // color: Theme.of(context).colorScheme.onPrimary,
      ),
    );
  }
}
