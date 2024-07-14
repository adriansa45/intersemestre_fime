import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intersemestral_fime/components/button_with_image.dart';
import 'package:intersemestral_fime/pages/student/components/subject_button.dart';
import 'package:intersemestral_fime/utils/layout_selection.dart';

class StudentHomePage extends StatefulWidget {
  StudentHomePage({super.key});

  @override
  _StudentHomePageState createState() => _StudentHomePageState();
}

class _StudentHomePageState extends State<StudentHomePage> {
  final TextEditingController _searchController = TextEditingController();
  final List<ButtonProps> subjects = [
    ButtonProps("https://picsum.photos/250?image=9",
        "Base de datos dasdaasd asdasdas asdasd asdasd asdasd asdas"),
    ButtonProps("https://docs.flutter.dev/assets/images/dash/dash-fainting.gif",
        "Estructura de datos"),
    ButtonProps("https://picsum.photos/250?image=5", "Manufactura")
  ];

  List<ButtonProps> _filteredSubjects = [];

  @override
  void initState() {
    super.initState();
    _filteredSubjects = subjects;
    _searchController.addListener(_filterStudyPlans);
  }

  void _filterStudyPlans() {
    final query = _searchController.text.toLowerCase();
    setState(() {
      _filteredSubjects = subjects.where((plan) {
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
                      child: Text("Contenido",
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
              itemCount: _filteredSubjects.length,
              itemBuilder: (context, index) {
                final item = _filteredSubjects[index];
                return Padding(
                  padding: const EdgeInsets.only(bottom: 20),
                  child: SubjectButton(
                    image: item.image,
                    text: item.text,
                    fontSize: 22,
                    onPressed: () {
                      print('Button ${item.text} pressed');
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
