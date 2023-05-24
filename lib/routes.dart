//
import 'package:get/get.dart';
import 'package:projet_flutter_dar23_aby/presentation/screens/home_screen.dart';
import 'package:projet_flutter_dar23_aby/presentation/screens/meteo_screen.dart';

class MyRoutes {
  static const String home = "/";
  static const String meteo = "/meteo";

  static List<GetPage> get routes => [
        GetPage(name: home, page: () => const HomeScreen()),
        GetPage(name: meteo, page: () => const MetoScreen()),
      ];
}
