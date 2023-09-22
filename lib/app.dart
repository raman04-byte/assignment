import 'package:assignment/routing/name_routes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'routing/router.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      
      getPages: AppRouting().getPages(),
      initialRoute: NamesRoutes.event_detail,
      theme: ThemeData(fontFamily: GoogleFonts.inter().fontFamily),
      locale: const Locale("en_US"),
    );
  }
}