part of 'users_bloc.dart';

abstract class UsersState extends Equatable {
  const UsersState();
}

class UsersInitial extends UsersState {
  @override
  List<Object> get props => [];
}

class UsersLoading extends UsersState {
  @override
  List<Object> get props => [];
}

class UsersLoaded extends UsersState {
  final List<UsersEntity> result;

  UsersLoaded(this.result);

  @override
  List<Object> get props => [result];
}

class UsersError extends UsersState {
  String message;

  UsersError(this.message);

  @override
  List<Object> get props => [message];
}
