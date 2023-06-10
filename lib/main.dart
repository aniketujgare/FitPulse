import 'package:flutter/material.dart';
import 'package:dynamic_color/dynamic_color.dart';
import 'src/config/router/app_router.dart';
import 'src/config/themes/color_schemes.g.dart';
import 'src/config/themes/custom_color.g.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return DynamicColorBuilder(
      builder: (ColorScheme? lightDynamic, ColorScheme? darkDynamic) {
        ColorScheme lightScheme;
        ColorScheme darkScheme;

        if (lightDynamic != null && darkDynamic != null) {
          lightScheme = lightDynamic.harmonized();
          lightCustomColors = lightCustomColors.harmonized(lightScheme);

          // Repeat for the dark color scheme.
          darkScheme = darkDynamic.harmonized();
          darkCustomColors = darkCustomColors.harmonized(darkScheme);
        } else {
          // Otherwise, use fallback schemes.
          lightScheme = lightColorScheme;
          darkScheme = darkColorScheme;
        }

        return MaterialApp.router(
          debugShowCheckedModeBanner: false,
          routerConfig: GoRout().router,
          theme: ThemeData(
            useMaterial3: true,
            colorScheme: lightScheme,
            extensions: [lightCustomColors],
            fontFamily: 'Inter',
          ),
          darkTheme: ThemeData(
            useMaterial3: true,
            colorScheme: darkScheme,
            extensions: [darkCustomColors],
            fontFamily: 'Inter',
          ),
        );
      },
    );
  }
}
