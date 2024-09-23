import 'package:flutter/material.dart';
import 'package:meditation_app/common/color_extension.dart';

enum RoundButtonType { primary, secondary }

class RoundButton extends StatelessWidget {
  final String title;
  final RoundButtonType type;
  final VoidCallback onPressed;
  final Widget? icon;
  final double textSize; // เพิ่มพารามิเตอร์ใหม่สำหรับขนาดข้อความ

  const RoundButton({
    super.key,
    required this.title,
    this.type = RoundButtonType.primary,
    required this.onPressed,
    this.icon,
    this.textSize = 40, // กำหนดค่าเริ่มต้นสำหรับขนาดข้อความ
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: MaterialButton(
        onPressed: onPressed,
        minWidth: double.maxFinite,
        elevation: 0,
        color:
            type == RoundButtonType.primary ? Tcolor.primary : Tcolor.secondary,
        height: 60,
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
                color: type == RoundButtonType.primary
                    ? const Color.fromARGB(255, 216, 231, 226)
                    : Tcolor.textBG,
                fontSize: textSize, // ใช้พารามิเตอร์ textSize ที่กำหนด
                fontWeight: FontWeight.w800,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
