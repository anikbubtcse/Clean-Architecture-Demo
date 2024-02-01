import 'package:clean_architecture_demo/features/users_info/domain/entities/users_entity.dart';
import 'package:fpdart/fpdart.dart';

import '../../../../core/error/failure.dart';

abstract class UsersRepository {
  Future<Either<Failure, List<UsersEntity>>> getUsersInfo(String id);
}
