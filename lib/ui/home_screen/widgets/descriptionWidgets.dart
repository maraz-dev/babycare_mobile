import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'package:hephzibah/common/commons.dart';

class DescriptionWidget extends StatelessWidget {
  final List<String> icons;
  final List<String> titles;
  final List<String> descriptions;
  final List<void Function()> onTapNav;

  const DescriptionWidget({
    Key? key,
    required this.icons,
    required this.titles,
    required this.descriptions,
    required this.onTapNav,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;

    /*24 is for notification bar on Android*/
    final double itemHeight = (size.height - kToolbarHeight - 10) / 3;
    final double itemWidth = size.width / 2;
    return SingleChildScrollView(
      child: GridView.builder(
        shrinkWrap: true,
        itemCount: titles.length,
        physics: NeverScrollableScrollPhysics(),
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          crossAxisSpacing: 10.0,
          mainAxisSpacing: 10.0,
          childAspectRatio: (itemWidth / itemHeight),
        ),
        itemBuilder: (BuildContext context, int index) {
          return InkWell(
            onTap: onTapNav[index],
            child: Container(
              padding: EdgeInsets.all(15),
              margin: EdgeInsets.all(5),
              height: 10000,
              decoration: BoxDecoration(
                color: Colors.white,
                boxShadow: [
                  BoxShadow(
                    color: primaryColor.withOpacity(0.3),
                    spreadRadius: 2,
                    blurRadius: 2,
                    offset: Offset(0, 4), // changes position of shadow
                  ),
                ],
              ),
              child: Expanded(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      child: SvgPicture.asset(icons[index]),
                      color: primaryColor.withOpacity(0.08),
                      padding: EdgeInsets.all(10),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 20.0),
                      child: Text(
                        titles[index],
                        style: headerText.copyWith(fontSize: 15),
                      ),
                    ),
                    Text(
                      descriptions[index],
                      style: normalText.copyWith(fontSize: 13),
                    ),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
