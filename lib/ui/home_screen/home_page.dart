import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:hephzibah/common/commons.dart';
import 'package:hephzibah/common/widgets/custom_text_input.dart';
import 'package:hephzibah/ui/home_screen/knowledge_center.dart';
import 'package:hephzibah/ui/home_screen/profile.dart';
import 'package:hephzibah/ui/home_screen/schedule_appointment.dart';
import 'package:hephzibah/ui/home_screen/settings.dart';
import 'package:hephzibah/ui/home_screen/widgets/countdown.dart';
import 'package:hephzibah/ui/home_screen/widgets/descriptionWidgets.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

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
                    'Home Page',
                    style: headerText.copyWith(color: Colors.white),
                  ),
                  InkWell(
                    child: SvgPicture.asset('assets/svg/settings.svg'),
                    onTap: () => Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const Settings())),
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
        padding: EdgeInsets.symmetric(vertical: 20, horizontal: 15),
        child: ListView(
          children: [
            CountDownWidget(),
            CountDownWidget(),
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
                          builder: (context) => const ProfilePage()));
                },
                () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const ScheduleAppointment()));
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
}
