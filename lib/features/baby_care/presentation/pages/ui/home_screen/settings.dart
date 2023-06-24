// ignore_for_file: use_build_context_synchronously

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'package:hephzibah/common/commons.dart';
import 'package:hephzibah/common/widgets/button.dart';
import 'package:hephzibah/features/baby_care/domain/entities/mother_entity.dart';
import 'package:hephzibah/features/baby_care/presentation/pages/ui/home_screen/schedule_appointment.dart';
import 'package:hephzibah/features/baby_care/presentation/pages/ui/splash_screen/onBoardingOne.dart';

import '../../../cubit/auth/auth_cubit.dart';
import '../../../cubit/signin/signin_cubit.dart';

class Settings extends StatefulWidget {
  const Settings({
    Key? key,
    required this.currentMother,
  }) : super(key: key);
  final MotherEntity currentMother;

  @override
  State<Settings> createState() => _SettingsState();
}

class _SettingsState extends State<Settings> {
  @override
  Widget build(BuildContext context) {
    bool switchBtn = true;
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Settings',
          style: headerText.copyWith(color: Colors.black, fontSize: 18),
        ),
        actions: [
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
        ],
        elevation: 0.0,
        backgroundColor: Colors.white,
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
        child: Column(
          children: [
            Container(
              height: 60,
              padding: EdgeInsets.symmetric(horizontal: 15),
              margin: EdgeInsets.symmetric(vertical: 10),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(4)),
                color: primaryColor,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Toggle Notifications',
                    style:
                        normalText.copyWith(color: Colors.white, fontSize: 16),
                  ),
                  CupertinoSwitch(
                    // overrides the default green color of the track
                    activeColor: Colors.white54,
                    // color of the round icon, which moves from right to left
                    thumbColor: Colors.white,
                    // when the switch is off
                    trackColor: Colors.black12,
                    // boolean variable value
                    value: switchBtn,
                    // changes the state of the switch
                    onChanged: (value) => setState(() => switchBtn = value),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 10.0),
              child: ButtonWidget(
                text: 'Book Appointment ',
                press: () => Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => ScheduleAppointment(
                              currentMother: widget.currentMother,
                            ))),
                BackgroundColor: primaryColor,
                radius: 4,
              ),
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
      ),
    );
  }

  //Logout Modal
  _showLogoutModalDialog(context) {
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return Dialog(
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20.0)),
            child: Container(
              constraints: BoxConstraints(maxHeight: 460),
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
                          image: DecorationImage(
                              image: AssetImage('assets/arrow.png'))),
                    ),
                    SizedBox(
                      height: 25,
                    ),
                    Text(
                      'Log out?',
                      style: normalText.copyWith(
                          fontSize: 22, color: Colors.black),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Text(
                      'Are you sure you want to log-out?',
                      style: normalText.copyWith(
                          fontSize: 15, color: Colors.black),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 5.0),
                      child: ButtonWidget(
                        text: 'Log Out',
                        press: () async {
                          await BlocProvider.of<AuthCubit>(context).loggedOut();
                          await BlocProvider.of<SigninCubit>(context)
                              .submitSignOut();
                          Navigator.push(
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
