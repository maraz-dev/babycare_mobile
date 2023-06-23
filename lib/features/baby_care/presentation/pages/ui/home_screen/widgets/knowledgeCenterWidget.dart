import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../../../../../../common/commons.dart';

class KnowledgeCenterWidget extends StatelessWidget {
  const KnowledgeCenterWidget({
    Key? key,
    required this.image,
    required this.title,
    required this.description,
    required this.link,
  }) : super(key: key);
  final String image;
  final String title;
  final String description;
  final String link;

  @override
  Widget build(BuildContext context) {
    final websiteUri = Uri.parse(link);
    return InkWell(
      onTap: () async {
        if (await canLaunchUrl(websiteUri)) {
          await launchUrl(websiteUri);
        }
      },
      child: Stack(
        children: [
          Container(
            height: 168,
            //margin: EdgeInsets.symmetric(vertical: 0),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(5),
              image: DecorationImage(
                image: NetworkImage(
                  image,
                ),
                fit: BoxFit.cover,
              ),
            ),
          ),
          Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(5),
              color: Colors.black.withOpacity(0.5),
            ),
            height: 168,
            padding: const EdgeInsets.all(12),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  '12 Jul 2020',
                  style: normalText.copyWith(color: Colors.white, fontSize: 10),
                ),
                Spacer(),
                Text(
                  title,
                  style: headerText.copyWith(color: Colors.white, fontSize: 22),
                ),
                const SizedBox(height: 8),
                Text(
                  description,
                  style: normalText.copyWith(color: Colors.white, fontSize: 14),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
