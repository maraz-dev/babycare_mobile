import 'package:flutter/material.dart';
import 'package:hephzibah/common/commons.dart';
import 'package:hephzibah/features/baby_care/presentation/pages/ui/home_screen/widgets/knowledgeCenterWidget.dart';

class KnowledgeCenter extends StatelessWidget {
  const KnowledgeCenter({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Knowledge Center',
          style: headerText.copyWith(color: Colors.black, fontSize: 18),
        ),
        actions: [const IconButton(onPressed: null, icon: Icon(Icons.search))],
        elevation: 0.0,
        backgroundColor: Colors.white,
        leading: IconButton(
          icon: const Icon(
            Icons.arrow_back,
            color: Colors.black,
          ),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: Container(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
        child: ListView(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Articles',
                  style: normalText.copyWith(fontSize: 18),
                ),
                Text(
                  'See All',
                  style: normalText.copyWith(fontSize: 12),
                ),
              ],
            ),
            KnowledgeCenterWidget(
              press: () {
                // return Navigator.push(context,
                //     MaterialPageRoute(builder: (context) => const Settings()));
              },
            ),
            const KnowledgeCenterWidget(),
            const KnowledgeCenterWidget(),
          ],
        ),
      ),
    );
  }
}
