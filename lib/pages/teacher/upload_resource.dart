import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:file_picker/file_picker.dart';
import 'package:http_parser/http_parser.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intersemestral_fime/components/button_primary.dart';
import 'package:intersemestral_fime/data/api_controller.dart';
import 'package:intersemestral_fime/pages/teacher/components/input_dropdown.dart';
import 'package:intersemestral_fime/pages/teacher/components/input_text.dart';
import 'package:intersemestral_fime/props/subject_props.dart';
import 'package:intersemestral_fime/utils/layout_content.dart';
import 'package:intersemestral_fime/utils/modal.dart';
import 'package:intersemestral_fime/utils/modalAction.dart';
import 'package:mime/mime.dart';

class UploadResourcePage extends StatefulWidget {
  final SubjectProps subject;
  UploadResourcePage({super.key, required this.subject});

  @override
  _UploadResourcePageState createState() => _UploadResourcePageState();
}

class _UploadResourcePageState extends State<UploadResourcePage> {
  final ApiController api = ApiController();
  final TextEditingController _textController = TextEditingController();
  String _typeText = '';

  String _selectedFilePath = '';
  String _selectedFileName = '';

  Future<void> _pickFile() async {
    FilePickerResult? result = await FilePicker.platform.pickFiles();

    if (result != null) {
      setState(() {
        _selectedFilePath = result.files.single.path!;
        _selectedFileName = result.files.single.name;
      });
    }
  }

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    Future<void> uploadFile() async {
      if (_selectedFilePath == null) {
        print("No file selected");
        return;
      }

      var uri = Uri.parse(
          'https://intersemestre-api.vercel.app/api/resources/${widget.subject.id}'); // Cambia 1 por el subject_id adecuado
      var request = http.MultipartRequest('POST', uri);

      // Obtén el tipo de contenido del archivo
      String? mimeType = lookupMimeType(_selectedFilePath);

      // Añadir el archivo con el tipo de contenido especificado
      request.files.add(
        await http.MultipartFile.fromPath(
          'file',
          _selectedFilePath,
          contentType: MediaType.parse(mimeType ?? 'application/octet-stream'),
        ),
      );

      request.fields['type'] =
          _typeText == "Archivo" ? "1" : "0"; // Cambia esto según sea necesario
      request.fields['name'] =
          _textController.text; // Cambia esto según sea necesario

      request.headers['Content-Type'] = mimeType ?? 'application/octet-stream';
      var response = await request.send();

      if (response.statusCode == 200) {
        var responseBody = await response.stream.bytesToString();
        var jsonResponse = jsonDecode(responseBody);

        showDialog(
            context: context,
            builder: (context) {
              return ModalAction(
                title: "Exitoso",
                body: Text("Archivo guardado exitosamente!"),
                footer: SizedBox(),
                onClose: () {
                  Navigator.pop(context);
                },
              );
            });

        print('File uploaded successfully: $jsonResponse');
      } else {
        showDialog(
            context: context,
            builder: (context) {
              return ModalAction(
                title: "Ocurrió un error",
                body: Text("El archivo no se pudo guardar exitosamente."),
                footer: SizedBox(),
                onClose: () {
                  print("HOLA YES");
                },
              );
            });
      }
    }

    return ContentLayout(
      child: SingleChildScrollView(
        child: Column(
          children: [
            Row(
              children: [
                Flexible(
                  fit: FlexFit.tight,
                  child: Column(children: [
                    SizedBox(
                        width: 250,
                        child: Text("Cargar recurso",
                            textAlign: TextAlign.center,
                            style: GoogleFonts.montserrat(
                                fontSize: 40,
                                fontWeight: FontWeight.w900,
                                color: const Color.fromRGBO(0, 89, 4, 1)))),
                  ]),
                ),
              ],
            ),
            const SizedBox(height: 20),
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: Container(
                  width: double.maxFinite,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(24),
                      color: Colors.white,
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey.withOpacity(0.5),
                          spreadRadius: 5,
                          blurRadius: 7,
                          offset:
                              const Offset(0, 3), // changes position of shadow
                        ),
                      ]),
                  child: Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: Container(
                      child: Column(
                        children: [
                          Text("Nuevo recurso",
                              style: GoogleFonts.montserrat(
                                color: const Color.fromRGBO(49, 49, 49, 1),
                                fontSize: 16,
                                fontWeight: FontWeight.w700,
                              )),
                          Container(
                            child: Padding(
                              padding: const EdgeInsets.only(
                                  top: 10, left: 10, right: 10),
                              child: Column(
                                children: [
                                  InputText(
                                      controller: _textController,
                                      placeholder: "Nombre del recurso..."),
                                  SizedBox(height: 20),
                                  InputDropdown(
                                      list: ['Archivo', 'Video'],
                                      value: 'Archivo',
                                      onChanged: (value) {
                                        setState(() {
                                          _typeText = value!;
                                        });
                                      }),
                                  SizedBox(height: 20),
                                  GestureDetector(
                                    onTap: _pickFile,
                                    child: Container(
                                      width: double.infinity,
                                      decoration: const BoxDecoration(
                                          color:
                                              Color.fromRGBO(240, 240, 240, 1),
                                          borderRadius: BorderRadius.all(
                                              Radius.circular(24))),
                                      child: SizedBox(
                                          height: 200,
                                          child: Padding(
                                            padding: const EdgeInsets.all(20.0),
                                            child: Column(
                                              mainAxisAlignment:
                                                  MainAxisAlignment
                                                      .spaceBetween,
                                              children: [
                                                Text(
                                                  "Selecciona una archivo",
                                                  style: GoogleFonts.montserrat(
                                                    color: const Color.fromRGBO(
                                                        46, 46, 46, 1),
                                                    fontSize: 16,
                                                    fontWeight: FontWeight.w700,
                                                  ),
                                                  textAlign: TextAlign.center,
                                                ),
                                                Text(_selectedFileName,
                                                    textAlign: TextAlign.center)
                                              ],
                                            ),
                                          )),
                                    ),
                                  )
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  )),
            ),
            SizedBox(
                height: 50,
                width: 350,
                child: ButtonPrimary(
                    text: "Cargar", active: true, onPressed: uploadFile))
          ],
        ),
      ),
    );
  }
}
