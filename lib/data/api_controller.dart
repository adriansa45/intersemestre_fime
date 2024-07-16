import 'package:intersemestral_fime/props/subject_props.dart';

class ApiController {
  final List<SubjectProps> _subjects2 = [
    SubjectProps(
        1,
        "https://cdn.goconqr.com/uploads/media/image/18950434/desktop_fd4cbb17-7620-4f5e-a2f4-57129438ee1a.jpg",
        "Algoritmos computacionales"),
    SubjectProps(
        2,
        "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRcphQtKJm6cIuZvIdzFdfXNH-B9OrfFQv8-A&s",
        "Estructura de datos"),
    SubjectProps(
        3,
        "https://miro.medium.com/max/1082/1*qME4HpbNX-E52HWeVJjVeA.png",
        "Programación estructurada de datos"),
    SubjectProps(
        4,
        "https://static.vecteezy.com/system/resources/thumbnails/009/316/889/small/database-icon-logo-illustration-database-storage-symbol-template-for-graphic-and-web-design-collection-free-vector.jpg",
        "Base de datos y lenguajes"),
    SubjectProps(
        5,
        "https://weezevent.com/wp-content/uploads/2023/01/24180343/organiser-conference.jpg",
        "Seminario de sistemas I"),
    SubjectProps(
        6,
        "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTcVQkx7DUy3ubkCBe95t_SAbPfEgzx3NiGxQ&s",
        "Seminario de sistemas II"),
    SubjectProps(
        7,
        "https://seminarioiiuntref.wordpress.com/wp-content/uploads/2020/11/image-27.png",
        "Sitemas de información"),
    SubjectProps(
        8,
        "https://solocodigoweb.com/wp-content/uploads/2018/09/buenas_practicas_administrar_base_datos_produccion.png",
        "Administración de base de datos"),
    SubjectProps(
        9,
        "https://20784592.fs1.hubspotusercontent-na1.net/hubfs/20784592/00%20Blog/08%20Sistemas%20Inteligentes/mainbanner.jpg",
        "Temas selectos de sistemas inteligentes"),
    SubjectProps(
        10,
        "https://stemporium.blog/wp-content/uploads/2023/04/3311485_orig.gif",
        "Teoría de la información y métodos de condicación"),
    SubjectProps(
        11,
        "https://www.xeridia.com/wp-content/uploads/drupal-files/contenidos/blog/capas_neurona_artificial.jpg",
        "Redes neuronales artificales"),
  ];

  List<SubjectProps> getSubjects(int academy) {
    return academy == 2 ? _subjects2 : [];
  }

  List<SubjectProps> getSubjectsbyIds(List<int> ids) {
    return _subjects2.where((subject) => ids.contains(subject.id)).toList();
  }
}
