import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'components/capsule_button.dart';
import 'components/capsule_dropdown_menu.dart';
import 'components/capsule_password_field.dart';
import 'components/capsule_switch.dart';
import 'components/capsule_text_field.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final TextEditingController _textController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  String? _dropdownValue = 'Alumno';
  bool _switchValue = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage("assets/fime-fachada.png"),
                fit: BoxFit.fitHeight,
              ),
            ),
          ),
          Container(
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                colors: [
                  Color.fromRGBO(133, 192, 136, 0.5),
                  Color.fromRGBO(1, 59, 4, .8)
                ],
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
              ),
            ),
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Image.asset(
                    "assets/uanl-white.png",
                    height: 120,
                  ),
                  Image.asset("assets/fime-white.png", height: 130)
                ],
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text("Inicio sesión",
                        style: GoogleFonts.montserrat(
                            color: Colors.white,
                            fontSize: 30,
                            fontWeight: FontWeight.w600)),
                    const SizedBox(height: 25),
                    CapsuleDropdownMenu(
                      onChanged: (value) {
                        setState(() {
                          _dropdownValue = value;
                        });
                      },
                    ),
                    const SizedBox(height: 15),
                    CapsuleTextField(controller: _textController),
                    const SizedBox(height: 15),
                    CapsulePasswordField(controller: _passwordController),
                    const SizedBox(height: 15),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text("Recuérdame",
                            style: GoogleFonts.montserrat(
                                color: Colors.white, fontSize: 16)),
                        CapsuleSwitch(
                          onChanged: (value) {
                            setState(() {
                              _switchValue = value;
                            });
                          },
                        ),
                      ],
                    ),
                    const SizedBox(height: 15),
                    CapsuleButton(
                      text: 'Ingresar',
                      onPressed: () {
                        print('Dropdown Value: $_dropdownValue');
                        print('Text Value: ${_textController.text}');
                        print('Password Value: ${_passwordController.text}');
                        print('Switch Value: $_switchValue');
                      },
                    )
                  ],
                ),
              ),
              Row(
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
              )
            ],
          ),
        ],
      ),
    );
  }
}
