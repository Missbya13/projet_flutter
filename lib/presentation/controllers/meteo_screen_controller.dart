import 'dart:async';
import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:get/get.dart';

import '../../data/datasources/remote/api_service.dart';

class MeteoScreenController extends GetxController {
  final List<String> villes = ["Rennes", "Paris", "Nantes", "Bordeaux", "Lyon"];
  final List<String> loadingMessages = [
    "Nous téléchargeons les données",
    "C'est presque fini",
    "Plus que quelques secondes avant d'avoir le résultat"
  ];

  final RxList _meteoResponse = [].obs;
  final RxBool _isLoading = true.obs;
  final RxString _loadingMessage = "".obs;

  List get meteoResponse => _meteoResponse.value;

  String get loadingMessage => _loadingMessage.value;

  bool get isLoading => _isLoading.value;

  @override
  void onInit() {
    super.onInit();
    getWeather();
  }

  void getWeather() async {
    _isLoading.value = true;
    _meteoResponse.value = [];

    _loadingMessage.value = loadingMessages[0];

    final apiService =
        ApiService(Dio(BaseOptions(contentType: "application/json")));
    int counter = 0;
    const Duration duration = Duration(seconds: 1);

    Timer.periodic(duration, (timer) async {
      final weather = await apiService.getMeteo(
          "1c9c058ef6d74ac4883202854232405", villes[counter], "no");

      _meteoResponse.add(weather);

      log("Counter => $counter");

      counter++;

      if (counter == 5) {
        timer.cancel();
        Future.delayed(const Duration(seconds: 10), () {
          _isLoading.value = false;

          log("The last value is : ${_isLoading.value}");
        });
      }
    });
  }

  void messageAnimationCallback(Timer timer) {
    _loadingMessage.value = loadingMessages[timer.tick % 3];
    if (!isLoading) {
      timer.cancel();
      _loadingMessage.value = "";
    }
  }
}
