import 'package:flutter/material.dart';
import 'package:meditation_app/common/color_extension.dart';

class TabButton extends StatelessWidget {
  final String icon;
  final String title;
  final bool isSelect;
  final VoidCallback onPressed;

  const TabButton(
      {super.key,
      required this.icon,
      required this.title,
      required this.isSelect,
      required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return InkWell(
        onTap: onPressed,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
              width: 44,
              height: 44,
              decoration: BoxDecoration(
                  color: isSelect
                      ? const Color.fromARGB(255, 154, 213, 199)
                      : const Color.fromARGB(75, 152, 255, 234),
                  borderRadius: BorderRadius.circular(15)),
              alignment: Alignment.center,
              child: Image.asset(
                icon,
                width: 30,
                height: 30,
                color: isSelect
                    ? Colors.black
                    : const Color.fromARGB(255, 120, 218, 198),
              ),
            ),
            const SizedBox(
              height: 4,
            ),
            Text(
              title,
              style: TextStyle(
                  color: isSelect
                      ? const Color.fromARGB(255, 253, 255, 254)
                      : Tcolor.primary,
                  fontSize: 20,
                  fontWeight: FontWeight.w600),
            )
          ],
        ));
  }
}
