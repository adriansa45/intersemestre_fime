import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intersemestral_fime/components/button_with_image.dart';
import 'package:intersemestral_fime/components/empty_message.dart';
import 'package:intersemestral_fime/pages/teacher/academy.dart';
import 'package:intersemestral_fime/props/subject_props.dart';
import 'package:intersemestral_fime/utils/layout_selection.dart';

class TeacherDepartamentPage extends StatefulWidget {
  final int plan;
  const TeacherDepartamentPage({super.key, required this.plan});

  @override
  _TeacherDepartamentPageState createState() => _TeacherDepartamentPageState();
}

class _TeacherDepartamentPageState extends State<TeacherDepartamentPage> {
  final _departaments401 = [
    GenericProps(
        1,
        "https://www.uhipocrates.edu.mx/wp-content/uploads/2022/12/empresarios-manos-sobre-mesa-blanca-con-documentos-y-borradores.jpg",
        "Administración"),
    GenericProps(
        2,
        "https://www.getxplor.com/wp-content/uploads/2024/01/Ejemplos-de-sistemas-de-informacion.jpg",
        "Sistemas"),
    GenericProps(
        3,
        "https://cdn.forbes.com.mx/2015/01/manufacturas-eu-e1629911498545.jpg",
        "Manufactura")
  ];

  List<GenericProps> departaments = [];

  @override
  void initState() {
    departaments = widget.plan == 401 ? _departaments401 : [];
    super.initState();
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
                      child: Text("Selecciona un departamento académico",
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
            child: departaments.isEmpty
                ? EmptyMessage()
                : ListView.builder(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    scrollDirection: Axis.vertical,
                    itemCount: departaments.length,
                    itemBuilder: (context, index) {
                      final item = departaments[index];
                      return Padding(
                        padding: const EdgeInsets.only(bottom: 20),
                        child: ButtonWithImage(
                          image: item.image,
                          text: item.text,
                          fontSize: 22,
                          imageHeight: 150,
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => TeacherAcademyPage(
                                        department: item.id,
                                      )),
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
