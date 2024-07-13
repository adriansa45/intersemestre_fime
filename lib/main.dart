import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intersemestral_fime/pages/login/login.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  final Widget firstPage = const LoginPage();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        useMaterial3: true,
        colorScheme: ColorScheme.fromSeed(
          seedColor: const Color.fromRGBO(0, 137, 5, 1),
          primary: const Color.fromRGBO(0, 137, 5, 1),
          secondary: const Color.fromRGBO(0, 89, 4, 1),
        ),
        textTheme: TextTheme(
          titleMedium: GoogleFonts.montserrat(),
        ),
        appBarTheme: const AppBarTheme(
          color: Color.fromRGBO(46, 46, 46, 100),
        ),
      ),
      home: firstPage,
    );
  }
}
