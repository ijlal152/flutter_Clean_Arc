import 'package:exam_app/core/resources/colors.dart';
import 'package:exam_app/core/resources/fonts.dart';
import 'package:exam_app/core/services/injection_container.dart';
import 'package:exam_app/core/services/router.dart';
import 'package:flutter/material.dart';

Future<void> main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Educational App',
      theme: ThemeData(
        fontFamily: Fonts.poppins,
        visualDensity: VisualDensity.adaptivePlatformDensity,
        appBarTheme: const AppBarTheme(
          elevation: 0,
          color: Colors.transparent,
        ),
        colorScheme: ColorScheme.fromSwatch(accentColor: Colours.primaryColour),
        useMaterial3: true,
      ),
      onGenerateRoute: generateRoute,
    );
  }
}
