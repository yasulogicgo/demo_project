import 'get_it/auth/auth_local_data_source.dart';
import 'get_it/auth/auth_remote_data_source.dart';
import 'get_it/auth/repository/auth_repository.dart';
import 'get_it/repository/auth_repository_impl.dart';
import 'package:get_it/get_it.dart';

final sl = GetIt.instance;

Future<void> init() async {
  // Remote DataSource
  sl.registerLazySingleton<AuthRemoteDataSource>(
          () => AuthRemoteDataSourceImpl());

  // Local DataSource
  sl.registerLazySingleton<AuthLocalDataSource>(
          () => AuthLocalDataSourceImpl());

  // Repository
  sl.registerLazySingleton<AuthRepository>(() => AuthRepositoryImpl(
    remote: sl(),   // injected automatically
    local: sl(),    // injected automatically
  ));
}
