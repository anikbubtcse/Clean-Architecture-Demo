import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import '../../domain/entities/users_entity.dart';
import '../../domain/use_cases/user_repository_use_case.dart';
import 'package:fpdart/fpdart.dart';

part 'users_event.dart';

part 'users_state.dart';

class UsersBloc extends Bloc<UsersEvent, UsersState> {
  final UserRepositoryUseCase userRepositoryUseCase;

  UsersBloc(this.userRepositoryUseCase) : super(UsersInitial()) {
    on<UsersInfoEvent>(_onUsersInfoEvent);
  }

  _onUsersInfoEvent(UsersInfoEvent event, Emitter<UsersState> state) async {
    emit(UsersLoading());

    final result = await userRepositoryUseCase.execute(event.id);

    result.fold((l) {
      emit(UsersError(l.message));
    }, (r) {
      emit(UsersLoaded(r));
    });
  }
}
