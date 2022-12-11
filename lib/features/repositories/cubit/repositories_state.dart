part of 'repositories_cubit.dart';

abstract class RepositoriesState {}

class RepositoriesInitial extends RepositoriesState {}

class RepositoriesLoaded extends RepositoriesState {
  RepositoriesLoaded(this.repositories);

  final List<Repository> repositories;
}

class RepositoriesError extends RepositoriesState {}
