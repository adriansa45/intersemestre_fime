import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intersemestral_fime/components/button_with_image.dart';
import 'package:intersemestral_fime/pages/student/departament.dart';
import 'package:intersemestral_fime/props/subject_props.dart';
import 'package:intersemestral_fime/utils/layout_selection.dart';

class StudentStudyPlanPage extends StatelessWidget {
  StudentStudyPlanPage({super.key});

  final List<GenericProps> studyPlans = [
    GenericProps(
        401,
        "https://asesoriasuanl.com/wp-content/uploads/2021/06/FIMEv1-1.jpg",
        "Plan 401"),
    GenericProps(
        440,
        "https://www.fime.uanl.mx/wp-content/uploads/2021/11/FACHADA-scaled.jpg",
        "Plan 440 ")
  ];

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
                      width: 200,
                      child: Text("Selecciona tu plan de estudios",
                          textAlign: TextAlign.center,
                          style: GoogleFonts.montserrat(
                              fontSize: 30,
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
              itemCount: studyPlans.length,
              itemBuilder: (context, index) {
                final item = studyPlans[index];
                return Padding(
                  padding: const EdgeInsets.only(bottom: 20),
                  child: ButtonWithImage(
                    image: item.image,
                    text: item.text,
                    fontSize: 22,
                    imageHeight: 210,
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) =>
                                StudentDepartamentPage(plan: item.id)),
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
