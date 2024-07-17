import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intersemestral_fime/data/api_controller.dart';
import 'package:intersemestral_fime/pages/student/components/subject_button.dart';
import 'package:intersemestral_fime/pages/student/student_content.dart';
import 'package:intersemestral_fime/props/subject_props.dart';
import 'package:intersemestral_fime/utils/layout_selection.dart';

class TeacherHomePage extends StatefulWidget {
  final List<int> subjects;
  const TeacherHomePage({super.key, required this.subjects});

  @override
  _TeacherHomePageState createState() => _TeacherHomePageState();
}

class _TeacherHomePageState extends State<TeacherHomePage> {
  final ApiController api = ApiController();
  List<SubjectProps> _subjects = [];

  @override
  void initState() {
    super.initState();
    _subjects = api
        .getSubjectsbyIds(widget.subjects)
        .map((e) => SubjectProps(e.id, e.image, e.text))
        .toList();
  }

  @override
  Widget build(BuildContext context) {
    return SelectionLayout(
      child: Column(
        children: [
          Row(
            children: [
              Flexible(
                fit: FlexFit.tight,
                child: Column(children: [
                  SizedBox(
                      width: 250,
                      child: Text("Materias",
                          textAlign: TextAlign.center,
                          style: GoogleFonts.montserrat(
                              fontSize: 40,
                              fontWeight: FontWeight.w900,
                              color: const Color.fromRGBO(0, 89, 4, 1))))
                ]),
              ),
            ],
          ),
          const SizedBox(height: 10),
          Expanded(
            child: ListView.builder(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              scrollDirection: Axis.vertical,
              itemCount: _subjects.length,
              itemBuilder: (context, index) {
                final item = _subjects[index];
                return Padding(
                  padding: const EdgeInsets.only(bottom: 20),
                  child: SubjectButton(
                    image: item.image,
                    text: item.text,
                    fontSize: 22,
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) =>
                                StudentContentPage(subject: _subjects[index])),
                      );
                    },
                  ),
                );
              },
            ),
          )
        ],
      ),
    );
  }
}
