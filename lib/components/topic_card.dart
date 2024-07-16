import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class TopicProps {
  String title;
  String description;
  int type;
  final VoidCallback? onPressed;
  TopicProps(this.title, this.description, this.type, this.onPressed);
}

class TopicsCard extends StatelessWidget {
  final String title;
  final List<TopicProps> topics;
  TopicsCard({super.key, required this.title, required this.topics});

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
                                  SizedBox(width: 10),
                                  Flexible(
                                    child: Text(topics[i].description,
                                        maxLines: 3,
                                        overflow: TextOverflow.ellipsis,
                                        style: GoogleFonts.montserrat(
                                          color: const Color.fromRGBO(
                                              49, 49, 49, 1),
                                          fontSize: 15,
                                          fontWeight: FontWeight.w600,
                                        )),
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
