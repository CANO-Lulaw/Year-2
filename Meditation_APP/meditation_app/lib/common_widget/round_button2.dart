import 'package:flutter/material.dart';
import 'package:meditation_app/common/color_extension.dart';

enum RoundButtonType { primary, secondary }

class RoundButton2 extends StatefulWidget {
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
  _RoundButton2State createState() => _RoundButton2State();
}

class _RoundButton2State extends State<RoundButton2> {
  Color _buttonColor = Tcolor.primary;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(0, 0, 0, 0),
      child: InkWell(
        splashColor: const Color.fromARGB(255, 125, 160, 166).withOpacity(0.5),
        highlightColor: const Color.fromARGB(255, 45, 65, 72).withOpacity(0.3),
        onTap: () {
          setState(() {
            _buttonColor = const Color.fromARGB(255, 169, 216, 199);
          });

          Future.delayed(const Duration(milliseconds: 150), () {
            widget.onPressed();
          });
        },
        child: Material(
          color: _buttonColor,
          borderRadius: BorderRadius.circular(30),
          child: Container(
            width: widget.buttonWidth ?? double.maxFinite,
            height: widget.buttonHeight ?? 60,
            alignment: Alignment.center,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                if (widget.icon != null) ...[
                  widget.icon!,
                  const SizedBox(width: 10),
                ],
                Text(
                  widget.title,
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: widget.textcolor ??
                        (widget.type == RoundButtonType.primary
                            ? const Color.fromARGB(255, 216, 231, 226)
                            : Tcolor.textBG),
                    fontSize: widget.textSize,
                    fontWeight: FontWeight.w800,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
