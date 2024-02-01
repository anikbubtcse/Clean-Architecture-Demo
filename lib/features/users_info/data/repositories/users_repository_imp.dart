import 'package:clean_architecture_demo/core/error/exception.dart';
import 'package:clean_architecture_demo/core/error/failure.dart';
import 'package:clean_architecture_demo/features/users_info/data/data_sources/users_remote_data_sourse.dart';
import 'package:clean_architecture_demo/features/users_info/domain/entities/users_entity.dart';
import 'package:clean_architecture_demo/features/users_info/domain/repositories/users_repository.dart';
import 'package:fpdart/src/either.dart';

class UsersRepositoryImp extends UsersRepository {
  final UsersRemoteDataSource usersRemoteDataSource;

  UsersRepositoryImp({required this.usersRemoteDataSource});

  @override
  Future<Either<Failure, List<UsersEntity>>> getUsersInfo(String id) async {
    try {
      final result = await usersRemoteDataSource.getUsersInfo(id);
      return Right(result);
    } on ServerException {
      return Left(
          ServerFailure(message: 'Something went wrong. Try again later'));
    }
  }
}
