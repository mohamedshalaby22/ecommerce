import 'package:dio/dio.dart';
import 'package:ecommerce/features/Auth/login/data/apis/login_api_service.dart';
import 'package:ecommerce/features/Auth/login/data/repos/login_repo.dart';
import 'package:get_it/get_it.dart';
import '../../features/Auth/signup/data/apis/signup_api_service.dart';
import '../../features/Auth/signup/data/repos/signup_repo.dart';
import '../networking/dio_factory.dart';

final getIt = GetIt.instance;

Future<void> setupGetIt() async {
  Dio dio = DioFactory.getDio();

 // login
  getIt.registerLazySingleton<LoginApiService>(() => LoginApiService(dio));
  getIt.registerLazySingleton<LoginRepo>(() => LoginRepo(getIt()));

  //signup
  getIt.registerLazySingleton<SignupApiService>(() => SignupApiService(dio));
  getIt.registerLazySingleton<SignupRepo>(() => SignupRepo(getIt()));
  
  
}
