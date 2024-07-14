import 'package:flutter/material.dart';

class SelectionLayout extends StatelessWidget {
  final Widget child;

  const SelectionLayout({super.key, required this.child});

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
              Color.fromRGBO(234, 234, 234, 1),
              Color.fromRGBO(112, 177, 144, 1)
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
                image: AssetImage("assets/bear1.png"),
                alignment: Alignment.topRight),
          ),
        ),
        Container(
            alignment: Alignment.bottomCenter,
            padding: const EdgeInsets.only(bottom: 25),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Image.asset(
                  "assets/SomosUNI.png",
                  height: 50,
                ),
                Image.asset(
                  "assets/vivelafime.png",
                  height: 50,
                )
              ],
            )),
        Container(
          padding: const EdgeInsets.only(top: 80),
          alignment: Alignment.topCenter,
          child: child,
        )
      ],
    ));
  }
}
