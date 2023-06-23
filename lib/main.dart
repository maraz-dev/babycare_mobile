import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'features/baby_care/presentation/cubit/appointment/appointment_cubit.dart';
import 'features/baby_care/presentation/cubit/baby/baby_cubit.dart';
import 'features/baby_care/presentation/cubit/doctor/doctor_cubit.dart';
import 'features/baby_care/presentation/cubit/mother/mother_cubit.dart';
import 'features/baby_care/presentation/cubit/signin/signin_cubit.dart';
import 'features/baby_care/presentation/cubit/user/user_cubit.dart';
import 'features/baby_care/presentation/pages/ui/default_home.dart';
import 'features/baby_care/presentation/pages/ui/splash_screen/onBoardingOne.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';
import 'features/baby_care/presentation/cubit/auth/auth_cubit.dart';
import 'injection_container.dart' as di;

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  di.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<AuthCubit>(
          create: (_) => di.sl<AuthCubit>()..appStarted(),
        ),
        BlocProvider<SigninCubit>(
          create: (_) => di.sl<SigninCubit>(),
        ),
        BlocProvider<UserCubit>(
          create: (_) => di.sl<UserCubit>(),
        ),
        BlocProvider<DoctorCubit>(
          create: (_) => di.sl<DoctorCubit>(),
        ),
        BlocProvider<MotherCubit>(
          create: (_) => di.sl<MotherCubit>(),
        ),
        BlocProvider<BabyCubit>(
          create: (_) => di.sl<BabyCubit>(),
        ),
        BlocProvider<AppointmentCubit>(
          create: (_) => di.sl<AppointmentCubit>(),
        ),
      ],
      child: MaterialApp(
        title: 'Flutter Demo',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          primaryColor: Colors.lightBlue[800],
          fontFamily: 'Abel',
          textTheme: const TextTheme(
            displayLarge:
                TextStyle(fontSize: 72.0, fontWeight: FontWeight.bold),
            titleLarge: TextStyle(
                fontSize: 30.0,
                fontStyle: FontStyle.normal,
                fontWeight: FontWeight.w400),
            bodyMedium: TextStyle(fontSize: 14.0, fontFamily: 'Hind'),
          ),
        ),
        home: BlocBuilder<AuthCubit, AuthState>(
          builder: (context, authState) {
            if (authState is Authenticated) {
              return DefaultHome(uid: authState.uid);
            } else {
              return const OnBoardingOne();
            }
          },
        ),
      ),
    );
  }
}
