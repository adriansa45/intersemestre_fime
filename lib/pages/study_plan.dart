import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';


class StudyPlanPage extends StatefulWidget {
  const StudyPlanPage({super.key});

  @override
  _StudyPlanPageState createState() => _StudyPlanPageState();
}

class _StudyPlanPageState extends State<StudyPlanPage> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          // Container(
          //   decoration: const BoxDecoration(
          //     gradient: LinearGradient(
          //       colors: [
          //         Color.fromRGBO(234, 234, 234, 1),
          //         Color.fromRGBO(112, 177, 144, 1)
          //       ],
          //       begin: Alignment.topCenter,
          //       end: Alignment.bottomCenter,
          //     ),
          //   )),
// Suggested code may be subject to a license. Learn more: ~LicenseLog:1381605455.
            Container(
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage("assets/vector.png"),
                alignment: Alignment.topLeft,
                scale: 0.1
              ),
            ),
          ),
        ],
      )
    );
  }
}
