import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../const.dart';
import '../widgets/text_formfield_fit_pulse.dart';

class UpdateProfilePage extends StatelessWidget {
  const UpdateProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        leading: const Icon(Icons.arrow_back_rounded, color: Colors.black),
        backgroundColor: Colors.transparent,
        title: Text(
          'Update Profile',
          style: textStyle.copyWith(fontSize: 24),
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 50, vertical: 10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const SizedBox(
                height: 40,
              ),
              Stack(
                children: [
                  Container(
                    height: 150,
                    width: 150,
                    decoration: BoxDecoration(
                        border: Border.all(
                            width: 4, color: const Color(0xffeceff5)),
                        shape: BoxShape.circle,
                        color: const Color(0xffF7F7F7)),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(100),
                      child: const Icon(
                        Icons.person,
                        size: 90,
                        color: Colors.black,
                      ),
                    ),
                  ),
                  Positioned(
                    bottom: 10,
                    right: 3,
                    child: Container(
                      height: 35,
                      width: 35,
                      decoration: BoxDecoration(
                          border: Border.all(
                              width: 3, color: const Color(0xffeceff5)),
                          shape: BoxShape.circle,
                          color: const Color(0xffF7F7F7)),
                      child: GestureDetector(
                        onTap: () {},
                        child: const Icon(Icons.edit,
                            size: 20, color: Colors.black),
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 37,
              ),
              TextFormFieldPulse(
                  textFieldController: TextEditingController(),
                  hintText: 'Name',
                  icon: const Icon(Icons.person)),
              const SizedBox(
                height: 15,
              ),
              TextFormFieldPulse(
                textFieldController: TextEditingController(),
                hintText: 'Age',
                icon: SvgPicture.asset('assets/svg/age.svg',
                    colorFilter: const ColorFilter.mode(
                        Color(0xffADB6C1), BlendMode.srcIn)),
              ),
              const SizedBox(
                height: 15,
              ),
              TextFormFieldPulse(
                textFieldController: TextEditingController(),
                hintText: 'Gender',
                icon: SvgPicture.asset('assets/svg/gender.svg',
                    colorFilter: const ColorFilter.mode(
                        Color(0xffADB6C1), BlendMode.srcIn)),
              ),
              const SizedBox(
                height: 15,
              ),
              TextFormFieldPulse(
                  textFieldController: TextEditingController(),
                  hintText: 'Weight',
                  icon: const Icon(Icons.monitor_weight)),
              const SizedBox(
                height: 15,
              ),
              TextFormFieldPulse(
                textFieldController: TextEditingController(),
                hintText: 'Height',
                icon: SvgPicture.asset('assets/svg/height.svg',
                    colorFilter: const ColorFilter.mode(
                        Color(0xffADB6C1), BlendMode.srcIn)),
              ),
              const SizedBox(
                height: 37,
              ),
              // DocsUploadThemedButton(
              //     onTap: () {},
              //     text: 'Save',
              //     fontSize: 16,
              //     height: 55,
              //     showArrow: false,
              //     hMargin: 0),
              const SizedBox(height: 2),
            ],
          ),
        ),
      ),
    );
  }
}
