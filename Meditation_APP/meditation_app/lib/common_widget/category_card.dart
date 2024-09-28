import 'package:flutter/material.dart';

class CategoryCrad extends StatefulWidget {
  final String picScr;
  final String title;
  final VoidCallback press;

  const CategoryCrad({
    super.key,
    required this.picScr,
    required this.title,
    required this.press,
  });

  @override
  _CategoryCradState createState() => _CategoryCradState();
}

class _CategoryCradState extends State<CategoryCrad> {
  Color _buttonColor = const Color.fromARGB(255, 64, 98, 98);

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(50),
      child: Container(
        decoration: BoxDecoration(
            color: _buttonColor,
            borderRadius: BorderRadius.circular(50),
            boxShadow: const [
              BoxShadow(
                offset: Offset(0, 17),
                blurRadius: 17,
                spreadRadius: -23,
                color: Colors.black,
              )
            ]),
        child: Material(
          color: Colors.transparent,
          child: InkWell(
            splashColor:
                const Color.fromARGB(255, 125, 160, 166).withOpacity(0.5),
            highlightColor:
                const Color.fromARGB(255, 45, 65, 72).withOpacity(0.3),
            onTap: () {
              setState(() {
                _buttonColor = const Color.fromARGB(255, 42, 79, 73);
              });

              Future.delayed(const Duration(milliseconds: 150), () {
                widget.press();
              });
            },
            child: Padding(
              padding: const EdgeInsets.all(20),
              child: Column(
                children: <Widget>[
                  const Spacer(),
                  Image.asset(
                    widget.picScr,
                    width: 40,
                    height: 40,
                    color: const Color.fromARGB(255, 170, 210, 207),
                  ),
                  Text(
                    widget.title,
                    textAlign: TextAlign.center,
                    style: const TextStyle(
                      fontSize: 25,
                      fontWeight: FontWeight.w700,
                      color: Color.fromARGB(255, 207, 249, 232),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
