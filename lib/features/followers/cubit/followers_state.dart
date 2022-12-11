part of 'followers_cubit.dart';

abstract class FollowersState {}

class FollowersInitial extends FollowersState {}

class FollowersLoaded extends FollowersState {
  FollowersLoaded(this.followings);

  final List<Following> followings;
}

class FollowersError extends FollowersState {}
