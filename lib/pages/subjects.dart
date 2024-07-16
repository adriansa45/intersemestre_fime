import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intersemestral_fime/components/button_primary.dart';
import 'package:intersemestral_fime/components/button_toggle.dart';
import 'package:intersemestral_fime/components/empty_message.dart';
import 'package:intersemestral_fime/components/search_input.dart';
import 'package:intersemestral_fime/data/api_controller.dart';
import 'package:intersemestral_fime/pages/student/student_home.dart';
import 'package:intersemestral_fime/props/subject_props.dart';
import 'package:intersemestral_fime/utils/layout_selection.dart';

class SubjectsPage extends StatefulWidget {
  final int academy;

  SubjectsPage({super.key, required this.academy});

  @override
  _SubjectsPageState createState() => _SubjectsPageState();
}

class _SubjectsPageState extends State<SubjectsPage> {
  List<int> selectedSubjects = [];
  final ApiController api = ApiController();
  List<SubjectProps> _subjects = [];
  final TextEditingController _searchController = TextEditingController();

  List<SubjectProps> _filteredSubjects = [];

  @override
  void initState() {
    super.initState();
    _subjects = api.getSubjects(widget.academy);
    _filteredSubjects = _subjects;
    _searchController.addListener(_filterStudyPlans);
  }

  void _filterStudyPlans() {
    final query = _searchController.text.toLowerCase();
    setState(() {
      _filteredSubjects = _subjects.where((plan) {
        return plan.text.toLowerCase().contains(query);
      }).toList();
    });
  }

  void onTapButton(int id) {
    int index = selectedSubjects.indexOf(id);
    if (index == -1) {
      selectedSubjects.add(id);
    } else {
      selectedSubjects.removeAt(index);
    }
  }

  @override
  Widget build(BuildContext context) {
    void nextPage() {
      Navigator.push(
        context,
        MaterialPageRoute(
            builder: (context) => StudentHomePage(
                  subjects: selectedSubjects,
                )),
      );
    }

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
                      child: Text("Selecciona tus materias",
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
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: SearchInput(controller: _searchController),
          ),
          const SizedBox(height: 10),
          Expanded(
            child: _subjects.isEmpty
                ? EmptyMessage()
                : ListView.builder(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    scrollDirection: Axis.vertical,
                    itemCount: _filteredSubjects.length,
                    itemBuilder: (context, index) {
                      final item = _filteredSubjects[index];
                      return Padding(
                        padding: const EdgeInsets.only(bottom: 20),
                        child: ButtonToggle(
                          image: item.image,
                          text: item.text,
                          fontSize: 22,
                          imageHeight: 100,
                          isPressed: selectedSubjects.contains(item.id),
                          onPressed: () {
                            onTapButton(item.id);
                          },
                        ),
                      );
                    },
                  ),
          ),
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: SizedBox(
              width: double.infinity,
              height: 50,
              child: ButtonPrimary(
                  text: "Siguiente", active: true, onPressed: nextPage),
            ),
          )
        ],
      ),
    );
  }
}
