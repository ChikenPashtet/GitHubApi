import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:test_app/core/services/github_api_service.dart';
import 'package:test_app/features/following/data/following.dart';

part 'following_state.dart';

class FollowingCubit extends Cubit<FollowingState> {
  FollowingCubit(
    this.gitHubApiService,
  ) : super(FollowingInitial());

  final GitHubApiService gitHubApiService;

  Future<void> getFollowings(String login) async {
    final result = await gitHubApiService.getFollowing(login);

    if (result == null) {
      emit(FollowingError());
    } else {
      emit(FollowingLoaded(result));
    }
  }
}
