import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:test_app/core/services/github_api_service.dart';
import 'package:test_app/features/following/data/following.dart';

part 'followers_state.dart';

class FollowersCubit extends Cubit<FollowersState> {
  FollowersCubit(
    this.gitHubApiService,
  ) : super(FollowersInitial());

  final GitHubApiService gitHubApiService;

  Future<void> getFollowers(String login) async {
    final result = await gitHubApiService.getFollowers(login);

    if (result == null) {
      emit(FollowersError());
    } else {
      emit(FollowersLoaded(result));
    }
  }
}
