import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:google_fonts/google_fonts.dart';
// import 'package:green_taxi/views/decision_screen/decission_screen.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:green_update/views/decision_screen/decission_screen.dart';
import 'controller/auth_controller.dart';
import 'firebase_options.dart';
void main()async{

  try {
    WidgetsFlutterBinding.ensureInitialized();
    await Firebase.initializeApp(
      // name: 'GreenUpdate',
      options: DefaultFirebaseOptions.currentPlatform,
    );
  }catch (e){
    print(e);
  }

  runApp( MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    AuthController authController = Get.put(AuthController());
    authController.decideRoute();
    final textTheme = Theme.of(context).textTheme;

    return  GetMaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        textTheme: GoogleFonts.poppinsTextTheme(textTheme),
      ),
      home:   DecisionScreen(),
    );
  }
}
