import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../cubit/signin/signin_cubit.dart';

class DefaultHome extends StatelessWidget {
  const DefaultHome({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: GestureDetector(
          onTap: () async {

                await BlocProvider.of<SigninCubit>(context).submitSignOut();
          },
          child: Text('Default Home'),
        ),
      ),
    );
  }
}
