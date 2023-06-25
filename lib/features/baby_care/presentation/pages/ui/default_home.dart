import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hephzibah/features/baby_care/data/models/user_model.dart';

import '../../cubit/user/user_cubit.dart';
import 'admin_screens/admin_dash.dart';
import 'doctor_screens/doctor_home_screen.dart';
import 'home_screen/home_page.dart';

class DefaultHome extends StatefulWidget {
  const DefaultHome({
    Key? key,
    required this.uid,
  }) : super(key: key);
  final String uid;

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
      body: BlocBuilder<UserCubit, UserState>(
        builder: (_, state) {
          if (state is UserLoaded) {
            return homeBody(state);
          }
          return const Center(child: CircularProgressIndicator());
        },
      ),
    );
  }

  Widget homeBody(UserLoaded users) {
    final user = users.users.firstWhere(
      (user) => user.uid == widget.uid,
      orElse: () => const UserModel(
        uid: "",
        userClass: "",
      ),
    );
    print(user);

    if (user.userClass == 'mother') {
      return HomePage(
        uid: widget.uid,
      );
    } else if (user.userClass == 'doctor') {
      return DoctorHome(
        uid: widget.uid,
      );
    } else if (user.userClass == 'admin') {
      return const AdminDashboard();
    }
    return const Center(
      child: CircularProgressIndicator(),
    );
  }
}
