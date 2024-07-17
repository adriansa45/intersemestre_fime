import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intersemestral_fime/utils/layout_content.dart';

import 'components/content_topic.dart';

class TeacherTopicPage extends StatefulWidget {
  final dynamic topicProps;
  TeacherTopicPage({super.key, required this.topicProps});

  @override
  _TeacherTopicPageState createState() => _TeacherTopicPageState();
}

class _TeacherTopicPageState extends State<TeacherTopicPage> {
  final content = [
    {
      "type": 1,
      "url": "https://docs.flutter.dev/assets/images/dash/dash-fainting.gif"
    },
    {
      "type": 0,
      "text": "sadasd kqwejkas dasdkj aljkweaksd qlwjeqwlke alsjdalk "
    },
    {
      "type": 2,
      "url": "https://docs.flutter.dev/assets/images/dash/dash-fainting.gif"
    }
  ];
  @override
  Widget build(BuildContext context) {
    return ContentLayout(
      child: Column(
        children: [
          Row(
            children: [
              Flexible(
                fit: FlexFit.tight,
                child: Column(children: [
                  SizedBox(
                      width: 200,
                      child: Text(widget.topicProps["description"],
                          textAlign: TextAlign.center,
                          maxLines: 3,
                          style: GoogleFonts.montserrat(
                              fontSize: 30,
                              fontWeight: FontWeight.w900,
                              color: const Color.fromRGBO(0, 89, 4, 1))))
                ]),
              ),
            ],
          ),
          const SizedBox(height: 10),
          SingleChildScrollView(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                children: List.generate(
                  content.length,
                  (i) => Padding(
                      padding: const EdgeInsets.only(bottom: 10),
                      child: ContentTopic(
                        content: content[i],
                      )),
                ),
              ))
        ],
      ),
    );
  }
}
