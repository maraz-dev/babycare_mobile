import 'package:flutter/material.dart';
import 'package:hephzibah/common/commons.dart';
import 'package:hephzibah/features/baby_care/presentation/pages/ui/admin_screens/doctors_admin.dart';
class UserAdmin extends StatelessWidget {
  const UserAdmin({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Users', style: headerText.copyWith(color: Colors.white, fontSize: 18),),
            Text('Manage Registered Users', style: headerText.copyWith(color: Colors.white, fontSize: 15),),
          ],
        ),
        elevation: 0.0,
        backgroundColor: primaryColor,
        leading: IconButton(icon: Icon(Icons.arrow_back, color: Colors.black,), onPressed: () { Navigator.pop(context); },),
      ),
      body: Container(
        padding: EdgeInsets.all(15),
        child: ListView(
          children: [
            ExpansionTile(
              title: Text(
              "User A",
              style: normalText.copyWith(color: darkColor, fontSize: 13)
              ),
              children: [
                InkWell(child: Text('Click for doctor admin page'), onTap: () => Navigator.push(context, MaterialPageRoute(builder: (context) => const DoctorsAdmin())),)
            ],
            ),
            ExpansionTile(
              title: Text(
              "User B",
              style: normalText.copyWith(color: darkColor, fontSize: 13)
              ),
              children: [
                InkWell(child: Text('Click for doctor admin page'), onTap: () => Navigator.push(context, MaterialPageRoute(builder: (context) => const DoctorsAdmin())),)
            ],
            ),
            ExpansionTile(
              title: Text(
              "User C",
              style: normalText.copyWith(color: darkColor, fontSize: 13)
              ),
              children: [
              Text('Hi')
            ],
            ),
            ExpansionTile(
              title: Text(
              "User D",
              style: normalText.copyWith(color: darkColor, fontSize: 13)
              ),
              children: [
              Text('Hi')
            ],
            ),
          ],
        ),
      ),
    );
  }
}
