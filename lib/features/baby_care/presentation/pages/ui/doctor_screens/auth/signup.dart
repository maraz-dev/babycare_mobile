// ignore_for_file: use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hephzibah/common/commons.dart';
import 'package:hephzibah/common/widgets/authHeaderWidget.dart';
import 'package:hephzibah/common/widgets/button.dart';
import 'package:hephzibah/common/widgets/custom_text_input.dart';
import 'package:hephzibah/features/baby_care/presentation/cubit/signin/signin_cubit.dart';
import 'package:hephzibah/features/baby_care/presentation/pages/ui/doctor_screens/auth/signin.dart';

import '../../default_home.dart';

class SignUp extends StatefulWidget {
  const SignUp({Key? key}) : super(key: key);

  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  @override
  Widget build(BuildContext context) {
    TextEditingController _nameController = TextEditingController();
    TextEditingController _emailController = TextEditingController();
    TextEditingController _phoneController = TextEditingController();
    TextEditingController _hospitalController = TextEditingController();
    TextEditingController _experienceController = TextEditingController();
    TextEditingController _ninController = TextEditingController();
    TextEditingController _contactController = TextEditingController();
    TextEditingController _passwordController = TextEditingController();
    return Scaffold(
      appBar: authAppBar(
          context, 'Sign Up', 'Please enter your credentials to proceed', true),
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
          return SingleChildScrollView(
            child: Container(
              padding: EdgeInsets.all(20),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: EdgeInsets.symmetric(vertical: 5),
                    child: Text(
                      'Name',
                      style: normalText.copyWith(fontSize: 15),
                    ),
                  ),
                  CustomTextInput(
                    textEditController: _nameController,
                    hintTextString: ' Name',
                    inputType: InputType.Default,
                    cornerRadius: 5,
                    themeColor: lightPrimaryColor,
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(vertical: 5),
                    child: Text(
                      'Email',
                      style: normalText.copyWith(fontSize: 15),
                    ),
                  ),
                  CustomTextInput(
                    textEditController: _emailController,
                    hintTextString: ' Email',
                    inputType: InputType.Email,
                    cornerRadius: 5,
                    themeColor: lightPrimaryColor,
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(vertical: 5),
                    child: Text(
                      'Mobile Phone',
                      style: normalText.copyWith(fontSize: 15),
                    ),
                  ),
                  CustomTextInput(
                    textEditController: _phoneController,
                    hintTextString: 'Mobile Number ',
                    inputType: InputType.Default,
                    cornerRadius: 5,
                    themeColor: lightPrimaryColor,
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(vertical: 5),
                    child: Text(
                      'Current Hospital',
                      style: normalText.copyWith(fontSize: 15),
                    ),
                  ),
                  CustomTextInput(
                    textEditController: _hospitalController,
                    hintTextString: 'Current Hospital',
                    inputType: InputType.Default,
                    cornerRadius: 5,
                    themeColor: lightPrimaryColor,
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(vertical: 5),
                    child: Text(
                      'Years Of Experience',
                      style: normalText.copyWith(fontSize: 15),
                    ),
                  ),
                  CustomTextInput(
                    textEditController: _experienceController,
                    hintTextString: 'Years of Experience',
                    inputType: InputType.Default,
                    cornerRadius: 5,
                    themeColor: lightPrimaryColor,
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(vertical: 5),
                    child: Text(
                      'NIN number',
                      style: normalText.copyWith(fontSize: 15),
                    ),
                  ),
                  CustomTextInput(
                    textEditController: _ninController,
                    hintTextString: 'NIN Number',
                    inputType: InputType.Default,
                    cornerRadius: 5,
                    themeColor: lightPrimaryColor,
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(vertical: 5),
                    child: Text(
                      'OFFICIAL HOSPITAL CONTACT',
                      style: normalText.copyWith(fontSize: 15),
                    ),
                  ),
                  CustomTextInput(
                    textEditController: _contactController,
                    hintTextString: 'Official Hospital Contact',
                    inputType: InputType.Default,
                    cornerRadius: 5,
                    themeColor: lightPrimaryColor,
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(vertical: 5),
                    child: Text(
                      'Password',
                      style: normalText.copyWith(fontSize: 15),
                    ),
                  ),
                  CustomTextInput(
                    textEditController: _passwordController,
                    hintTextString: 'Password',
                    inputType: InputType.Password,
                    cornerRadius: 5,
                    themeColor: lightPrimaryColor,
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  ButtonWidget(
                    text: 'SIGN UP',
                    press: () async {
                      await BlocProvider.of<SigninCubit>(context)
                          .registerDoctor(
                        email: _emailController.text.trim(),
                        password: _passwordController.text.trim(),
                        name: _nameController.text.trim(),
                        phoneNumber: _phoneController.text.trim(),
                        currentHospital: _hospitalController.text.trim(),
                        yearsOfExperience:
                            double.parse(_experienceController.text.trim()),
                        ninNumber: _ninController.text.trim(),
                        officialHospitalContact: _contactController.text.trim(),
                      );
                    },
                    BackgroundColor: primaryColor,
                    radius: 4,
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Text(
                        'Already have an account? ',
                        style: normalText.copyWith(fontSize: 15),
                      ),
                      InkWell(
                          onTap: () => Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => const SignIn())),
                          child: Text(
                            'Log In',
                            style: normalText.copyWith(
                                fontSize: 15, color: primaryColor),
                          )),
                    ],
                  )
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
