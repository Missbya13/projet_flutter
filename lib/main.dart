import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:projet_flutter_dar23_aby/presentation/bindings/app_bindings.dart';
import 'package:projet_flutter_dar23_aby/routes.dart';

void main() {
  runApp(const MyApp());
}

//Ce projet a été réalisé en respectant le modèle 'Clean Architecture' et MVVM
class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: "My Flutter Meteo App",
      initialRoute: MyRoutes.home,
      initialBinding: AppBindings(),
      getPages: MyRoutes.routes,
    );
  }
}
