import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intersemestral_fime/utils/layout_content.dart';

class StudentTopicPage extends StatefulWidget {
  final dynamic topicProps;
  StudentTopicPage({super.key, required this.topicProps});

  @override
  _StudentTopicPageState createState() => _StudentTopicPageState();
}

class _StudentTopicPageState extends State<StudentTopicPage> {
  final content = [
    {"type": 3, "text": "¿Qué es una base de datos?"},
    {
      "type": 1,
      "url":
          "https://www.grupoftp.com/noticias/wp-content/uploads/2015/09/bases-de-datos-empresas.png"
    },
    {
      "type": 0,
      "text":
          "Una base de datos es un almacén generalmente estructurado que permite establecer conexiones lógicas entre los datos. Los softwares que permiten este tipo de tarea es denominado Sistema Gestor de Base de Datos (SGBD)."
    },
    {"type": 3, "text": "Transacciones"},
    {
      "type": 0,
      "text":
          "Una transacción es un conjunto de órdenes que se ejecutan formando una unidad de trabajo, es decir, en forma indivisible o atómica. Garantiza que todas las operaciones dentro de la transacción se completen con éxito antes de que los cambios se confirmen en la base de datos. Una transacción debe cumplir con las propiedades ACID."
    },
    {"type": 3, "text": "ACID"},
    {
      "type": 1,
      "url": "https://gravitar.biz/wp-content/uploads/2022/10/acid.jpg"
    },
    {
      "type": 0,
      "text":
          "ACID es un conjunto de propiedades que garantizan que las transacciones en una base de datos se procesen de manera confiable. Las propiedades son Atomicidad, Consistencia, Aislamiento y Durabilidad."
    },
    {"type": 3, "text": "Control de concurrencia"},
    {
      "type": 1,
      "url":
          "https://media.es.wired.com/photos/63e55ba0bc755c9a2a93f629/3:2/w_3000,h_2000,c_limit/semaforo%20cuarto%20color%20inteligencia%20artificial.jpg"
    },
    {
      "type": 0,
      "text":
          "El control de concurrencia es un mecanismo utilizado en bases de datos para asegurar que múltiples transacciones puedan ocurrir simultáneamente sin interferir entre ellas."
    },
    {"type": 3, "text": "Control de concurrencia con métodos de bloqueo"},
    {
      "type": 0,
      "text":
          "Los métodos de bloqueo implican el uso de bloqueos para controlar el acceso a los datos durante las transacciones. Los bloqueos pueden ser compartidos o exclusivos."
    },
    {
      "type": 3,
      "text": "Control de concurrencia con métodos de impresión de hora"
    },
    {
      "type": 0,
      "text":
          "Los métodos de impresión de hora asignan una marca de tiempo a cada transacción para determinar el orden en el que deben ejecutarse. Esto ayuda a evitar conflictos y asegurar la consistencia."
    },
    {"type": 3, "text": "Control de concurrencia con métodos optimistas"},
    {
      "type": 0,
      "text":
          "Los métodos optimistas asumen que los conflictos son raros y permiten que las transacciones se ejecuten sin restricciones hasta que intenten confirmar sus cambios. Si se detecta un conflicto en ese momento, la transacción se reinicia."
    }
  ];
  @override
  Widget build(BuildContext context) {
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
          Expanded(
            child: SingleChildScrollView(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Column(
                  children: List.generate(
                    content.length,
                    (i) => Padding(
                        padding: const EdgeInsets.only(bottom: 10),
                        child: ContentTopic(
                          content: content[i],
                        )),
                  ),
                )),
          )
        ],
      ),
    );
  }
}

class ContentTopic extends StatelessWidget {
  final dynamic content;

  ContentTopic({super.key, required this.content});

  @override
  Widget build(BuildContext context) {
    switch (content["type"]) {
      case 0:
        return Text(
          content["text"],
          textAlign: TextAlign.justify,
          style: GoogleFonts.montserrat(
            fontSize: 16,
            fontWeight: FontWeight.w500,
          ),
        );
      case 1:
        return ClipRRect(
            borderRadius: const BorderRadius.all(Radius.circular(24)),
            child: Image.network(content["url"], fit: BoxFit.fitWidth));
      case 2:
        return ClipRRect(
            borderRadius: const BorderRadius.all(Radius.circular(24)),
            child: Image.network(content["url"], fit: BoxFit.fitWidth));
      case 3:
        return Text(
          content["text"],
          textAlign: TextAlign.center,
          style: GoogleFonts.montserrat(
              fontSize: 24,
              fontWeight: FontWeight.w700,
              color: const Color.fromRGBO(0, 89, 4, 1)),
        );
    }
    return const SizedBox();
  }
}
