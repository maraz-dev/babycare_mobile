import 'package:flutter/material.dart';
import '../../../../../../common/commons.dart';
import 'widgets/knowledgeCenterWidget.dart';

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
            const SizedBox(height: 20),
            const KnowledgeCenterWidget(
              image: "https://img.youtube.com/vi/15lI2QT61Ro/sddefault.jpg",
              title: "The First Trimester--Weeks 1-13!",
              description:
                  "Week by Week Pregnancy Guide and Pregnancy Vlog with an OB/GYN & Pediatrician",
              link:
                  "https://www.youtube.com/watch?v=15lI2QT61Ro&list=PLYMcLHAKovpGoRS6RkitJTa0iAP51hCRp",
            ),
            const SizedBox(height: 20),
            const KnowledgeCenterWidget(
              image: "https://img.youtube.com/vi/Rnd68avWFK0/sddefault.jpg",
              title: "The Second Trimester--Weeks 14- 28!",
              description:
                  "Choosing a Doctor for Your Baby: A Pregnancy MUST DO!",
              link:
                  "https://www.youtube.com/watch?v=Rnd68avWFK0&list=PLYMcLHAKovpF4Y7-gVqF0zrcucay5SR1z",
            ),
            const SizedBox(height: 20),
            const KnowledgeCenterWidget(
              image: "https://img.youtube.com/vi/pSQlV5XAZqQ/sddefault.jpg",
              title: "The Third Trimester--Weeks 28-40!",
              description:
                  "Am I In Labor? -- What are Braxton Hicks, what does labor look like, and when to call your OB?",
              link:
                  "https://www.youtube.com/watch?v=pSQlV5XAZqQ&list=PLYMcLHAKovpEQ0XOO87920A2hSxpF95LC",
            ),
            const SizedBox(height: 20),
            const KnowledgeCenterWidget(
              image: "https://img.youtube.com/vi/81dQFYIJP60/sddefault.jpg",
              title: "Vlogs",
              description:
                  "What I Wish I Knew About the First Trimester | OB-GYN Pregnancy VLOG",
              link:
                  "https://www.youtube.com/watch?v=81dQFYIJP60&list=PLYMcLHAKovpHTaFk2zZqx9ubpF4_uC3_O",
            ),
            const SizedBox(height: 20),
            const KnowledgeCenterWidget(
              image: "https://img.youtube.com/vi/fqRYHXtT9lk/sddefault.jpg",
              title: "Antenatal Exercises… Keep Fit!",
              description:
                  "Antenatal Exercise / exercises can do during pregnancy",
              link: "https://www.youtube.com/watch?v=fqRYHXtT9lk",
            ),
            const SizedBox(height: 20),
            const KnowledgeCenterWidget(
              image: "https://img.youtube.com/vi/scGB5LEnxI4/sddefault.jpg",
              title: "Sleeping Positions",
              description:
                  "Wrong Sleeping Positions For Pregnant Women Harm the Fetus | Best Sleeping Position during Pregnancy",
              link: "https://www.youtube.com/watch?v=scGB5LEnxI4",
            ),
            const SizedBox(height: 20),
            const KnowledgeCenterWidget(
              image: "https://img.youtube.com/vi/WH9ZJu4wRUE/sddefault.jpg",
              title: "Fetal Development",
              description:
                  "9 Months In The Womb: A Remarkable Look At Fetal Development Through Ultrasound",
              link: "https://www.youtube.com/watch?v=WH9ZJu4wRUE",
            ),
            const SizedBox(height: 20),
          ],
        ),
      ),
    );
  }
}
