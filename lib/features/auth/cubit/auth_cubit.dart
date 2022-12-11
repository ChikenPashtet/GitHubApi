import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:test_app/core/services/github_api_service.dart';
import 'package:test_app/data/user/user.dart';

part 'auth_state.dart';

class AuthCubit extends Cubit<AuthState> {
  AuthCubit(
    this._gitHubApiService,
  ) : super(AuthInitial());

  final GitHubApiService _gitHubApiService;

  Future<void> onAuthUser(String name) async {
    final result = await _gitHubApiService.getUser(name);

    if (result == null) {
      emit(AuthError());
    } else {
      emit(AuthLoaded(result));
    }
  }
}
