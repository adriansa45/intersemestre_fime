import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intersemestral_fime/components/button_primary.dart';
import 'package:intersemestral_fime/pages/teacher/components/edit_box.dart';
import 'package:intersemestral_fime/pages/teacher/components/input_dropdown.dart';
import 'package:intersemestral_fime/pages/teacher/components/modal_section.dart';
import 'package:intersemestral_fime/pages/teacher/components/textarea_input.dart';
import 'package:intersemestral_fime/utils/layout_content.dart';

import 'components/content_topic.dart';

class TeacherTopicPage extends StatefulWidget {
  final dynamic topicProps;
  TeacherTopicPage({super.key, required this.topicProps});

  @override
  _TeacherTopicPageState createState() => _TeacherTopicPageState();
}

class _TeacherTopicPageState extends State<TeacherTopicPage> {
  List<dynamic> content = [];
  final TextEditingController _textController = TextEditingController();
  String? _typeText;

  _editContent(int index, dynamic editedSection) {
    setState(() {
      if (editedSection["text"] == "") {
        content.removeAt(index);
      } else {
        content[index] = editedSection;
      }
    });
  }

  _loadContent(int index, dynamic newSection) {
    setState(() {
      if (newSection["text"] == "" && newSection["url"]) {
        return;
      }
      if (content.isEmpty) {
        content.add(newSection);
      } else {
        content.insert(index + 1, newSection);
      }
    });
  }

  @override
  void initState() {
    super.initState();
    print(widget.topicProps);
    content = widget.topicProps["content"] ?? [];
  }

  @override
  Widget build(BuildContext context) {
    Future<void> _savecontent() async {
      final url = 'https://intersemestre-api.vercel.app/api/topics';

      final headers = {
        'Content-Type': 'application/json',
      };

      // Crear el cuerpo de la solicitud
      final body = jsonEncode({
        'topic_id': widget.topicProps["id"],
        'subject_id': 0,
        'content': content,
        'type': 0
      });
      try {
        final response = await http.put(
          Uri.parse(url),
          headers: headers,
          body: body,
        );

        if (response.statusCode == 200) {
          print("OK");
          return;
        }
      } catch (e) {
        return;
      }
      print("NOT OK");
    }

    return ContentLayout(
      child: Column(
        children: [
          Row(
            children: [
              Flexible(
                fit: FlexFit.tight,
                child: Column(children: [
                  SizedBox(
                      width: 200,
                      child: Text("Contenido",
                          textAlign: TextAlign.center,
                          maxLines: 3,
                          style: GoogleFonts.montserrat(
                              fontSize: 30,
                              fontWeight: FontWeight.w900,
                              color: const Color.fromRGBO(0, 89, 4, 1))))
                ]),
              ),
            ],
          ),
          const SizedBox(height: 30),
          Container(
            child: content.isEmpty
                ? GestureDetector(
                    onTap: () {
                      showDialog(
                          context: context,
                          builder: (context) {
                            _textController.text = "";
                            return ModalSection(
                              body: Column(
                                children: [
                                  InputDropdown(
                                    list: ['Texto', 'Imagen', 'Título'],
                                    value: 'Texto',
                                    onChanged: null,
                                  ),
                                  SizedBox(height: 20),
                                  InputTextarea(
                                      controller: _textController,
                                      placeholder: 'Escribe tu texto')
                                ],
                              ),
                              footer: SizedBox(),
                              currentSection: null,
                              onPressedSave: () {
                                int type = 0;
                                switch (_typeText) {
                                  case "Texto":
                                    type = 0;
                                    break;
                                  case "Imagen":
                                    type = 1;
                                    break;
                                  case "Título":
                                    type = 3;
                                    break;
                                }

                                _loadContent(0, {
                                  "type": type,
                                  "text": _textController.text,
                                  "url": _typeText == "Imagen"
                                      ? _textController.text
                                      : ""
                                });
                                Navigator.pop(context);
                              },
                            );
                          });
                    },
                    child: SizedBox(
                      height: 40,
                      width: 40,
                      child: Container(
                          alignment: Alignment.topRight,
                          decoration: const BoxDecoration(
                              color: Color.fromRGBO(217, 217, 217, 1),
                              borderRadius:
                                  BorderRadius.all(Radius.circular(50)),
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.black26,
                                  spreadRadius: 2,
                                  blurRadius: 5,
                                  offset: const Offset(
                                      0, 3), // changes position of shadow
                                ),
                              ]),
                          child: const Padding(
                            padding: EdgeInsets.all(8.0),
                            child: Icon(
                              Icons.add,
                              color: Color.fromRGBO(61, 61, 61, 1),
                            ),
                          )),
                    ),
                  )
                : SizedBox(
                    height: 600,
                    child: SingleChildScrollView(
                        padding: const EdgeInsets.symmetric(horizontal: 20),
                        child: Column(
                          children: List.generate(
                            content.length,
                            (i) => Column(
                              children: [
                                Padding(
                                    padding: const EdgeInsets.only(bottom: 5),
                                    child: EditBox(
                                      onPressedEdit: () {
                                        showDialog(
                                            context: context,
                                            builder: (context) {
                                              switch (content[i]["type"]) {
                                                case 0:
                                                  _typeText = "Texto";
                                                  break;
                                                case 1:
                                                  _typeText = "Imagen";
                                                  break;
                                                case 3:
                                                  _typeText = "Título";
                                                  break;
                                              }
                                              _textController.text = content[i]
                                                      ["text"] ??
                                                  content[i]["url"];

                                              return ModalSection(
                                                body: Column(
                                                  children: [
                                                    InputDropdown(
                                                      list: [
                                                        'Texto',
                                                        'Imagen',
                                                        'Título'
                                                      ],
                                                      value:
                                                          _typeText ?? "Texto",
                                                      onChanged: (value) {
                                                        setState(() {
                                                          _typeText = value;
                                                        });
                                                      },
                                                    ),
                                                    SizedBox(height: 20),
                                                    InputTextarea(
                                                        controller:
                                                            _textController,
                                                        placeholder:
                                                            'Escribe tu texto')
                                                  ],
                                                ),
                                                footer: SizedBox(),
                                                currentSection: {},
                                                onPressedSave: () {
                                                  int type = 0;
                                                  switch (_typeText) {
                                                    case "Texto":
                                                      type = 0;
                                                      break;
                                                    case "Imagen":
                                                      type = 1;
                                                      break;
                                                    case "Título":
                                                      type = 3;
                                                      break;
                                                  }

                                                  _editContent(i, {
                                                    "type": type,
                                                    "text":
                                                        _textController.text,
                                                    "url": _typeText == "Imagen"
                                                        ? _textController.text
                                                        : ""
                                                  });
                                                  Navigator.pop(context);
                                                },
                                              );
                                            });
                                      },
                                      child: Padding(
                                          padding: const EdgeInsets.all(15.0),
                                          child: ContentTopic(
                                              content: content[i],
                                              addButton: false)),
                                    )),
                                GestureDetector(
                                  onTap: () {
                                    showDialog(
                                        context: context,
                                        builder: (context) {
                                          _textController.text = "";
                                          return ModalSection(
                                            body: Column(
                                              children: [
                                                InputDropdown(
                                                  list: [
                                                    'Texto',
                                                    'Imagen',
                                                    'Título'
                                                  ],
                                                  value: 'Texto',
                                                  onChanged: null,
                                                ),
                                                SizedBox(height: 20),
                                                InputTextarea(
                                                    controller: _textController,
                                                    placeholder:
                                                        'Escribe tu texto')
                                              ],
                                            ),
                                            footer: SizedBox(),
                                            currentSection: null,
                                            onPressedSave: () {
                                              int type = 0;
                                              switch (_typeText) {
                                                case "Texto":
                                                  type = 0;
                                                  break;
                                                case "Imagen":
                                                  type = 1;
                                                  break;
                                                case "Título":
                                                  type = 3;
                                                  break;
                                              }

                                              _loadContent(i, {
                                                "type": type,
                                                "text": _textController.text,
                                                "url": _typeText == "Imagen"
                                                    ? _textController.text
                                                    : ""
                                              });
                                              Navigator.pop(context);
                                            },
                                          );
                                        });
                                  },
                                  child: SizedBox(
                                    height: 40,
                                    width: 40,
                                    child: Container(
                                        alignment: Alignment.topRight,
                                        decoration: const BoxDecoration(
                                            color: Color.fromRGBO(
                                                217, 217, 217, 1),
                                            borderRadius: BorderRadius.all(
                                                Radius.circular(50)),
                                            boxShadow: [
                                              BoxShadow(
                                                color: Colors.black26,
                                                spreadRadius: 2,
                                                blurRadius: 5,
                                                offset: const Offset(0,
                                                    3), // changes position of shadow
                                              ),
                                            ]),
                                        child: const Padding(
                                          padding: EdgeInsets.all(8.0),
                                          child: Icon(
                                            Icons.add,
                                            color:
                                                Color.fromRGBO(61, 61, 61, 1),
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
          const SizedBox(height: 20),
          SizedBox(
            height: 50,
            width: 350,
            child: ButtonPrimary(
                text: 'Guardar',
                active: true,
                onPressed: () {
                  Navigator.pop(context);
                  _savecontent();
                }),
          )
        ],
      ),
    );
  }
}
