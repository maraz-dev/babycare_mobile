import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../../../../common/commons.dart';
import '../../../../../../common/widgets/button.dart';
import '../../../../../../common/widgets/custom_text_input.dart';
import '../../../cubit/doctor/doctor_cubit.dart';
import '../../../cubit/signin/signin_cubit.dart';
import '../admin_screens/doctor_profile.dart';
import '../home_screen/widgets/descriptionWidgets.dart';
import '../splash_screen/onBoardingOne.dart';

class DoctorHome extends StatefulWidget {
  const DoctorHome({
    Key? key,
    required this.uid,
  }) : super(key: key);
  final String uid;

  @override
  State<DoctorHome> createState() => _DoctorHomeState();
}

class _DoctorHomeState extends State<DoctorHome> {
  @override
  void initState() {
    BlocProvider.of<DoctorCubit>(context).getDoctors();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    TextEditingController _searchController = TextEditingController();
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(160),
        child: Container(
          padding: const EdgeInsets.only(left: 20, right: 20, top: 60),
          color: primaryColor,
          child: Column(
            children: [
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Dashboard',
                    style:
                        headerText.copyWith(color: Colors.white, fontSize: 26),
                  ),
                  InkWell(
                    child: SvgPicture.asset('assets/svg/settings.svg'),
                    onTap: () {},
                  ),
                ],
              ),
              CustomTextInput(
                textEditController: _searchController,
                hintTextString: 'Search...',
                inputType: InputType.Search,
                cornerRadius: 5,
                themeColor: lightPrimaryColor,
                enabled: true,
              ),
            ],
          ),
        ),
      ),
      body: BlocBuilder<DoctorCubit, DoctorState>(
        builder: (_, state) {
          if (state is DoctorLoaded) {
            final currentDoctor = state.doctors.firstWhere((doctor) =>
                doctor.doctorId == widget.uid);
            return Container(
              padding: const EdgeInsets.all(10),
              child: ListView(
                children: [
                  DescriptionWidget(
                    icons: const [
                      'assets/svg/calendar.svg',
                      'assets/svg/person.svg',
                    ],
                    titles: const [
                      "Appointments",
                      "Edit Profile",
                    ],
                    descriptions: const [
                      "Manage Appointments",
                      "Make Profile Changes",
                    ],
                    onTapNav: [
                      () {},
                      () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => DoctorsProfile(
                                      currentDoctor: currentDoctor,
                                    )));
                      },
                    ],
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 5.0),
                    child: ButtonWidget(
                      text: 'Log Out',
                      press: () => _showLogoutModalDialog(context),
                      BackgroundColor: primaryColor,
                      radius: 4,
                    ),
                  ),
                ],
              ),
            );
          }
          return const Center(
            child: CircularProgressIndicator(),
          );
        },
      ),
    );
  }

  _showLogoutModalDialog(context) {
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return Dialog(
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20.0)),
            child: Container(
              constraints: const BoxConstraints(maxHeight: 460),
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(vertical: 22.0, horizontal: 20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      height: 120,
                      decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: primaryColor.withOpacity(0.08),
                          image: const DecorationImage(
                              image: AssetImage('assets/arrow.png'))),
                    ),
                    const SizedBox(
                      height: 25,
                    ),
                    Text(
                      'Log out?',
                      style: normalText.copyWith(
                          fontSize: 22, color: Colors.black),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Text(
                      'Are you sure you want to log-out?',
                      style: normalText.copyWith(
                          fontSize: 15, color: Colors.black),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 5.0),
                      child: ButtonWidget(
                        text: 'Log Out',
                        press: () async {
                          await BlocProvider.of<SigninCubit>(context)
                              .submitSignOut();
                          return Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => const OnBoardingOne()));
                        },
                        BackgroundColor: primaryColor,
                        radius: 4,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          );
        });
  }
}
