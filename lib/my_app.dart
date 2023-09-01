import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:imcapp/pages/imc_app.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
            primarySwatch: Colors.blue,
            textTheme: GoogleFonts.robotoTextTheme()),
        home: const AppImc(),
      ),
    );
  }
}
