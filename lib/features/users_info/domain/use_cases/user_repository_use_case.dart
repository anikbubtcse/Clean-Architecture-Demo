import 'package:fpdart/fpdart.dart';

import '../../../../core/error/failure.dart';
import '../entities/users_entity.dart';
import '../repositories/users_repository.dart';

class UserRepositoryUseCase {
  final UsersRepository usersRepository;

  UserRepositoryUseCase({required this.usersRepository});

  Future<Either<Failure, List<UsersEntity>>> execute(String id) async {
    return await usersRepository.getUsersInfo(id);
  }
}
