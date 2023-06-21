import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'package:hephzibah/common/commons.dart';
import 'package:hephzibah/common/widgets/button.dart';
import 'package:hephzibah/features/baby_care/domain/entities/mother_entity.dart';
import 'package:hephzibah/features/baby_care/presentation/pages/ui/home_screen/view_doctor.dart';

import '../../../../domain/entities/doctor_entity.dart';
import '../../../cubit/doctor/doctor_cubit.dart';

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

  List hospitals = [
    'Hospital A',
    'Hospital B',
    'Hospital C',
    'Hospital D',
  ];

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;

    return Scaffold(
      body: ListView(
        shrinkWrap: true,
        children: [
          Container(
            color: Colors.white,
            padding: EdgeInsets.only(top: 60, left: 15, right: 15),
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
                          child: SvgPicture.asset('assets/svg/calendar.svg'),
                        ),
                        SizedBox(
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
                  color: Color(0xffF7F9FC),
                  height: height,
                  margin: EdgeInsets.symmetric(horizontal: 10),
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
                      BlocBuilder<DoctorCubit, DoctorState>(
                        builder: (context, state) {
                          if (state is DoctorLoaded) {
                            return DropdownButtonFormField<DoctorEntity>(
                              value: selectedDoctor,
                              items: _buildDoctorDropdownItems(state.doctors),
                              onChanged: (value) {
                                setState(() {
                                  selectedDoctor = value;
                                });
                              },
                              decoration: const InputDecoration(
                                labelText: 'Preffered Doctor',
                                fillColor: Colors.white,
                                filled: true,
                              ),
                            );
                          }
                          return Center(
                            child: const CircularProgressIndicator(),
                          );
                        },
                      ),
                      const SizedBox(
                        height: 30,
                      ),
                      DropdownButtonFormField<String>(
                        value: selectedHospital,
                        items: _buildHospitalDropdownItems(),
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
                                        currentMother: widget.currentMother,
                                        selectedDoctor: selectedDoctor!,
                                        selectedHospital: selectedHospital!,
                                        selectedLocation: selectedLocation!,
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
      items.add(
        DropdownMenuItem(
          value: doctor,
          child: Text(doctor.name),
        ),
      );
    }
    return items;
  }

  List<DropdownMenuItem<String>> _buildHospitalDropdownItems() {
    List<DropdownMenuItem<String>> items = [];
    for (var hospital in hospitals) {
      items.add(
        DropdownMenuItem(
          value: hospital,
          child: Text(hospital),
        ),
      );
    }
    return items;
  }
}
