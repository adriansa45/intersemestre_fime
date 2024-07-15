import 'package:flutter/material.dart';

class ContentLayout extends StatelessWidget {
  final Widget child;

  const ContentLayout({super.key, required this.child});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Stack(
      children: [
        Container(
            decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [
              Color.fromRGBO(234, 234, 234, 1),
              Color.fromRGBO(210, 210, 210, 1)
            ],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        )),
        Container(
          decoration: const BoxDecoration(
            image: DecorationImage(
                image: AssetImage("assets/vector.png"),
                alignment: Alignment.topLeft),
          ),
        ),
        Container(
          decoration: const BoxDecoration(
            image: DecorationImage(
                image: AssetImage("assets/bear2.png"),
                fit: BoxFit.fitWidth,
                alignment: Alignment.center),
          ),
        ),
        Container(
          padding: const EdgeInsets.only(top: 80),
          alignment: Alignment.topCenter,
          child: child,
        ),
        Container(
          alignment: Alignment.topRight,
          child: GestureDetector(
            onTap: () {
              print("back");
              Navigator.pop(context);
            },
            child: const Padding(
              padding: EdgeInsets.all(30.0),
              child: SizedBox(
                height: 45,
                width: 45,
                child: Icon(
                  Icons.arrow_back,
                  color: Color.fromRGBO(0, 86, 3, 1),
                  size: 45,
                ),
              ),
            ),
          ),
        ),
      ],
    ));
  }
}
