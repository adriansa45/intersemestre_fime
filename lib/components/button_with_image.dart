import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ButtonProps {
  final String image;
  final String text;

  ButtonProps(this.image, this.text);
}

class ButtonWithImage extends StatefulWidget {
  final String image;
  final String text;
  final double? imageHeight;
  final double? fontSize;
  final VoidCallback? onPressed;

  const ButtonWithImage(
      {super.key,
      required this.image,
      required this.text,
      this.imageHeight,
      this.fontSize,
      this.onPressed});

  @override
  _ButtonWithImageState createState() => _ButtonWithImageState();
}

class _ButtonWithImageState extends State<ButtonWithImage> {
  bool _isPressed = false;

  void _togglePressed() {
    setState(() {
      _isPressed = !_isPressed;
    });
    if (widget.onPressed != null) {
      widget.onPressed!();
    }
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: _togglePressed,
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 200),
        curve: Curves.easeInOut,
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
          ],
        ),
        child: Column(
          children: [
            SizedBox(
              height: widget.imageHeight,
              width: double.infinity,
              child: ClipRRect(
                borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(24),
                    topRight: Radius.circular(24)),
                child: Image.network(
                  widget.image,
                  fit: BoxFit.fitWidth,
                ),
              ),
            ),
            SizedBox(
              height: 60,
              child: Center(
                child: Text(
                  widget.text,
                  textAlign: TextAlign.center,
                  style: GoogleFonts.montserrat(
                    color: const Color.fromRGBO(46, 46, 46, 1),
                    fontSize: widget.fontSize,
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
