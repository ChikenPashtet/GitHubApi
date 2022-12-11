import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:test_app/core/services/github_api_service.dart';
import 'package:test_app/features/repositories/data/repository.dart';

part 'repositories_state.dart';

class RepositoriesCubit extends Cubit<RepositoriesState> {
  RepositoriesCubit(
    this.gitHubApiService,
  ) : super(RepositoriesInitial());

  final GitHubApiService gitHubApiService;

  Future<void> getRepositories(String login) async {
    final result = await gitHubApiService.getRepositories(login);

    if (result == null) {
      emit(RepositoriesError());
    } else {
      emit(RepositoriesLoaded(result));
    }
  }
}
