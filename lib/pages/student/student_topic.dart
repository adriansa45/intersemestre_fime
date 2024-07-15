import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intersemestral_fime/utils/layout_content.dart';

class StudentTopicPage extends StatefulWidget {
  final dynamic topicProps;
  StudentTopicPage({super.key, required this.topicProps});

  @override
  _StudentTopicPageState createState() => _StudentTopicPageState();
}

class _StudentTopicPageState extends State<StudentTopicPage> {
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

class ContentTopic extends StatelessWidget {
  final dynamic content;

  ContentTopic({super.key, required this.content});

  @override
  Widget build(BuildContext context) {
    switch (content["type"]) {
      case 0:
        return Text(
          content["text"],
          textAlign: TextAlign.justify,
          style: GoogleFonts.montserrat(
            fontSize: 16,
            fontWeight: FontWeight.w500,
          ),
        );
      case 1:
        return ClipRRect(
            borderRadius: const BorderRadius.all(Radius.circular(24)),
            child: Image.network(content["url"], fit: BoxFit.fitWidth));
      case 2:
        return ClipRRect(
            borderRadius: const BorderRadius.all(Radius.circular(24)),
            child: Image.network(content["url"], fit: BoxFit.fitWidth));
    }
    return const SizedBox();
  }
}
