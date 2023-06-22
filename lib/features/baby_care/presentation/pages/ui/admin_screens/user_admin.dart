import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hephzibah/common/commons.dart';

import '../../../cubit/mother/mother_cubit.dart';

class UserAdmin extends StatefulWidget {
  const UserAdmin({Key? key}) : super(key: key);

  @override
  State<UserAdmin> createState() => _UserAdminState();
}

class _UserAdminState extends State<UserAdmin> {
  @override
  void initState() {
    BlocProvider.of<MotherCubit>(context).getMothers();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Users',
              style: headerText.copyWith(color: Colors.white, fontSize: 18),
            ),
            Text(
              'Manage Registered Users',
              style: headerText.copyWith(color: Colors.white, fontSize: 15),
            ),
          ],
        ),
        elevation: 0.0,
        backgroundColor: primaryColor,
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back,
            color: Colors.black,
          ),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: Container(
        padding: EdgeInsets.all(15),
      child: BlocBuilder<MotherCubit, MotherState>(
          builder: (context, state) {
            if (state is MotherLoaded) {
              return ListView.builder(
                itemCount: state.mothers.length,
                itemBuilder: (BuildContext context, int index) {
                  return ExpansionTile(
                    title: Text(
                      state.mothers[index].name,
                    ),
                  );
                },
              );
            }
            return const Center(
              child: CircularProgressIndicator(),
            );
          },
        ),
      ),
    );
  }
}
