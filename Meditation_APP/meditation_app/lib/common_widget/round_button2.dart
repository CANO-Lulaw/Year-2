import 'package:flutter/material.dart';
import 'package:meditation_app/common/color_extension.dart';

enum RoundButtonType { primary, secondary }

class RoundButton2 extends StatelessWidget {
  final String title;
  final RoundButtonType type;
  final VoidCallback onPressed;
  final Widget? icon;
  final double textSize;
  final double? buttonWidth;
  final double? buttonHeight;
  final Color? textcolor; 
  final Color? buttoncolor; 

  const RoundButton2({
    super.key,
    required this.title,
    this.type = RoundButtonType.primary,
    required this.onPressed,
    this.icon,
    this.textSize = 40,
    this.buttonWidth,
    this.buttonHeight,
    this.textcolor, 
    this.buttoncolor, 
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(0, 0, 0, 0),
      child: MaterialButton(
        onPressed: onPressed,
        minWidth: buttonWidth ?? double.maxFinite,
        height: buttonHeight ?? 60,
        elevation: 0,
        color: buttoncolor ??
            (type == RoundButtonType.primary
                ? Tcolor.primary
                : Tcolor.secondary),
        shape: RoundedRectangleBorder(
          side: BorderSide.none,
          borderRadius: BorderRadius.circular(30),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            if (icon != null) ...[
              icon!,
              const SizedBox(width: 10),
            ],
            Text(
              title,
              textAlign: TextAlign.center,
              style: TextStyle(
                color: textcolor ??
                    (type == RoundButtonType.primary
                        ? const Color.fromARGB(255, 216, 231, 226)
                        : Tcolor.textBG),
                fontSize: textSize,
                fontWeight: FontWeight.w800,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
