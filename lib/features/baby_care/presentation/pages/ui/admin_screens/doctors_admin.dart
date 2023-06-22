import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../../../common/commons.dart';
import '../../../cubit/doctor/doctor_cubit.dart';
import 'doctor_profile.dart';

class DoctorsAdmin extends StatefulWidget {
  const DoctorsAdmin({Key? key}) : super(key: key);

  @override
  State<DoctorsAdmin> createState() => _DoctorsAdminState();
}

class _DoctorsAdminState extends State<DoctorsAdmin> {
  @override
  void initState() {
    BlocProvider.of<DoctorCubit>(context).getDoctors();
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
              'Doctors',
              style: headerText.copyWith(color: Colors.white, fontSize: 18),
            ),
            Text(
              'Manage Registered Doctors',
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
        child: BlocBuilder<DoctorCubit, DoctorState>(
          builder: (context, state) {
            if (state is DoctorLoaded) {
              return ListView.builder(
                itemCount: state.doctors.length,
                itemBuilder: (BuildContext context, int index) {
                  return ExpansionTile(
                    onExpansionChanged: (value) {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => DoctorsProfile(
                            currentDoctor: state.doctors[index],
                          ),
                        ),
                      );
                    },
                    title: Text(
                      state.doctors[index].name,
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
