import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class TopicEditableProps {
  String title;
  String description;
  int type;
  final VoidCallback? onPressed;
  final VoidCallback? onPressedEdit;
  TopicEditableProps(this.title, this.description, this.type, this.onPressed,
      this.onPressedEdit);
}

class TopicEditableCard extends StatelessWidget {
  final String title;
  final List<dynamic> topics;
  TopicEditableCard({super.key, required this.title, required this.topics});

  @override
  Widget build(BuildContext context) {
    return Container(
        width: double.maxFinite,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(24),
            color: Colors.white,
            boxShadow: [
              BoxShadow(
                color: Colors.grey.withOpacity(0.5),
                spreadRadius: 5,
                blurRadius: 7,
                offset: const Offset(0, 3), // changes position of shadow
              ),
            ]),
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Column(
            children: [
              Text(title,
                  style: GoogleFonts.montserrat(
                    color: const Color.fromRGBO(49, 49, 49, 1),
                    fontSize: 16,
                    fontWeight: FontWeight.w700,
                  )),
              Container(
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(12),
                    color: Color.fromRGBO(243, 243, 243, 1)),
                child: Padding(
                  padding: const EdgeInsets.only(top: 10, left: 10, right: 10),
                  child: Column(
                    children: List.generate(
                        topics.length,
                        (i) => GestureDetector(
                              onTap: topics[i].onPressed,
                              child: Padding(
                                padding: const EdgeInsets.only(bottom: 15),
                                child: Row(children: [
                                  SizedBox(
                                    width: 90,
                                    child: Text(topics[i].title,
                                        style: GoogleFonts.montserrat(
                                          color: const Color.fromRGBO(
                                              0, 134, 5, 1),
                                          fontSize: 16,
                                          fontWeight: FontWeight.w700,
                                        )),
                                  ),
                                  const SizedBox(width: 10),
                                  Expanded(
                                    child: Row(
                                      children: [
                                        Expanded(
                                          child: Text(topics[i].description,
                                              maxLines: 4,
                                              overflow: TextOverflow.ellipsis,
                                              style: GoogleFonts.montserrat(
                                                color: const Color.fromRGBO(
                                                    49, 49, 49, 1),
                                                fontSize: 15,
                                                fontWeight: FontWeight.w600,
                                              )),
                                        ),
                                        GestureDetector(
                                          onTap: topics[i].onPressedEdit,
                                          child: Container(
                                              decoration: const BoxDecoration(
                                                  color: Color.fromRGBO(
                                                      217, 217, 217, 1),
                                                  borderRadius:
                                                      BorderRadius.all(
                                                          Radius.circular(12))),
                                              child: const Padding(
                                                padding: EdgeInsets.all(8.0),
                                                child: Icon(Icons.edit,
                                                    color: Color.fromRGBO(
                                                        61, 61, 61, 1)),
                                              )),
                                        )
                                      ],
                                    ),
                                  )
                                ]),
                              ),
                            )),
                  ),
                ),
              )
            ],
          ),
        ));
  }
}
