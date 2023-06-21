import 'package:get_it/get_it.dart';
import 'package:hephzibah/features/baby_care/domain/usecases/create_baby_usecase.dart';
import 'package:hephzibah/features/baby_care/domain/usecases/create_doctor_usecase.dart';
import 'package:hephzibah/features/baby_care/domain/usecases/create_mother_usecase.dart';
import 'package:hephzibah/features/baby_care/domain/usecases/sign_out_usecase.dart';
import 'package:hephzibah/features/baby_care/presentation/cubit/auth/auth_cubit.dart';

import 'features/baby_care/data/datasources/firebase_remote_datasource.dart';
import 'features/baby_care/data/repositories/firebase_repository_impl.dart';
import 'features/baby_care/domain/repositories/firebase_repository.dart';
import 'features/baby_care/domain/usecases/get_current_uid_usecase.dart';
import 'features/baby_care/domain/usecases/is_signin_usecase.dart';
import 'features/baby_care/domain/usecases/signin_usecase.dart';
import 'features/baby_care/domain/usecases/signup_usecase.dart';
import 'features/baby_care/presentation/cubit/signin/signin_cubit.dart';

final sl = GetIt.instance;

Future<void> init() async {
  //Features bloc,
  sl.registerFactory<AuthCubit>(() => AuthCubit(
        isSigninUsecase: sl.call(),
        getCurrentUidUsecase: sl.call(),
      ));
  sl.registerFactory<SigninCubit>(() => SigninCubit(
        signupUsecase: sl.call(),
        signinUsecase: sl.call(),
        signoutUsecase: sl.call(),
        createDoctorUsecase: sl.call(),
        createMotherUsecase: sl.call(),
        createBabyUsecase: sl.call(),
      ));

  //!useCae
  sl.registerLazySingleton<IsSigninUsecase>(
      () => IsSigninUsecase(repository: sl.call()));
  sl.registerLazySingleton<GetCurrentUidUsecase>(
      () => GetCurrentUidUsecase(repository: sl.call()));
  sl.registerLazySingleton<SigninUsecase>(
      () => SigninUsecase(repository: sl.call()));
  sl.registerLazySingleton<SignupUsecase>(
      () => SignupUsecase(repository: sl.call()));
  sl.registerLazySingleton<CreateDoctorUsecase>(
      () => CreateDoctorUsecase(repository: sl.call()));
  sl.registerLazySingleton<CreateMotherUsecase>(
      () => CreateMotherUsecase(repository: sl.call()));
  sl.registerLazySingleton<CreateBabyUsecase>(
      () => CreateBabyUsecase(repository: sl.call()));
  sl.registerLazySingleton<SignoutUsecase>(
      () => SignoutUsecase(repository: sl.call()));

  //repository
  sl.registerLazySingleton<FirebaseRepository>(
      () => FirebaseRepositoryImpl(firebaseRemoteDatasource: sl.call()));

  //datasource
  sl.registerLazySingleton<FirebaseRemoteDatasource>(
      () => FirebaseRemoteDatasourceImpl());

  //external
  //e.g final shared Preference = await SharedPreferences.getInstance();
}
