part of 'users_bloc.dart';

abstract class UsersEvent extends Equatable {
  const UsersEvent();
}

class UsersInfoEvent extends UsersEvent {

  String id;

  UsersInfoEvent(this.id);

  @override
  List<Object?> get props => [id];
}
