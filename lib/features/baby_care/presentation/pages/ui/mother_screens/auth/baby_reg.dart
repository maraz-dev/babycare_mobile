// ignore_for_file: use_build_context_synchronously

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:hephzibah/features/baby_care/domain/entities/doctor_entity.dart';
import 'package:hephzibah/main.dart';

import '../../../../../../../common/commons.dart';
import '../../../../../../../common/widgets/button.dart';
import '../../../../cubit/doctor/doctor_cubit.dart';
import '../../../../cubit/signin/signin_cubit.dart';

class BabyRegistration extends StatefulWidget {
  const BabyRegistration({
    Key? key,
    required this.babyId,
  }) : super(key: key);
  final String babyId;

  @override
  State<BabyRegistration> createState() => _BabyRegistrationState();
}

class _BabyRegistrationState extends State<BabyRegistration> {
  @override
  void initState() {
    BlocProvider.of<DoctorCubit>(context).getDoctors();
    super.initState();
  }

  DateTime conceptionDate = DateTime.now();
  String? selectedLocation;
  String? selectedHospital;
  DoctorEntity? selectedDoctor;
  List<String> hospitals = [];
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
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: primaryColor,
        elevation: 0.0,
        title: Text(
          'Baby Registration',
          style: headerText.copyWith(fontSize: 20, color: Colors.white),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: BlocBuilder<DoctorCubit, DoctorState>(
          builder: (context, state) {
            if (state is DoctorLoaded) {
              print(widget.babyId);
              doctors = state.doctors;
              return ListView(
                children: [
                  const SizedBox(
                    height: 10,
                  ),
                  Divider(
                    color: lightPrimaryColor,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 10),
                    child: Text(
                      'Date of Conception',
                      style: normalText.copyWith(fontSize: 15),
                    ),
                  ),
                  GestureDetector(
                    onTap: () async {
                      final date = await _pickDate();
                      if (date == null) return; // pressed cancel
                      setState(() {
                        conceptionDate = date;
                      });
                    },
                    child: Container(
                      width: double.infinity,
                      height: 40,
                      decoration: BoxDecoration(
                        color: const Color.fromARGB(255, 234, 234, 236),
                        borderRadius: BorderRadius.circular(4),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                          "${conceptionDate.day}/${conceptionDate.month}/${conceptionDate.year}",
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Divider(
                    color: lightPrimaryColor,
                  ),
                  // Padding(
                  //   padding: const EdgeInsets.symmetric(vertical: 10),
                  //   child: Text(
                  //     'Current Location',
                  //     style: normalText.copyWith(fontSize: 15),
                  //   ),
                  // ),
                  DropdownButtonFormField<String>(
                    value: selectedLocation,
                    items: _buildStateDropdownItems(),
                    onChanged: (value) {
                      setState(() {
                        selectedLocation = value;
                      });
                    },
                    decoration: const InputDecoration(
                      labelText: 'State',
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Divider(
                    color: lightPrimaryColor,
                  ),
                  DropdownButtonFormField<DoctorEntity>(
                    value: selectedDoctor,
                    items: _buildDoctorDropdownItems(doctors),
                    onChanged: (value) {
                      setState(() {
                        selectedDoctor = value;
                        hospitals = [selectedDoctor!.currentHospital];
                      });
                    },
                    decoration: const InputDecoration(
                      labelText: 'Prefered Doctor',
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Divider(
                    color: lightPrimaryColor,
                  ),
                  // Padding(
                  //   padding: const EdgeInsets.symmetric(vertical: 10),
                  //   child: Text(
                  //     'Preferred Hospital',
                  //     style: normalText.copyWith(fontSize: 15),
                  //   ),
                  // ),
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
                    ),
                  ),

                  // Padding(
                  //   padding: const EdgeInsets.symmetric(vertical: 10),
                  //   child: Text(
                  //     'Preferred Doctor',
                  //     style: normalText.copyWith(fontSize: 15),
                  //   ),
                  // ),
                  const SizedBox(
                    height: 20,
                  ),
                  ButtonWidget(
                    text: 'PROCEED TO DASHBOARD',
                    press: () async {
                      await BlocProvider.of<SigninCubit>(context).registerBaby(
                        babyId: widget.babyId,
                        dateOfConception: Timestamp.fromDate(conceptionDate),
                        currentLocation: selectedLocation!,
                        prefferedHospital: selectedHospital!,
                        preferredDoctor: selectedDoctor!.name,
                      );
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const Home(),
                        ),
                      );
                    },
                    BackgroundColor: primaryColor,
                    radius: 4,
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                ],
              );
            }
            return const CircularProgressIndicator();
          },
        ),
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

  List<DropdownMenuItem<DoctorEntity>> _buildDoctorDropdownItems(
      List<DoctorEntity> mydocs) {
    List<DropdownMenuItem<DoctorEntity>> items = [];
    for (var doctor in mydocs) {
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

  Future<DateTime?> _pickDate() => showDatePicker(
        context: context,
        initialDate: DateTime.now(),
        firstDate: DateTime(2020),
        lastDate: DateTime(2024),
      );
}
