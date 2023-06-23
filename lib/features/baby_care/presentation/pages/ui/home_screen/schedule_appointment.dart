import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../../../../common/commons.dart';
import '../../../../../../common/widgets/button.dart';
import '../../../../domain/entities/doctor_entity.dart';
import '../../../../domain/entities/mother_entity.dart';
import '../../../cubit/doctor/doctor_cubit.dart';
import 'view_doctor.dart';

class ScheduleAppointment extends StatefulWidget {
  const ScheduleAppointment({
    Key? key,
    required this.currentMother,
  }) : super(key: key);
  final MotherEntity currentMother;

  @override
  State<ScheduleAppointment> createState() => _ScheduleAppointmentState();
}

class _ScheduleAppointmentState extends State<ScheduleAppointment> {
  @override
  void initState() {
    BlocProvider.of<DoctorCubit>(context).getDoctors();
    super.initState();
  }

  String? selectedLocation;
  String? selectedHospital;
  DoctorEntity? selectedDoctor;
  List<DoctorEntity> doctors = [];
  List states = [
    'Abia',
    'Adamawa',
    'Akwa Ibom',
    'Anambra',
    'Bauchi',
    'Bayelsa',
    'Benue',
    'Borno',
    'Cross River',
    'Delta',
    'Ebonyi',
    'Edo',
    'Ekiti',
    'Enugu',
    'Gombe',
    'Imo',
    'Jigawa',
    'Kaduna',
    'Kano',
    'Katsina',
    'Kebbi',
    'Kogi',
    'Kwara',
    'Lagos',
    'Nasarawa',
    'Niger',
    'Ogun',
    'Ondo',
    'Osun',
    'Oyo',
    'Plateau',
    'Rivers',
    'Sokoto',
    'Taraba',
    'Yobe',
    'Zamfara',
  ];

  List<String> hospitals = [];

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;

    return Scaffold(
      body: BlocBuilder<DoctorCubit, DoctorState>(
        builder: (context, state) {
          if (state is DoctorLoaded) {
            doctors = state.doctors;
            return ListView(
              shrinkWrap: true,
              children: [
                Container(
                  color: Colors.white,
                  padding: const EdgeInsets.only(top: 60, left: 15, right: 15),
                  child: Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 8.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              'Schedule Appointment',
                              style: headerText.copyWith(
                                  fontSize: 26, color: Colors.black),
                            ),
                            Row(children: [
                              InkWell(
                                onTap: null,
                                child:
                                    SvgPicture.asset('assets/svg/calendar.svg'),
                              ),
                              const SizedBox(
                                width: 15,
                              ),
                              InkWell(
                                onTap: null,
                                child: SvgPicture.asset('assets/svg/bell.svg'),
                              ),
                            ])
                          ],
                        ),
                      ),
                      Container(
                        color: const Color(0xffF7F9FC),
                        height: height,
                        margin: const EdgeInsets.symmetric(horizontal: 10),
                        child: Column(
                          children: [
                            const SizedBox(
                              height: 30,
                            ),
                            DropdownButtonFormField<String>(
                              value: selectedLocation,
                              items: _buildStateDropdownItems(),
                              onChanged: (value) {
                                setState(() {
                                  selectedLocation = value;
                                });
                              },
                              decoration: const InputDecoration(
                                labelText: 'Preffered Location',
                                fillColor: Colors.white,
                                filled: true,
                              ),
                            ),
                            const SizedBox(
                              height: 30,
                            ),
                            DropdownButtonFormField<DoctorEntity>(
                              value: selectedDoctor,
                              items: _buildDoctorDropdownItems(state.doctors),
                              onChanged: (value) {
                                setState(() {
                                  selectedDoctor = value;
                                  hospitals = [selectedDoctor!.currentHospital];
                                });
                              },
                              decoration: const InputDecoration(
                                labelText: 'Preffered Doctor',
                                fillColor: Colors.white,
                                filled: true,
                              ),
                            ),
                            const SizedBox(
                              height: 30,
                            ),
                            DropdownButtonFormField<String>(
                              value: selectedHospital,
                              items: _buildHospitalDropdownItems(hospitals),
                              onChanged: (value) {
                                setState(() {
                                  selectedHospital = value;
                                });
                              },
                              decoration: const InputDecoration(
                                labelText: 'Preferred Hospital',
                                fillColor: Colors.white,
                                filled: true,
                              ),
                            ),
                            const SizedBox(
                              height: 20,
                            ),
                            Padding(
                              padding: const EdgeInsets.all(18.0),
                              child: ButtonWidget(
                                text: 'VIEW DOCTOR',
                                press: () => Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => ViewDoctor(
                                              currentMother:
                                                  widget.currentMother,
                                              selectedDoctor: selectedDoctor!,
                                              selectedHospital:
                                                  selectedHospital!,
                                              selectedLocation:
                                                  selectedLocation!,
                                            ))),
                                BackgroundColor: primaryColor,
                                radius: 4,
                              ),
                            ),
                          ],
                        ),
                      )
                    ],
                  ),
                ),
              ],
            );
          }
          return const CircularProgressIndicator();
        },
      ),
    );
  }

  List<DropdownMenuItem<String>> _buildStateDropdownItems() {
    List<DropdownMenuItem<String>> items = [];
    for (var location in states) {
      items.add(
        DropdownMenuItem(
          value: location,
          child: Text(location),
        ),
      );
    }
    return items;
  }

  List<DropdownMenuItem<DoctorEntity>> _buildDoctorDropdownItems(
      List<DoctorEntity> doctors) {
    List<DropdownMenuItem<DoctorEntity>> items = [];
    for (var doctor in doctors) {
      if (doctor.location == selectedLocation) {
        items.add(
          DropdownMenuItem(
            value: doctor,
            child: Text(doctor.name),
          ),
        );
      }
    }
    return items;
  }

  List<DropdownMenuItem<String>> _buildHospitalDropdownItems(
      List<String> hospis) {
    List<DropdownMenuItem<String>> items = [];
    for (var hospi in hospis) {
      items.add(
        DropdownMenuItem(
          value: hospi,
          child: Text(hospi),
        ),
      );
    }
    return items;
  }
}
