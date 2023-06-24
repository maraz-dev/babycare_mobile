import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hephzibah/common/commons.dart';

import 'package:hephzibah/features/baby_care/domain/entities/doctor_entity.dart';

import '../../../cubit/appointment/appointment_cubit.dart';

class AppointmentsScreen extends StatefulWidget {
  const AppointmentsScreen({
    Key? key,
    required this.currentDoctor,
  }) : super(key: key);
  final DoctorEntity currentDoctor;

  @override
  State<AppointmentsScreen> createState() => _AppointmentsScreenState();
}

class _AppointmentsScreenState extends State<AppointmentsScreen> {
  @override
  void initState() {
    BlocProvider.of<AppointmentCubit>(context).getAppointments();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: primaryColor,
        foregroundColor: Colors.white,
        title: const Text(
          'Appointments',
          style: TextStyle(
            color: Colors.white,
          ),
        ),
      ),
      body: BlocBuilder<AppointmentCubit, AppointmentState>(
        builder: (context, state) {
          if (state is AppointmentLoaded) {
            return Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 20).copyWith(top: 20),
              child: ListView.builder(
                itemCount: state.appointments.length,
                itemBuilder: (BuildContext context, int index) {
                  final date = state.appointments[index].appointmentDateandTime.toDate();
                  return Container(
                    margin: const EdgeInsets.only(bottom: 20),
                    padding: const EdgeInsets.all(20),
                    height: 100,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(10),
                      boxShadow: [
                        BoxShadow(
                          offset: const Offset(0, 8),
                          blurRadius: 30,
                          spreadRadius: 0,
                          color: Colors.black.withOpacity(0.06),
                        )
                      ],
                    ),
                    child:  Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          state.appointments[index].motherName,
                          style: const TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                         Text(
                          "${date.day}/${date.month}/${date.year}",
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ],
                    ),
                  );
                },
              ),
            );
          }
          return const CircularProgressIndicator();
        },
      ),
    );
  }
}
