import 'package:flutter/material.dart';
import 'package:mr_recipe/ui/common/common.dart';

class NotFoundScreen extends StatelessWidget {
  const NotFoundScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: MrTextHeading6(MrStrings.routeNotFound),
      ),
    );
  }
}
