import 'package:fitpulse/src/presentation/widgets/custom_button.dart';
import 'package:flutter/material.dart';

import '../widgets/text_formfield_fit_pulse.dart';

class ResetPasswordPage extends StatelessWidget {
  const ResetPasswordPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      bottomSheet: BottomSheet(
        enableDrag: true,
        onClosing: () {},
        builder: (context) {
          return LayoutBuilder(
            builder: (_, constraints) {
              return Container(
                height: 310,
                // width: constraints.maxWidth,
                decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(35),
                      topRight: Radius.circular(35)),
                ),
                padding:
                    const EdgeInsets.symmetric(horizontal: 50, vertical: 10),
                child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      const SizedBox(height: 25),
                      const Text(
                        'Reset Password',
                        style: TextStyle(
                            // 'Inter',
                            fontSize: 32,
                            fontWeight: FontWeight.w600,
                            height: 1.2125,
                            color: Colors.black),
                      ),
                      const SizedBox(height: 37),
                      const TextFormFieldPulse(
                          hintText: 'Email', icon: Icon(Icons.alternate_email)),
                      const SizedBox(height: 37),
                      DocsUploadThemedButton(
                          onTap: () {},
                          text: 'Continue',
                          fontSize: 16,
                          height: 55,
                          showArrow: false,
                          hMargin: 0),
                      const SizedBox(height: 2),
                    ],
                  ),
                ),
              );
            },
          );
        },
      ),
      body: Stack(
        children: [
          Align(
            heightFactor: 1,
            child: Image.asset(
              'assets/images/create_account.png',
              width: double.infinity,
              fit: BoxFit.cover,
            ),
          ),
          const Align(
            // alignment: Alignment.center,
            heightFactor: 6.7,
            child: Text(
              'FitPulse',
              style: TextStyle(
                fontFamily: 'Outfit',
                fontSize: 48,
                fontWeight: FontWeight.w600,
                height: 1.26,
                color: Color(0xffffffff),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
