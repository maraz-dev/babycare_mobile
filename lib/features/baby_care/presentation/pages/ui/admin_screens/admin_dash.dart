// ignore_for_file: use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:hephzibah/common/commons.dart';
import 'package:hephzibah/common/widgets/button.dart';
import 'package:hephzibah/common/widgets/custom_text_input.dart';
import 'package:hephzibah/features/baby_care/presentation/pages/ui/admin_screens/user_admin.dart';
import 'package:hephzibah/features/baby_care/presentation/pages/ui/home_screen/widgets/descriptionWidgets.dart';
import 'package:hephzibah/features/baby_care/presentation/pages/ui/splash_screen/onBoardingOne.dart';

import '../../../cubit/signin/signin_cubit.dart';

class AdminDashboard extends StatelessWidget {
  const AdminDashboard({Key? key}) : super(key: key);

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
                    'Admin Dashboard',
                    style:
                        headerText.copyWith(color: Colors.white, fontSize: 26),
                  ),
                  InkWell(
                    child: SvgPicture.asset('assets/svg/settings.svg'),
                    onTap: () => Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const AdminDashboard())),
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
      body: Container(
        padding: EdgeInsets.all(10),
        child: ListView(
          children: [
            // DescriptionWidget(
            //   icons: ['assets/svg/person_group.svg','assets/svg/person.svg'],
            //   titles: ["Users", "Doctors"],
            //   descriptions: ["Manage Registered Users", "Manage Registered Doctors"],
            // ),
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
                           await BlocProvider.of<SigninCubit>(context).submitSignOut();
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
