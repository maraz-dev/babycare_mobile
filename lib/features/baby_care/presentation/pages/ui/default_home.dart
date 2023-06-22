import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hephzibah/features/baby_care/domain/entities/user_entity.dart';
import 'package:hephzibah/features/baby_care/presentation/cubit/user/user_cubit.dart';
import 'package:hephzibah/features/baby_care/presentation/pages/ui/admin_screens/admin_dash.dart';
import 'package:hephzibah/features/baby_care/presentation/pages/ui/admin_screens/doctors_admin.dart';
import 'package:hephzibah/features/baby_care/presentation/pages/ui/doctor_screens/doctor_home_screen.dart';
import 'package:hephzibah/features/baby_care/presentation/pages/ui/home_screen/home_page.dart';

import '../../cubit/signin/signin_cubit.dart';

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
