import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../routes.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Stack(children: [
          SizedBox(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height,
              child: Container(
                decoration: const BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage("assets/img/background_img.png"),
                    fit: BoxFit.cover,
                  ),
                ),
              )),
          Container(
            padding: const EdgeInsets.only(top: 20),
            child: Column(
              children: [
                Container(
                  color: Colors.white.withOpacity(0.8),
                  child: const Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Center(
                        child: Text(
                      textAlign: TextAlign.center,
                      "L'accès à la météo n'a jamais été aussi simple !",
                      style: TextStyle(
                        fontSize: 40,
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                        shadows: [
                          Shadow(
                            blurRadius: 3.0,
                            color: Colors.black,
                            offset: Offset(1.0, 1.0),
                          ),
                        ],
                      ),
                    )),
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                const Icon(
                  //meteo logo
                  Icons.wb_sunny,
                  size: 300,
                  color: Colors.yellow,
                ),
                const SizedBox(
                  height: 20,
                ),
                Center(
                  child: ElevatedButton(
                      style: ButtonStyle(
                          backgroundColor:
                              MaterialStateProperty.all(Colors.black)),
                      child: const Text(
                        "Commencer >",
                        style: TextStyle(fontSize: 23),
                      ),
                      onPressed: () {
                        Get.toNamed(MyRoutes.meteo);
                      }),
                )
              ],
            ),
          ),
        ]),
      ),
    );
  }
}
