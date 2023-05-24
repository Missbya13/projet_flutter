import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';

import '../controllers/meteo_screen_controller.dart';

class MetoScreen extends StatefulWidget {
  const MetoScreen({Key? key}) : super(key: key);

  @override
  State<MetoScreen> createState() => _MetoScreenState();
}

class _MetoScreenState extends State<MetoScreen> {
  @override
  Widget build(BuildContext context) {
    MeteoScreenController controller = Get.find();

    return Obx(
      () => controller.isLoading
          ? Scaffold(
              appBar: AppBar(
                title: const Text("Loading...",
                    style: TextStyle(color: Colors.white)),
                leading: (!controller.isLoading)
                    ? IconButton(
                        onPressed: () {
                          Get.back();
                        },
                        icon: const Icon(CupertinoIcons.arrow_left),
                      )
                    : const Text(''),
              ),
              body: Container(
                color: Colors.blue.withOpacity(0.8),
                child: Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        controller.loadingMessage,
                        textAlign: TextAlign.center,
                        style: const TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
                            fontSize: 24),
                      ),
                      const SizedBox(
                        height: 30,
                      ),
                      LinearPercentIndicator(
                        animation: true,
                        animationDuration: 60000,
                        lineHeight: 40,
                        percent: 1,
                        progressColor: Colors.blue.shade600,
                        backgroundColor: Colors.white,
                        barRadius: const Radius.circular(35),
                      )
                    ],
                  ),
                ),
              ),
            )
          : Scaffold(
              appBar: AppBar(
                  backgroundColor: Colors.blue.withOpacity(0.8),
                  title: const Text("Meteo",
                      style: TextStyle(color: Colors.white)),
                  elevation: 0,
                  leading: IconButton(
                      onPressed: () {
                        Get.back();
                      },
                      icon: const Icon(CupertinoIcons.arrow_left))),
              body: Stack(
                children: [
                  Container(
                    padding: const EdgeInsets.all(8),
                    decoration: const BoxDecoration(
                      color: Colors.blue,
                    ),
                    child: ListView.separated(
                      padding: const EdgeInsets.only(left: 24, right: 24),
                      itemCount: controller.meteoResponse.length,
                      itemBuilder: (BuildContext context, int index) {
                        return SizedBox(
                          height: 100,
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.end,
                            children: [
                              Column(
                                mainAxisAlignment: MainAxisAlignment.end,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    "${controller.meteoResponse[index].location.city}, ${controller.meteoResponse[index].location.country}",
                                    style: const TextStyle(
                                        fontSize: 12, color: Colors.white),
                                  ),
                                  const SizedBox(
                                    height: 8,
                                  ),
                                  Text(
                                    "${controller.meteoResponse[index].current.condition.code}",
                                    style: const TextStyle(
                                        fontSize: 12, color: Colors.white),
                                  ),
                                ],
                              ),
                              const Spacer(),
                              Text(
                                "${controller.meteoResponse[index].current.tempC.toString().replaceAll(".0", "")}°C",
                                style: const TextStyle(
                                    fontSize: 52,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.white),
                              ),
                              const SizedBox(
                                width: 18,
                              ),
                              // const Icon(
                              //   CupertinoIcons.cloud_bolt_rain_fill,
                              //   size: 50,
                              // )
                              Image.network(
                                  "https://cdn.weatherapi.com/weather/64x64/day/113.png")
                            ],
                          ),
                        );
                      },
                      separatorBuilder: (BuildContext context, int index) =>
                          const Divider(
                        color: Colors.white,
                      ),
                    ),
                  ),
                ],
              ),
              floatingActionButton: FloatingActionButton(
                  backgroundColor: Colors.black,
                  onPressed: () {
                    controller.getWeather();
                  },
                  child: const Icon(
                    CupertinoIcons.arrow_clockwise,
                    color: Colors.white,
                  ))),
    );
  }
}
