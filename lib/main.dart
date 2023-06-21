import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hephzibah/features/baby_care/presentation/cubit/signin/signin_cubit.dart';
import 'package:hephzibah/features/baby_care/presentation/pages/ui/default_home.dart';
import 'package:hephzibah/features/baby_care/presentation/pages/ui/splash_screen/onBoardingOne.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:hephzibah/firebase_options.dart';
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
              return const DefaultHome();
            } else {
              return const OnBoardingOne();
            }
          },
        ),
      ),
    );
  }
}
