import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:intersemestral_fime/components/resource_card.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:google_fonts/google_fonts.dart';

class ResourceEditCard extends StatelessWidget {
  final String title;
  final List<ResourceProps> topics;
  ResourceEditCard({super.key, required this.title, required this.topics});

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
                        (i) => InkWell(
                              onTap: () => launchUrl(Uri.parse(topics[i].url)),
                              child: Padding(
                                padding: const EdgeInsets.only(bottom: 15),
                                child: Row(
                                  children: [
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
                                    SizedBox(
                                      width: 160,
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
                                    SizedBox(width: 10),
                                    GestureDetector(
                                      onTap: () {},
                                      child: SizedBox(
                                        height: 40,
                                        width: 40,
                                        child: Container(
                                            alignment: Alignment.topRight,
                                            decoration: const BoxDecoration(
                                                color: Color.fromRGBO(
                                                    217, 217, 217, 1),
                                                borderRadius: BorderRadius.all(
                                                    Radius.circular(12)),
                                                boxShadow: [
                                                  BoxShadow(
                                                    color: Colors.black12,
                                                    spreadRadius: 2,
                                                    blurRadius: 5,
                                                    offset: const Offset(0,
                                                        3), // changes position of shadow
                                                  ),
                                                ]),
                                            child: const Padding(
                                              padding: EdgeInsets.all(8.0),
                                              child: Icon(
                                                Icons.delete,
                                                color: Color.fromRGBO(
                                                    61, 61, 61, 1),
                                              ),
                                            )),
                                      ),
                                    )
                                  ],
                                ),
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
