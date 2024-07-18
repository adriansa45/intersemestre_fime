import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intersemestral_fime/pages/teacher/components/edit_box.dart';
import 'package:intersemestral_fime/utils/layout_content.dart';

import 'components/content_topic.dart';

class TeacherTopicPage extends StatefulWidget {
  final dynamic topicProps;
  TeacherTopicPage({super.key, required this.topicProps});

  @override
  _TeacherTopicPageState createState() => _TeacherTopicPageState();
}

class _TeacherTopicPageState extends State<TeacherTopicPage> {
  @override
  Widget build(BuildContext context) {
    print(widget.topicProps["content"]);
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
                      child: Text("Contenido",
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
          const SizedBox(height: 30),
          Expanded(
            child: SingleChildScrollView(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Column(
                  children: List.generate(
                    widget.topicProps["content"] != null
                        ? widget.topicProps["content"].length
                        : 0,
                    (i) => Padding(
                        padding: const EdgeInsets.only(bottom: 10),
                        child: EditBox(
                          onPressedEdit: () {
                            print("hola");
                          },
                          child: Padding(
                            padding: const EdgeInsets.all(15.0),
                            child: ContentTopic(
                                content: widget.topicProps["content"][i]),
                          ),
                        )),
                  ),
                )),
          )
        ],
      ),
    );
  }
}
