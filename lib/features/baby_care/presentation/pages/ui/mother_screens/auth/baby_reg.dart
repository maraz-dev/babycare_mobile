import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dropdown_search/dropdown_search.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../../../common/commons.dart';
import '../../../../../../../common/widgets/button.dart';
import '../../../../cubit/signin/signin_cubit.dart';
import '../../home_screen/home_page.dart';

import '../../default_home.dart';

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
  DateTime conceptionDate = DateTime.now();
  String? selectedLocation;
  String? selectedHospital;
  String? selectedDoctor;
  List hospitals = [
    'Hospital A',
    'Hospital B',
    'Hospital C',
    'Hospital D',
  ];
  List doctors = [
    'Doctor A',
    'Doctor B',
    'Doctor C',
    'Doctor D',
  ];
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
      body: BlocConsumer<SigninCubit, SigninState>(
        listener: (context, state) {
          if (state is SigninSuccess) {
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => const DefaultHome()));
          }
        },
        builder: (context, state) {
          if (state is SigninLoading) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
          return Padding(
            padding: EdgeInsets.all(20),
            child: ListView(
              children: [
                SizedBox(
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
                      color: Color.fromARGB(255, 234, 234, 236),
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
                SizedBox(
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
                SizedBox(
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
                  items: _buildHospitalDropdownItems(),
                  onChanged: (value) {
                    setState(() {
                      selectedHospital = value;
                    });
                  },
                  decoration: const InputDecoration(
                    labelText: 'Preferred Hospital',
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                Divider(
                  color: lightPrimaryColor,
                ),
                DropdownButtonFormField<String>(
                  value: selectedDoctor,
                  items: _buildDoctorDropdownItems(),
                  onChanged: (value) {
                    setState(() {
                      selectedDoctor = value;
                    });
                  },
                  decoration: const InputDecoration(
                    labelText: 'Prefered Doctor',
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
                      preferredDoctor: selectedDoctor!,
                    );
                  },
                  BackgroundColor: primaryColor,
                  radius: 4,
                ),
                const SizedBox(
                  height: 10,
                ),
              ],
            ),
          );
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

  List<DropdownMenuItem<String>> _buildDoctorDropdownItems() {
    List<DropdownMenuItem<String>> items = [];
    for (var doctor in doctors) {
      items.add(
        DropdownMenuItem(
          value: doctor,
          child: Text(doctor),
        ),
      );
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
