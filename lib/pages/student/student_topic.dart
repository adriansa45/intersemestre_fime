import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intersemestral_fime/pages/teacher/components/edit_box.dart';
import 'package:intersemestral_fime/utils/layout_content.dart';

class StudentTopicPage extends StatefulWidget {
  final dynamic topicProps;
  StudentTopicPage({super.key, required this.topicProps});

  @override
  _StudentTopicPageState createState() => _StudentTopicPageState();
}

class _StudentTopicPageState extends State<StudentTopicPage> {
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
                        child: ContentTopic(
                          content: widget.topicProps["content"][i],
                        )),
                  ),
                )),
          )
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
      case 3:
        return Text(
          content["text"],
          textAlign: TextAlign.center,
          style: GoogleFonts.montserrat(
              fontSize: 24,
              fontWeight: FontWeight.w700,
              color: const Color.fromRGBO(0, 89, 4, 1)),
        );
    }
    return const SizedBox();
  }
}
