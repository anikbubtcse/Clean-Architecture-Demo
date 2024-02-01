import 'package:clean_architecture_demo/features/users_info/data/repositories/users_repository_imp.dart';
import 'package:clean_architecture_demo/features/users_info/domain/use_cases/user_repository_use_case.dart';
import 'package:clean_architecture_demo/features/users_info/presentation/bloc/users_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:http/http.dart' as http;
import 'features/users_info/data/data_sources/users_remote_data_sourse.dart';
import 'features/users_info/domain/repositories/users_repository.dart';

final locator = GetIt.instance;

void setupLocator() {
  //bloc

  locator.registerFactory(() => UsersBloc(locator()));

  //usecase

  locator.registerLazySingleton(
      () => UserRepositoryUseCase(usersRepository: locator()));

  //repository

  locator.registerLazySingleton<UsersRepository>(
      () => UsersRepositoryImp(usersRemoteDataSource: locator()));

  //datasource

  locator.registerLazySingleton<UsersRemoteDataSource>(
      () => UsersRemoteDataSourceImp(client: locator()));

  //external

  locator.registerLazySingleton(() => http.Client());
}
