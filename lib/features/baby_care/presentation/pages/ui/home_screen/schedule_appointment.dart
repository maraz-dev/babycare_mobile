import 'package:dropdown_search/dropdown_search.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:hephzibah/common/commons.dart';
import 'package:hephzibah/common/widgets/button.dart';
import 'package:hephzibah/features/baby_care/presentation/pages/ui/home_screen/view_doctor.dart';
class ScheduleAppointment extends StatelessWidget {
  const ScheduleAppointment({Key? key}) : super(key: key);

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
                      Text('Schedule Appointment', style: headerText.copyWith(fontSize: 26, color: Colors.black),),
                      Row(
                        children: [
                          InkWell(onTap: null, child: SvgPicture.asset('assets/svg/calendar.svg'),),
                          SizedBox(width: 15,),
                          InkWell(onTap: null, child: SvgPicture.asset('assets/svg/bell.svg'),),
                        ]
                      )
                    ],
                  ),
                ),
                Container(
                  color: Color(0xffF7F9FC),
                  height: height,
                  margin: EdgeInsets.symmetric(horizontal: 10),
                  child: Column(
                    children: [
                      const SizedBox(height: 30,),
                      DropdownSearch<String>(
                        popupProps: PopupProps.menu(
                          showSelectedItems: true,
                          disabledItemFn: (String s) => s.startsWith('I'),
                        ),
                        items: const ["Brazil", "Italia (Disabled)", "Tunisia", 'Canada'],
                        dropdownDecoratorProps: DropDownDecoratorProps(
                          dropdownSearchDecoration: InputDecoration(
                              hintText: "Current Location",
                              filled: true,
                              fillColor: Colors.white,
                              border: InputBorder.none
                          ),
                        ),
                        onChanged: print,
                        selectedItem: "Current Location",
                      ),
                      const SizedBox(height: 30,),
                      DropdownSearch<String>(
                        popupProps: PopupProps.menu(
                          showSelectedItems: true,
                          disabledItemFn: (String s) => s.startsWith('I'),
                        ),
                        items: const ["Brazil", "Italia (Disabled)", "Tunisia", 'Canada'],
                        dropdownDecoratorProps: DropDownDecoratorProps(
                          dropdownSearchDecoration: InputDecoration(
                              hintText: "Preferred Location",
                              filled: true,
                              fillColor: Colors.white,
                              border: InputBorder.none
                          ),
                        ),
                        onChanged: print,
                        selectedItem: "Preferred Location",
                      ),
                      const SizedBox(height: 30,),
                      DropdownSearch<String>(
                        popupProps: PopupProps.menu(
                          showSelectedItems: true,
                          disabledItemFn: (String s) => s.startsWith('I'),
                        ),
                        items: const ["Brazil", "Italia (Disabled)", "Tunisia", 'Canada'],
                        dropdownDecoratorProps: DropDownDecoratorProps(
                          dropdownSearchDecoration: InputDecoration(
                              hintText: "Preferred Hospital",
                              filled: true,
                              fillColor: Colors.white,
                              border: InputBorder.none
                          ),
                        ),
                        onChanged: print,
                        selectedItem: "Preferred Hospital",
                      ),
                      const SizedBox(height: 20,),
                      Padding(
                        padding: const EdgeInsets.all(18.0),
                        child: ButtonWidget(text: 'VIEW DOCTOR', press: () => Navigator.push(context, MaterialPageRoute(builder: (context) => const ViewDoctor())), BackgroundColor: primaryColor, radius: 4,),
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
}
