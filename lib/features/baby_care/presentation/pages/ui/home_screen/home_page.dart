import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../../../../common/commons.dart';
import '../../../../../../common/widgets/custom_text_input.dart';
import '../../../cubit/mother/mother_cubit.dart';
import 'knowledge_center.dart';
import 'profile.dart';
import 'schedule_appointment.dart';
import 'settings.dart';
import 'widgets/countdown.dart';
import 'widgets/descriptionWidgets.dart';

class HomePage extends StatefulWidget {
  const HomePage({
    Key? key,
    required this.uid,
  }) : super(key: key);
  final String uid;

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  void initState() {
    BlocProvider.of<MotherCubit>(context).getMothers();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    TextEditingController _searchController = TextEditingController();
    return BlocBuilder<MotherCubit, MotherState>(
      builder: (_, state) {
        if (state is MotherLoaded) {
          final currentMother = state.mothers.firstWhere(
            (mother) =>
                mother.motherId == FirebaseAuth.instance.currentUser!.uid,
          );
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
                          'Home Page',
                          style: headerText.copyWith(color: Colors.white),
                        ),
                        InkWell(
                          child: SvgPicture.asset('assets/svg/settings.svg'),
                          onTap: () => Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => Settings(
                                        currentMother: currentMother,
                                      ))),
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
            body: Padding(
              padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 15),
              child: ListView(
                children: [
                  NextAppointmentCountdownWidget(
                    label: 'Countdown to Next Appointment',
                    currentMother: currentMother,
                  ),
                  DeliveryCountDownWidget(
                    label: 'Countdown to Delivery Date',
                    currentMother: currentMother,
                  ),
                  DescriptionWidget(
                    icons: const [
                      'assets/svg/person.svg',
                      'assets/svg/calendar.svg',
                      'assets/svg/person_group.svg',
                      'assets/svg/article.svg'
                    ],
                    titles: const [
                      "My account",
                      "Schedule Appointment",
                      "Community of Mothers",
                      "Knowledge Center"
                    ],
                    descriptions: const [
                      "Details on Your Account",
                      "Make an Appointment With a Doctor",
                      "Connect with other Mothers ",
                      "F.A.Q’s and Help"
                    ],
                    onTapNav: [
                      () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => ProfilePage(
                                      currentMother: currentMother,
                                    )));
                      },
                      () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => ScheduleAppointment(
                                      currentMother: currentMother,
                                    )));
                      },
                      () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const KnowledgeCenter()));
                      },
                      () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const KnowledgeCenter()));
                      },
                    ],
                  )
                ],
              ),
            ),
          );
        }
        return const Center(
          child: CircularProgressIndicator(),
        );
      },
    );
  }
}
