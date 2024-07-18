import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intersemestral_fime/components/button_primary.dart';
import 'package:intersemestral_fime/components/resource_card.dart';
import 'package:intersemestral_fime/components/topic_card.dart';
import 'package:collection/collection.dart';
import 'package:intersemestral_fime/data/api_controller.dart';
import 'package:intersemestral_fime/pages/student/student_topic.dart';
import 'package:intersemestral_fime/props/subject_props.dart';
import 'package:intersemestral_fime/utils/layout_content.dart';

class StudentContentPage extends StatefulWidget {
  final SubjectProps subject;
  StudentContentPage({super.key, required this.subject});

  @override
  _StudentContentPageState createState() => _StudentContentPageState();
}

class _StudentContentPageState extends State<StudentContentPage> {
  final ApiController api = ApiController();
  int currentTab = 0;
  Map<String, dynamic> subjectContent = {
    "content": [
      {"name": "Medio Curso", "subjects": []},
      {"name": "Ordinario", "subjects": []}
    ],
    "resources": []
  };

  @override
  void initState() {
    currentTab = 0;
    _loadData();
    super.initState();
  }

  _loadData() async {
    List<dynamic> topics = await api.fetchTopics(widget.subject.id.toString());

    List<dynamic> resources =
        await api.fetchResources(widget.subject.id.toString());

    subjectContent["content"][0]["subjects"] = topics.take(2).toList();
    subjectContent["content"][1]["subjects"] = topics.skip(2).toList();

    subjectContent["resources"] = resources;
    setState(() {
      currentTab = currentTab;
    });
  }

  void selectTab(int tab) {
    setState(() {
      currentTab = tab;
    });
  }

  Widget getCurrentTab() {
    switch (currentTab) {
      case 0:
        return SubjectTab(content: subjectContent["content"]);
      case 1:
        return ResourcesTab(resources: subjectContent["resources"]);
      default:
        return SubjectTab(content: subjectContent["content"]);
    }
  }

  @override
  void dispose() {
    super.dispose();
  }

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
                      width: 250,
                      child: Text("Contenido",
                          textAlign: TextAlign.center,
                          style: GoogleFonts.montserrat(
                              fontSize: 40,
                              fontWeight: FontWeight.w900,
                              color: const Color.fromRGBO(0, 89, 4, 1)))),
                  const SizedBox(height: 20),
                  SizedBox(
                      width: 320,
                      child: Text(widget.subject.text,
                          textAlign: TextAlign.center,
                          maxLines: 3,
                          style: GoogleFonts.montserrat(
                              fontSize: 26,
                              fontWeight: FontWeight.w900,
                              color: const Color.fromRGBO(0, 89, 4, 1))))
                ]),
              ),
            ],
          ),
          const SizedBox(height: 10),
          SizedBox(
            height: 50,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ButtonPrimary(
                  text: "Temas",
                  active: currentTab == 0,
                  onPressed: () => {selectTab(0)},
                ),
                const SizedBox(width: 20),
                ButtonPrimary(
                  text: "Recursos",
                  active: currentTab == 1,
                  onPressed: () => {selectTab(1)},
                )
              ],
            ),
          ),
          const SizedBox(height: 10),
          Expanded(
            child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20.0),
                child: getCurrentTab()),
          )
        ],
      ),
    );
  }
}

class SubjectTab extends StatelessWidget {
  final List<dynamic> content;
  SubjectTab({super.key, required this.content});
  int topicsIndex = 1;

  @override
  Widget build(BuildContext context) {
    List<TopicProps> getTopics(List<dynamic> subjects) {
      return subjects
          .mapIndexed(
              (i, e) => TopicProps("Tema ${topicsIndex++}", e["name"], 0, () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => StudentTopicPage(topicProps: {
                                "id": e["topic_id"],
                                "description": e["name"],
                                "content": e["content"]
                              })),
                    );
                  }))
          .toList();
    }

    return SingleChildScrollView(
      padding: const EdgeInsets.symmetric(horizontal: 0),
      child: Column(
        children: List.generate(
            content.length,
            (i) => Padding(
                  padding: const EdgeInsets.only(bottom: 20),
                  child: TopicsCard(
                      title: content[i]["name"],
                      topics: getTopics(content[i]["subjects"])),
                )),
      ),
    );
  }
}

class ResourcesTab extends StatelessWidget {
  final List<dynamic> resources;
  ResourcesTab({super.key, required this.resources});

  @override
  Widget build(BuildContext context) {
    final List<ResourceProps> topics = resources
        .mapIndexed((i, e) => ResourceProps(
            e["type"] == 0 ? "Video" : "Recurso",
            e["name"],
            0,
            e["url"] ?? "",
            () => {}))
        .toList();

    return SingleChildScrollView(
      padding: const EdgeInsets.symmetric(horizontal: 0),
      child: ResourceCard(title: "Recursos", topics: topics),
    );
  }
}
