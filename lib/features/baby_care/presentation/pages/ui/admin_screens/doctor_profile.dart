import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

import '../../../../../../common/commons.dart';
import '../../../../../../common/widgets/button.dart';
import '../../../../domain/entities/doctor_entity.dart';

class DoctorsProfile extends StatelessWidget {
  const DoctorsProfile({
    Key? key,
    required this.currentDoctor,
    required this.isDoctor,
  }) : super(key: key);
  final DoctorEntity currentDoctor;
  final bool isDoctor;

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(280),
        child: Container(
          color: primaryColor,
          padding: EdgeInsets.symmetric(horizontal: 20),
          height: 110,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  IconButton(
                    icon: Icon(
                      Icons.arrow_back,
                      color: Colors.black,
                    ),
                    onPressed: () {
                      Navigator.pop(context);
                    },
                  ),
                  Text(
                    'Profile',
                    style:
                        headerText.copyWith(color: Colors.white, fontSize: 18),
                  ),
                ],
              ),
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
                    borderRadius: BorderRadius.circular(6)),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    const Divider(
                      thickness: 1,
                    ),
                    SizedBox(
                      height: 25,
                    ),
                    Image.asset('assets/Avatar.png'),
                    SizedBox(
                      height: 20,
                    ),
                    Text(
                      'Name:',
                      style: normalText.copyWith(fontSize: 12),
                    ),
                    Text(
                      currentDoctor.name,
                      style:
                          headerText.copyWith(fontSize: 13, color: darkColor),
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    Table(
                      border: TableBorder.all(width: 0.2),
                      defaultVerticalAlignment:
                          TableCellVerticalAlignment.middle,
                      columnWidths: <int, TableColumnWidth>{
                        0: FixedColumnWidth(width * 0.4),
                        1: FixedColumnWidth(width * 0.4),
                      },
                      children: [
                        TableRow(
                          children: <Widget>[
                            Container(
                              margin: EdgeInsets.symmetric(
                                  vertical: 15, horizontal: 30),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Row(
                                    children: [
                                      Icon(Icons.location_on),
                                      SizedBox(
                                        width: 5,
                                      ),
                                      Column(
                                        children: [
                                          Text(
                                            currentDoctor.location,
                                            style: headerText.copyWith(
                                                fontSize: 14,
                                                color: Colors.black),
                                          ),
                                        ],
                                      )
                                    ],
                                  ),
                                  Row(
                                    children: [
                                      SizedBox(
                                        width: width * 0.08,
                                      ),
                                      Text(
                                        'Location',
                                        style: normalText,
                                        textAlign: TextAlign.left,
                                      ),
                                    ],
                                  )
                                ],
                              ),
                            ),
                            Container(
                              margin: EdgeInsets.symmetric(
                                  vertical: 15, horizontal: 30),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Row(
                                    children: [
                                      Icon(Icons.light_mode),
                                      SizedBox(
                                        width: 5,
                                      ),
                                      Column(
                                        children: [
                                          Text(
                                            '${currentDoctor.yearsOfExperience.toInt()} Years',
                                            style: headerText.copyWith(
                                                fontSize: 14,
                                                color: Colors.black),
                                          ),
                                        ],
                                      )
                                    ],
                                  ),
                                  Row(
                                    children: [
                                      SizedBox(
                                        width: width * 0.08,
                                      ),
                                      Text(
                                        'Experience',
                                        style: normalText,
                                        textAlign: TextAlign.left,
                                      ),
                                    ],
                                  )
                                ],
                              ),
                            ),
                          ],
                        ),
                        TableRow(children: [
                          Container(
                            margin: EdgeInsets.symmetric(
                                vertical: 15, horizontal: 30),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'Phone number',
                                  style: normalText,
                                ),
                                Text(
                                  currentDoctor.phoneNumber,
                                  style: normalText.copyWith(color: darkColor),
                                ),
                              ],
                            ),
                          ),
                          Container(
                            margin: EdgeInsets.symmetric(
                                vertical: 15, horizontal: 25),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'Email address',
                                  style: normalText,
                                ),
                                Text(
                                  currentDoctor.email,
                                  style: normalText.copyWith(
                                      color: darkColor, fontSize: 10),
                                ),
                              ],
                            ),
                          ),
                        ]),
                        TableRow(children: [
                          Container(
                            margin: EdgeInsets.symmetric(
                                vertical: 15, horizontal: 30),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'NIN',
                                  style: normalText,
                                ),
                                Text(
                                  currentDoctor.ninNumber,
                                  style: normalText.copyWith(color: darkColor),
                                ),
                              ],
                            ),
                          ),
                          Container(
                            margin: EdgeInsets.symmetric(
                                vertical: 15, horizontal: 25),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'Current hospital',
                                  style: normalText,
                                ),
                                Text(
                                  currentDoctor.currentHospital,
                                  style: normalText.copyWith(
                                      color: darkColor, fontSize: 10),
                                ),
                              ],
                            ),
                          ),
                        ]),
                      ],
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    currentDoctor.status == "unapproved" && !isDoctor
                        ? Padding(
                            padding: const EdgeInsets.symmetric(vertical: 5.0),
                            child: ButtonWidget(
                              text: 'APPROVE',
                              press: () async {
                                await FirebaseFirestore.instance
                                    .collection('doctors')
                                    .doc(currentDoctor.doctorId)
                                    .update({'status': 'approved'});
                                Navigator.pop(context);
                              },
                              BackgroundColor: primaryColor,
                              radius: 4,
                            ),
                          )
                        : SizedBox(
                            height: 0,
                            width: 0,
                          ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
