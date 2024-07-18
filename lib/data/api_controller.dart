import 'package:intersemestral_fime/props/subject_props.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

const baseurl = 'https://intersemestre-api.vercel.app/api';

class ResponseAPI {
  final bool success;
  final String message;
  final dynamic data;

  ResponseAPI(this.success, this.message, this.data);
}

class ApiController {
  final List<SubjectProps> _subjects2 = [
    SubjectProps(
        1,
        "https://cdn.goconqr.com/uploads/media/image/18950434/desktop_fd4cbb17-7620-4f5e-a2f4-57129438ee1a.jpg",
        "Algoritmos computacionales",
        2),
    SubjectProps(
        2,
        "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRcphQtKJm6cIuZvIdzFdfXNH-B9OrfFQv8-A&s",
        "Estructura de datos",
        2),
    SubjectProps(
        3,
        "https://miro.medium.com/max/1082/1*qME4HpbNX-E52HWeVJjVeA.png",
        "Programación estructurada de datos",
        2),
    SubjectProps(
        4,
        "https://static.vecteezy.com/system/resources/thumbnails/009/316/889/small/database-icon-logo-illustration-database-storage-symbol-template-for-graphic-and-web-design-collection-free-vector.jpg",
        "Base de datos y lenguajes",
        2),
    SubjectProps(
        5,
        "https://weezevent.com/wp-content/uploads/2023/01/24180343/organiser-conference.jpg",
        "Seminario de sistemas I",
        2),
    SubjectProps(
        6,
        "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTcVQkx7DUy3ubkCBe95t_SAbPfEgzx3NiGxQ&s",
        "Seminario de sistemas II",
        2),
    SubjectProps(
        7,
        "https://seminarioiiuntref.wordpress.com/wp-content/uploads/2020/11/image-27.png",
        "Sitemas de información",
        2),
    SubjectProps(
        8,
        "https://solocodigoweb.com/wp-content/uploads/2018/09/buenas_practicas_administrar_base_datos_produccion.png",
        "Administración de base de datos",
        2),
    SubjectProps(
        9,
        "https://20784592.fs1.hubspotusercontent-na1.net/hubfs/20784592/00%20Blog/08%20Sistemas%20Inteligentes/mainbanner.jpg",
        "Temas selectos de sistemas inteligentes",
        2),
    SubjectProps(
        10,
        "https://stemporium.blog/wp-content/uploads/2023/04/3311485_orig.gif",
        "Teoría de la información y métodos de condicación",
        2),
    SubjectProps(
        11,
        "https://www.xeridia.com/wp-content/uploads/drupal-files/contenidos/blog/capas_neurona_artificial.jpg",
        "Redes neuronales artificales",
        2),
  ];

  Future<List<dynamic>> fetchResources(String subjectId) async {
    final url = Uri.parse('$baseurl/resources/$subjectId');
    try {
      final response = await http.get(url);

      if (response.statusCode == 200) {
        final List<dynamic> topics = jsonDecode(response.body);
        return topics;
      }
    } catch (e) {
      print('Error occurred: $e');
    }
    return [];
  }

  Future<List<dynamic>> fetchTopics(String subjectId) async {
    final url = Uri.parse('$baseurl/topics/$subjectId');
    try {
      final response = await http.get(url);

      if (response.statusCode == 200) {
        final List<dynamic> topics = jsonDecode(response.body);
        return topics;
      }
    } catch (e) {
      print('Error occurred: $e');
    }
    return [];
  }

  List<SubjectProps> getSubjects(int academy) {
    return academy == 2 ? _subjects2 : [];
  }

  Future<List<SubjectProps>> fetchSubjects() async {
    const String url = '$baseurl/subjects';

    try {
      final response = await http.get(Uri.parse(url));

      if (response.statusCode == 200) {
        List<dynamic> jsonResponse = json.decode(response.body);
        return jsonResponse.map((json) => SubjectProps.fromJson(json)).toList();
      }
    } catch (error) {
      print('Error 0: $error');
    }
    return [];
  }

  List<SubjectProps> getSubjectsbyIds(List<int> ids) {
    return _subjects2.where((subject) => ids.contains(subject.id)).toList();
  }

  Future<ResponseAPI> login(
      String type, String username, String password) async {
    final url = '$baseurl/login';

    final headers = {
      'Content-Type': 'application/json',
    };

    // Crear el cuerpo de la solicitud
    final body = jsonEncode({
      'type': type,
      'username': username,
      'password': password,
    });
    try {
      final response = await http.post(
        Uri.parse(url),
        headers: headers,
        body: body,
      );

      bool success = response.statusCode == 200;
      if (success) {
        return ResponseAPI(success, "Inicio de sesión exitoso", {});
      } else {
        return ResponseAPI(
            false, "Acceso Negado, verifica los datos de acceso.", {});
      }
    } catch (e) {
      return ResponseAPI(
          false, "Acceso Negado, verifica los datos de acceso.", {});
    }
  }
}
