import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intersemestral_fime/components/button_with_image.dart';
import 'package:intersemestral_fime/pages/academy.dart';
import 'package:intersemestral_fime/utils/layout_selection.dart';

class DepartamentPage extends StatelessWidget {
  final String plan;
  DepartamentPage({super.key, required this.plan});

  final List<ButtonProps> studyPlans = [
    ButtonProps("https://picsum.photos/250?image=9", "Administración"),
    ButtonProps("https://picsum.photos/250?image=9", "Sistemas"),
    ButtonProps("https://picsum.photos/250?image=9", "Manufactura")
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
                    text: plan + item.text,
                    fontSize: 22,
                    imageHeight: 150,
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => AcademyPage()),
                      );
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
