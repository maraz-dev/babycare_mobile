import 'package:get_it/get_it.dart';
import 'package:hephzibah/features/baby_care/domain/usecases/get_messages_usecase.dart';
import 'package:hephzibah/features/baby_care/domain/usecases/send_text_message_usecase.dart';
import 'package:hephzibah/features/baby_care/presentation/cubit/communication/communication_cubit.dart';
import 'features/baby_care/domain/usecases/book_appointment_usecase.dart';
import 'features/baby_care/domain/usecases/create_baby_usecase.dart';
import 'features/baby_care/domain/usecases/create_doctor_usecase.dart';
import 'features/baby_care/domain/usecases/create_mother_usecase.dart';
import 'features/baby_care/domain/usecases/get_appointments_usecase.dart';
import 'features/baby_care/domain/usecases/get_babies_usecase.dart';
import 'features/baby_care/domain/usecases/get_doctors_usecase.dart';
import 'features/baby_care/domain/usecases/get_mothers_usecase.dart';
import 'features/baby_care/domain/usecases/get_users_usecase.dart';
import 'features/baby_care/domain/usecases/sign_out_usecase.dart';
import 'features/baby_care/presentation/cubit/appointment/appointment_cubit.dart';
import 'features/baby_care/presentation/cubit/auth/auth_cubit.dart';
import 'features/baby_care/presentation/cubit/baby/baby_cubit.dart';
import 'features/baby_care/presentation/cubit/doctor/doctor_cubit.dart';
import 'features/baby_care/presentation/cubit/mother/mother_cubit.dart';
import 'features/baby_care/presentation/cubit/user/user_cubit.dart';

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
  sl.registerFactory<UserCubit>(() => UserCubit(
        getUsersUsecase: sl.call(),
      ));
  sl.registerFactory<DoctorCubit>(() => DoctorCubit(
        getDoctorsUsecase: sl.call(),
      ));
  sl.registerFactory<MotherCubit>(() => MotherCubit(
        getMothersUsecase: sl.call(),
      ));
  sl.registerFactory<BabyCubit>(() => BabyCubit(
        getBabiesUsecase: sl.call(),
      ));
  sl.registerFactory<AppointmentCubit>(() => AppointmentCubit(
        bookAppointmentUsecase: sl.call(),
        getAppointmentsUsecase: sl.call(),
      ));
  sl.registerFactory<CommunicationCubit>(() => CommunicationCubit(
        getMessagesUseCase: sl.call(),
        sendTextMessageUseCase: sl.call(),
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
  sl.registerLazySingleton<GetUsersUsecase>(
      () => GetUsersUsecase(repository: sl.call()));
  sl.registerLazySingleton<GetDoctorsUsecase>(
      () => GetDoctorsUsecase(repository: sl.call()));
  sl.registerLazySingleton<GetMothersUsecase>(
      () => GetMothersUsecase(repository: sl.call()));
  sl.registerLazySingleton<GetBabiesUsecase>(
      () => GetBabiesUsecase(repository: sl.call()));
  sl.registerLazySingleton<BookAppointmentUsecase>(
      () => BookAppointmentUsecase(repository: sl.call()));
  sl.registerLazySingleton<GetAppointmentsUsecase>(
      () => GetAppointmentsUsecase(repository: sl.call()));
  sl.registerLazySingleton<GetMessagesUsecase>(
      () => GetMessagesUsecase(repository: sl.call()));
  sl.registerLazySingleton<SendTextMessageUseCase>(
      () => SendTextMessageUseCase(repository: sl.call()));

  //repository
  sl.registerLazySingleton<FirebaseRepository>(
      () => FirebaseRepositoryImpl(firebaseRemoteDatasource: sl.call()));

  //datasource
  sl.registerLazySingleton<FirebaseRemoteDatasource>(
      () => FirebaseRemoteDatasourceImpl());

  //external
  //e.g final shared Preference = await SharedPreferences.getInstance();
}
