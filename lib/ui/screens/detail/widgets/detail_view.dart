part of '../detail_screen.dart';

class DetailView extends StatelessWidget {
  const DetailView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const MrAppBar(
        title: MrStrings.detail,
      ),
      body: BlocReactor<RecipeDetailBloc, RecipeDetailState>(
        observer: _listenDetailBloc,
        builder: (context, state) {
          return switch (state) {
            DetailLoadedState() => RecipeContent(
                recipe: state.recipe,
              ),
            DetailFailureState() => DetailErrorMessage(
                message: state.message,
              ),
            _ => const Center(
                child: CircularProgressIndicator(),
              ),
          };
        },
      ),
    );
  }

  void _listenDetailBloc(BuildContext context, RecipeDetailState state) {
    switch (state) {
      case ShowLoadingState():
        MrLoadingModal.show(context);
        break;
      case CloseLoadingState():
        Navigator.pop(context);
        break;
      case RecipeDeletedState():
        DetailHelpers.navigateToHome(context);
        break;
      default:
    }
  }
}
