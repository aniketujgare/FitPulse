import 'package:flutter/material.dart';

class TextFormFieldPulse extends StatelessWidget {
  final String hintText;
  final Widget icon;
  final TextEditingController textFieldController;
  const TextFormFieldPulse({
    super.key,
    required this.hintText,
    required this.icon,
    required this.textFieldController,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      style: const TextStyle(color: Colors.black),
      controller: textFieldController,
      textAlign: TextAlign.start,
      decoration: InputDecoration(
        prefixIcon: icon,
        prefixIconColor: const Color(0xffADB6C1),
        prefixIconConstraints:
            const BoxConstraints(minHeight: 20, minWidth: 50),
        hintText: hintText,
        hintStyle: const TextStyle(
          color: Color(0xffADB6C1),
        ),
        filled: true,
        fillColor: const Color(0xffF7F7F7),
        focusColor: const Color(0xfff8f8f8),
        focusedBorder: OutlineInputBorder(
          borderSide: const BorderSide(color: Color(0xffeceff5)),
          borderRadius: BorderRadius.circular(15),
        ),
        enabledBorder: OutlineInputBorder(
          borderSide: const BorderSide(color: Color(0xffeceff5)),
          borderRadius: BorderRadius.circular(15),
        ),
      ),
    );
  }
}

class CustomTextField extends StatelessWidget {
  const CustomTextField({
    Key? key,
    required this.labelName,
    required this.onChanged,
    this.isObsecure = false,
    this.isObsecureIconVisible = false,
  }) : super(key: key);

  final bool isObsecure;
  final bool isObsecureIconVisible;
  final String labelName;
  final void Function(String)? onChanged;

  @override
  Widget build(BuildContext context) {
    bool showTextToggle = true;
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 6),
      child: TextField(
        onChanged: onChanged,
        obscureText: isObsecure && showTextToggle,
        decoration: InputDecoration(
          labelText: labelName,
          suffixIcon: Visibility(
            visible: isObsecureIconVisible,
            child: InkWell(
              onTap: () {
                showTextToggle = !showTextToggle;
              },
              child: const Icon(
                Icons.remove_red_eye,
                color: Colors.white,
                size: 25,
              ),
            ),
          ),
          labelStyle: const TextStyle(
            color: Color(0xffFFFBFE),
            fontSize: 14,
          ),
          filled: true,
          floatingLabelBehavior: FloatingLabelBehavior.auto,
          fillColor: const Color(0xffFFFBFE),
          enabledBorder: UnderlineInputBorder(
            borderRadius: BorderRadius.circular(8.0),
            borderSide: const BorderSide(color: Colors.transparent),
          ),
          focusedBorder: UnderlineInputBorder(
            borderRadius: BorderRadius.circular(8.0),
            borderSide: const BorderSide(color: Color(0xffFFFBFE)),
          ),
          contentPadding:
              const EdgeInsets.symmetric(vertical: 15.0, horizontal: 10.0),
        ),
      ),
    );
  }
}
