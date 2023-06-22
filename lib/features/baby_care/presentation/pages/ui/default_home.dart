import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../domain/entities/user_entity.dart';
import '../../cubit/user/user_cubit.dart';
import 'admin_screens/admin_dash.dart';
import 'doctor_screens/doctor_home_screen.dart';
import 'home_screen/home_page.dart';

class DefaultHome extends StatefulWidget {
  const DefaultHome({super.key});

  @override
  State<DefaultHome> createState() => _DefaultHomeState();
}

class _DefaultHomeState extends State<DefaultHome> {
  @override
  void initState() {
    BlocProvider.of<UserCubit>(context).getUsers();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // body: Center(
      //   child: GestureDetector(
      //     onTap: () async {
      //       await BlocProvider.of<SigninCubit>(context).submitSignOut();
      //     },
      //     child: Text('Default Home'),
      //   ),
      // ),
      body: BlocBuilder<UserCubit, UserState>(
        builder: (_, state) {
          if (state is UserLoaded) {
            final UserEntity currentUser = state.users.firstWhere(
                (user) => user.uid == FirebaseAuth.instance.currentUser!.uid);
            if (currentUser.userClass == 'admin') {
              return const AdminDashboard();
            } else if (currentUser.userClass == 'mother') {
              return const HomePage();
            } else if (currentUser.userClass == 'doctor') {
              return const DoctorHome();
            }
          }
          return const Center(child: CircularProgressIndicator());
        },
      ),
    );
  }
}
