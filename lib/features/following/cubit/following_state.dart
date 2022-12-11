part of 'following_cubit.dart';

abstract class FollowingState {}

class FollowingInitial extends FollowingState {}

class FollowingLoaded extends FollowingState {
  FollowingLoaded(this.followings);

  final List<Following> followings;
}

class FollowingError extends FollowingState {}
