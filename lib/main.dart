import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:mexpertztest/core/app_text.dart';
import 'package:mexpertztest/database/db.dart';
import 'package:mexpertztest/firebase/firebase_options.dart';
import 'package:mexpertztest/routes/all_pages.dart';
import 'package:mexpertztest/routes/routes.dart';
import 'package:mexpertztest/theme/colors.dart';
import 'package:mexpertztest/theme/fonts.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  await AppPreferences.instance.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: KAppText.appName,
      theme: ThemeData(
        fontFamily: FF.lato,
        colorScheme: ColorScheme.fromSeed(seedColor: KAppColor.primaryColor),
        useMaterial3: true,
      ),
      getPages: allPages,
      initialRoute: Routes.splash,
    );
  }
}
