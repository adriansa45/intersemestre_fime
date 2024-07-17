import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ButtonToggle extends StatefulWidget {
  final String image;
  final String text;
  final double? imageHeight;
  final double? fontSize;
  final VoidCallback? onPressed;
  final bool? isPressed;

  const ButtonToggle(
      {super.key,
      required this.image,
      required this.text,
      this.imageHeight,
      this.fontSize,
      this.onPressed,
      this.isPressed});

  @override
  _ButtonToggleState createState() => _ButtonToggleState();
}

class _ButtonToggleState extends State<ButtonToggle> {
  bool _isPressed = false;

  @override
  void initState() {
    _isPressed = widget.isPressed ?? false;
    super.initState();
  }

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
          color: _isPressed ? Theme.of(context).primaryColor : Colors.white,
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
              height: 70,
              child: Center(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: Text(
                    widget.text,
                    textAlign: TextAlign.center,
                    style: GoogleFonts.montserrat(
                      color: _isPressed
                          ? Colors.white
                          : const Color.fromRGBO(46, 46, 46, 1),
                      fontSize: widget.fontSize,
                      fontWeight: FontWeight.w700,
                    ),
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
