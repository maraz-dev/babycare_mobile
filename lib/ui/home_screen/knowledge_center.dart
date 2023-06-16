import 'package:flutter/material.dart';
import 'package:hephzibah/common/commons.dart';
import 'package:hephzibah/ui/home_screen/settings.dart';
import 'package:hephzibah/ui/home_screen/widgets/knowledgeCenterWidget.dart';
class KnowledgeCenter extends StatelessWidget {
  const KnowledgeCenter({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Knowledge Center', style: headerText.copyWith(color: Colors.black, fontSize: 18),),
        actions: [
          IconButton(onPressed: null, icon: Icon(Icons.search))
        ],
        elevation: 0.0,
        backgroundColor: Colors.white,
        leading: IconButton(icon: Icon(Icons.arrow_back, color: Colors.black,), onPressed: () {  },),
      ),
      body: Container(
        padding: EdgeInsets.symmetric(horizontal: 20, vertical: 20),
        child: ListView(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text('Articles', style: normalText.copyWith(fontSize: 18),),
                Text('See All', style: normalText.copyWith(fontSize: 12),),
              ],
            ),
            KnowledgeCenterWidget(press: () => Navigator.push(context, MaterialPageRoute(builder: (context) => const Settings())),),
            KnowledgeCenterWidget(),
            KnowledgeCenterWidget(),
          ],
        ),
      ),
    );
  }
}
