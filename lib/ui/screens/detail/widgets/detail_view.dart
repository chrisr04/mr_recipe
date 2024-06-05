part of '../detail_screen.dart';

class DetailView extends StatefulWidget {
  const DetailView({super.key, required this.recipeId});

  final String recipeId;

  @override
  State<DetailView> createState() => _DetailViewState();
}

class _DetailViewState extends State<DetailView> {
  late final _detailBloc = BlocInjector.of<RecipeDetailBloc>(context);
  StreamSubscription<RecipeDetailState>? _listenerSubscription;

  @override
  void didChangeDependencies() {
    _listenerSubscription ??= _detailBloc.stream.listen(_listenDetailBloc);
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const MrAppBar(
        title: MrStrings.detail,
      ),
      body: StreamBuilder(
        stream: _detailBloc.stream,
        builder: (context, snapshot) {
          if (snapshot.data == null) return const SizedBox.shrink();

          final state = snapshot.data!;
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

  @override
  void dispose() {
    _listenerSubscription?.cancel();
    _detailBloc.dispose();
    super.dispose();
  }

  void _listenDetailBloc(RecipeDetailState state) {
    if (!context.mounted) return;

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
