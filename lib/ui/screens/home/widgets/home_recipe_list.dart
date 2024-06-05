part of '../home_screen.dart';

class HomeRecipeList extends StatelessWidget {
  const HomeRecipeList({super.key});

  @override
  Widget build(BuildContext context) {
    final homeBloc = BlocInjector.of<HomeBloc>(context);

    return StreamBuilder(
      stream: homeBloc.stream,
      initialData: homeBloc.state,
      builder: (context, snapshot) {
        if (snapshot.data == null) return const SizedBox.shrink();
        final state = snapshot.data!;

        return switch (state) {
          HomeLoadedState() => state.recipes.isNotEmpty
              ? Expanded(
                  child: ListView.builder(
                    itemCount: state.recipes.length,
                    padding: const EdgeInsets.symmetric(
                      horizontal: MrSpacing.md,
                    ).copyWith(
                      bottom: MrSpacing.xl * 2,
                    ),
                    itemBuilder: (context, index) => RecipeItem(
                      recipe: state.recipes[index],
                      onTap: () => _navigateToDetail(
                        context,
                        recipeId: state.recipes[index].id,
                      ),
                    ),
                  ),
                )
              : const EmptyMessage(),
          HomeFailureState() => ErrorMessage(
              message: state.message,
            ),
          _ => const Expanded(
              child: Center(
                child: CircularProgressIndicator(),
              ),
            )
        };
      },
    );
  }

  void _navigateToDetail(BuildContext context, {required String recipeId}) {
    Navigator.pushNamed(
      context,
      AppRoutes.detail,
      arguments: recipeId,
    );
  }
}
