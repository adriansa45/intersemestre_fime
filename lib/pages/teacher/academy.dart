import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intersemestral_fime/components/button_with_image.dart';
import 'package:intersemestral_fime/components/empty_message.dart';
import 'package:intersemestral_fime/components/search_input.dart';
import 'package:intersemestral_fime/pages/teacher/subjects.dart';
import 'package:intersemestral_fime/props/subject_props.dart';
import 'package:intersemestral_fime/utils/layout_selection.dart';

class TeacherAcademyPage extends StatefulWidget {
  final int department;
  const TeacherAcademyPage({super.key, required this.department});

  @override
  _TeacherAcademyPageState createState() => _TeacherAcademyPageState();
}

class _TeacherAcademyPageState extends State<TeacherAcademyPage> {
  final TextEditingController _searchController = TextEditingController();
  final _academy1 = [
    GenericProps(
        1,
        "https://loopgk.com/wp-content/uploads/2021/02/lenguaje-min.jpg",
        "Programación"),
    GenericProps(
        2,
        "https://worldcampus.saintleo.edu/img/article/ventajas-informatica-empresas.webp",
        "Informática"),
    GenericProps(
        3,
        "https://concepto.de/wp-content/uploads/2015/08/informatica-programas-e1590712084966.jpg",
        "Software de base"),
    GenericProps(
        4,
        "https://www.profesionalreview.com/wp-content/uploads/2022/06/Tachyum-anuncia-una-CPU-de-128-nucleos-con-57-GHz-y-950-W-TDP_2.jpg",
        "Arquitectura de computadoras y redes"),
    GenericProps(
        5,
        "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcT_MwYhJZO7wXIzpFqbIolSO1NQMZRaiuzd2ZQNRnAsJNUs7bTQ6nDDEMD9Cd8QPIokob0&usqp=CAU",
        "Desarrollo de tecnología de la información"),
  ];

  List<GenericProps> _academies = [];
  List<GenericProps> _filteredStudyPlans = [];

  @override
  void initState() {
    _academies = widget.department == 2 ? _academy1 : [];
    _filteredStudyPlans = _academies;
    _searchController.addListener(_filterStudyPlans);
    super.initState();
  }

  void _filterStudyPlans() {
    final query = _searchController.text.toLowerCase();
    setState(() {
      _filteredStudyPlans = _academies.where((plan) {
        return plan.text.toLowerCase().contains(query);
      }).toList();
    });
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
                      child: Text("Selecciona una academia",
                          textAlign: TextAlign.center,
                          style: GoogleFonts.montserrat(
                              fontSize: 28,
                              fontWeight: FontWeight.w900,
                              color: const Color.fromRGBO(0, 89, 4, 1))))
                ]),
              ),
            ],
          ),
          const SizedBox(height: 10),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: SearchInput(controller: _searchController),
          ),
          const SizedBox(height: 10),
          Expanded(
            child: _academies.isEmpty
                ? EmptyMessage()
                : ListView.builder(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    scrollDirection: Axis.vertical,
                    itemCount: _filteredStudyPlans.length,
                    itemBuilder: (context, index) {
                      final item = _filteredStudyPlans[index];
                      return Padding(
                        padding: const EdgeInsets.only(bottom: 20),
                        child: ButtonWithImage(
                          image: item.image,
                          text: item.text,
                          fontSize: 20,
                          imageHeight: 100,
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) =>
                                      TeacherSubjectsPage(academy: item.id)),
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
