import 'package:flutter/material.dart';

class DocsUploadThemedButton extends StatelessWidget {
  final String text;
  final VoidCallback onTap;
  final Color bgColor, textColor;
  final double tMargin, bMargin, hMargin;
  final double height;
  final double fontSize;
  final bool showArrow, showUpload, border;
  const DocsUploadThemedButton({
    super.key,
    required this.onTap,
    required this.text,
    this.bgColor = Colors.black,
    this.textColor = Colors.white,
    this.tMargin = 0,
    this.bMargin = 0,
    this.height = 40,
    this.hMargin = 25,
    this.showArrow = true,
    this.showUpload = false,
    this.border = false,
    required this.fontSize,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        margin: EdgeInsets.only(
            left: hMargin, right: hMargin, top: tMargin, bottom: bMargin),
        height: height,
        decoration: BoxDecoration(
          color: bgColor,
          borderRadius: BorderRadius.circular(35),
          border: border ? Border.all(color: Colors.black) : null,
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Row(
              // mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  text,
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: textColor,
                    fontSize: fontSize,
                  ),
                ),
                if (showArrow)
                  const Padding(
                    padding: EdgeInsets.only(left: 8),
                    child: Icon(
                      Icons.arrow_forward_ios,
                      size: 10,
                      color: Colors.white,
                    ),
                  )
              ],
            ),
          ],
        ),
      ),
    );
  }
}




// import 'package:flutter/material.dart';

// class MenuThemedButton extends StatelessWidget {
//   final String text;
//   final VoidCallback onTap;
//   final Color color;
//   final double tMargin, bMargin;
//   const MenuThemedButton({
//     super.key,
//     required this.onTap,
//     required this.text,
//     this.color = Colors.black,
//     this.tMargin = 0,
//     this.bMargin = 0,
//   });

//   @override
//   Widget build(BuildContext context) {
//     return GestureDetector(
//       onTap: onTap,
//       child: Container(
//         margin: EdgeInsets.only(top: tMargin, bottom: bMargin),
//         height: 40,
//         decoration: BoxDecoration(
//           color: color,
//           borderRadius: BorderRadius.circular(30),
//         ),
//         child: Row(
//           mainAxisSize: MainAxisSize.min,
//           children: [
//             const SizedBox(width: 35),
//             Text(
//               text,
//               textAlign: TextAlign.center,
//               style: const TextStyle(
//                 fontSize: 16,
//                 fontWeight: FontWeight.w700,
//               ),
//             ),
//             const SizedBox(width: 35),
//           ],
//         ),
//       ),
//     );
//   }
// }
