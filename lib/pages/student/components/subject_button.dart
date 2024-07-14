import 'package:flutter/material.dart';

class SubjectButton extends StatefulWidget {
  final String image;
  final String text;
  final double? fontSize;
  final VoidCallback? onPressed;

  const SubjectButton(
      {Key? key,
      required this.image,
      required this.text,
      this.fontSize,
      this.onPressed})
      : super(key: key);

  @override
  _SubjectButtonState createState() => _SubjectButtonState();
}

class _SubjectButtonState extends State<SubjectButton> {
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
          color: _isPressed ? Colors.grey[300] : Colors.white,
          boxShadow: _isPressed
              ? []
              : [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.5),
                    spreadRadius: 5,
                    blurRadius: 7,
                    offset: Offset(0, 3), // changes position of shadow
                  ),
                ],
        ),
        child: ClipRRect(
          borderRadius: const BorderRadius.all(Radius.circular(24)),
          child: Column(
            children: [
              Row(
                children: [
                  SizedBox(
                      height: 100,
                      width: 100,
                      child: Image.network(
                        widget.image,
                        fit: BoxFit.cover,
                      )),
                  const SizedBox(width: 20),
                  Flexible(
                    fit: FlexFit.loose,
                    child: Container(
                      padding: const EdgeInsets.symmetric(horizontal: 10),
                      child: Text(widget.text,
                          textAlign: TextAlign.center,
                          maxLines: 3,
                          overflow: TextOverflow.ellipsis,
                          style: TextStyle(
                            color: const Color.fromRGBO(46, 46, 46, 1),
                            fontSize: widget.fontSize,
                            fontWeight: FontWeight.w700,
                          )),
                    ),
                  )
                ],
              ),
              SizedBox(
                height: 30,
                child: Center(
                  child: Container(
                    width: double.infinity,
                    height: double.infinity,
                    decoration: const BoxDecoration(
                        color: Color.fromRGBO(0, 134, 5, 1)),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 15.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Flexible(
                            child: Text(
                              widget.text,
                              overflow: TextOverflow.ellipsis,
                              maxLines: 1,
                              textAlign: TextAlign.center,
                              style: const TextStyle(
                                color: Colors.white,
                                fontSize: 16,
                                fontWeight: FontWeight.w700,
                              ),
                            ),
                          ),
                          const SizedBox(
                            width: 60,
                            child: Text(
                              "10%",
                              maxLines: 1,
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 16,
                                fontWeight: FontWeight.w700,
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
