import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:hephzibah/common/commons.dart';
class ProfilePage extends StatelessWidget {
  const ProfilePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(280),
        child: Container(
          color: primaryColor,
          padding: EdgeInsets.symmetric(horizontal: 20),
          height: 120,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text('Profile', style: headerText.copyWith(color: Colors.white, fontSize: 26),),
              SvgPicture.asset('assets/svg/settings.svg'),
            ],
          ),
        ),

      ),
      body: Container(
        color: primaryColor.withOpacity(0.08),
        child: Stack(
          children: [
            Container(
              height: 200,
              width: width,
              color: primaryColor,
            ),
            Align(
              alignment: AlignmentDirectional.topCenter,
              child: Container(
                height: 550,
                width: width * 0.9,
                padding: EdgeInsets.symmetric(horizontal: 20),
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(6)
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 20.0),
                      child: Row(
                        children: [
                          Container(
                            height: 70,
                            width: 70,
                            padding: EdgeInsets.all(5),
                            decoration: BoxDecoration(
                                color: primaryColor.withOpacity(0.08),
                                borderRadius: BorderRadius.circular(6)
                            ),
                            child: SvgPicture.asset('assets/svg/person.svg'),
                          ),
                          SizedBox(width: 30,),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text('Deveeprasad Acharya', style: normalText.copyWith(color: darkColor, fontSize: 18),),
                              Text('20 yrs old', style: normalText.copyWith(fontSize: 18),),
                            ],
                          )
                        ],
                      ),
                    ),
                    Divider(),
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 8.0),
                      child: Text('Email', style: normalText.copyWith(fontSize: 18, color: darkColor),),
                    ),
                    const TextField(
                      decoration: InputDecoration(
                        labelText: 'nyorhephzibah@gmail.com'
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 8.0),
                      child: Text('Phone Number', style: normalText.copyWith(fontSize: 18, color: darkColor),),
                    ),
                    const TextField(
                      decoration: InputDecoration(
                        labelText: '080123456789'
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 8.0),
                      child: Text('Blood Group', style: normalText.copyWith(fontSize: 18, color: darkColor),),
                    ),
                    const TextField(
                      decoration: InputDecoration(
                        labelText: '0 +'
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 8.0),
                      child: Text('Baby’s Name', style: normalText.copyWith(fontSize: 18, color: darkColor),),
                    ),
                    const TextField(
                      decoration: InputDecoration(
                        labelText: 'Baby Boy '
                      ),
                    ),
                  ],
                ),
            ),),
          ],
        ),
      ),
    );
  }
}
