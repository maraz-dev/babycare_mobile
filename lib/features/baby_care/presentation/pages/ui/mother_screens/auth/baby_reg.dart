import 'package:dropdown_search/dropdown_search.dart';
import 'package:flutter/material.dart';
import 'package:hephzibah/common/commons.dart';
import 'package:hephzibah/common/widgets/button.dart';
import 'package:hephzibah/features/baby_care/presentation/pages/ui/home_screen/home_page.dart';

class BabyRegistration extends StatelessWidget {
  const BabyRegistration({Key? key}) : super(key: key);

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
                'Repeat Password',
                style: normalText.copyWith(fontSize: 15),
              ),
            ),
            DropdownSearch<String>(
              popupProps: PopupProps.menu(
                showSelectedItems: true,
                disabledItemFn: (String s) => s.startsWith('I'),
              ),
              items: const ["Brazil", "Italia (Disabled)", "Tunisia", 'Canada'],
              dropdownDecoratorProps: DropDownDecoratorProps(
                dropdownSearchDecoration: InputDecoration(
                    hintText: "country in menu mode",
                    filled: true,
                    fillColor: Theme.of(context).inputDecorationTheme.fillColor,
                    suffixIcon: Icon(Icons.keyboard_arrow_down),
                    border: InputBorder.none),
              ),
              onChanged: print,
              selectedItem: "Brazil",
            ),
            SizedBox(
              height: 10,
            ),
            Divider(
              color: lightPrimaryColor,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 10),
              child: Text(
                'Current Location',
                style: normalText.copyWith(fontSize: 15),
              ),
            ),
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
                    fillColor: Theme.of(context).inputDecorationTheme.fillColor,
                    suffixIcon: Icon(Icons.keyboard_arrow_down),
                    suffix: Icon(
                      Icons.location_on,
                      color: lightPrimaryColor,
                    ),
                    border: InputBorder.none),
              ),
              onChanged: print,
              selectedItem: "Nigeria",
            ),
            SizedBox(
              height: 10,
            ),
            Divider(
              color: lightPrimaryColor,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 10),
              child: Text(
                'Preferred Hospital',
                style: normalText.copyWith(fontSize: 15),
              ),
            ),
            DropdownSearch<String>(
              popupProps: PopupProps.menu(
                showSelectedItems: true,
                disabledItemFn: (String s) => s.startsWith('I'),
              ),
              items: const ["Brazil", "Italia (Disabled)", "Tunisia", 'Canada'],
              dropdownDecoratorProps: DropDownDecoratorProps(
                dropdownSearchDecoration: InputDecoration(
                    hintText: "Preffered Hospital",
                    filled: true,
                    fillColor: Theme.of(context).inputDecorationTheme.fillColor,
                    suffixIcon: Icon(Icons.keyboard_arrow_down),
                    suffix: Icon(
                      Icons.location_on,
                      color: lightPrimaryColor,
                    ),
                    border: InputBorder.none),
              ),
              onChanged: print,
              selectedItem: "Clinic",
            ),
            SizedBox(
              height: 10,
            ),
            Divider(
              color: lightPrimaryColor,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 10),
              child: Text(
                'Preferred Doctor',
                style: normalText.copyWith(fontSize: 15),
              ),
            ),
            DropdownSearch<String>(
              popupProps: PopupProps.menu(
                showSelectedItems: true,
                disabledItemFn: (String s) => s.startsWith('I'),
              ),
              items: const ["Brazil", "Italia (Disabled)", "Tunisia", 'Canada'],
              dropdownDecoratorProps: DropDownDecoratorProps(
                dropdownSearchDecoration: InputDecoration(
                    hintText: "Preferred Doctor",
                    filled: true,
                    fillColor: Theme.of(context).inputDecorationTheme.fillColor,
                    border: InputBorder.none),
              ),
              onChanged: print,
              selectedItem: "Akintunde",
            ),
            const SizedBox(
              height: 20,
            ),
            ButtonWidget(
              text: 'PROCEED TO DASHBOARD',
              press: () => Navigator.push(context,
                  MaterialPageRoute(builder: (context) => const HomePage())),
              BackgroundColor: primaryColor,
              radius: 4,
            ),
            const SizedBox(
              height: 10,
            ),
          ],
        ),
      ),
    );
  }
}
