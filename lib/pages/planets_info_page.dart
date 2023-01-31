import 'dart:math';

import 'package:flutter/material.dart';
import 'package:stellar_scope/animation/planet_rotation.dart';
import 'package:stellar_scope/models/planet_model.dart';
import 'package:stellar_scope/services/planet_info_api.dart';

import '../main.dart';

class InfoPage extends StatelessWidget {
  const InfoPage({super.key});
  static const String routeName = "/infoPage";

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    final args = ModalRoute.of(context)!.settings.arguments as Arguments;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: args.planetColor.withOpacity(0.5),
        centerTitle: true,
        title: Text(
          args.planetName,
        ),
      ),
      body: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              colors: [
                Colors.white,
                args.planetColor,
              ],
            ),
          ),
          alignment: Alignment.center,
          child: Column(
            children: [
              const SizedBox(height: 20),
              Stack(
                alignment: Alignment.topCenter,
                children: [
                  Container(
                      padding: const EdgeInsets.only(left: 10, right: 10),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        color: args.planetColor,
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black.withOpacity(0.5),
                            spreadRadius: 5,
                            blurRadius: 7,
                            offset: const Offset(0, 3),
                          ),
                        ],
                      ),
                      margin: EdgeInsets.only(top: height * 0.25),
                      height: height * 0.55,
                      width: height * 0.4,
                      child: FutureBuilder(
                        future:
                            PlanetInfoApi.getDataByQuery(q: args.planetName),
                        builder: (context, snapshot) {
                          if (snapshot.hasData) {
                            List<PlanetModel> planet =
                                snapshot.data as List<PlanetModel>;
                            return ListView.builder(
                              itemCount: 1,
                              itemBuilder: (context, index) {
                                return Column(
                                  children: [
                                    SizedBox(height: height * 0.06),
                                    Text("Type: ${planet[index].bodyType}",
                                        style: const TextStyle(
                                          color: Colors.white,
                                          fontSize: 20,
                                          fontWeight: FontWeight.bold,
                                        )),
                                    const SizedBox(height: 5),
                                    RichText(
                                        text: TextSpan(children: [
                                      TextSpan(
                                          text:
                                              "Mass: ${planet[index].massValue.toString()}",
                                          style: const TextStyle(
                                            color: Colors.white,
                                            fontSize: 20,
                                            fontWeight: FontWeight.bold,
                                          )),
                                      WidgetSpan(
                                          child: Transform.translate(
                                        offset: const Offset(2, -4),
                                        child: Text(
                                            planet[index]
                                                .massExponent
                                                .toString(),
                                            textScaleFactor: 1.5,
                                            style: const TextStyle(
                                              color: Colors.white,
                                              fontSize: 10,
                                              fontWeight: FontWeight.bold,
                                            )),
                                      )),
                                      const TextSpan(
                                          text: " kg",
                                          style: TextStyle(
                                            color: Colors.white,
                                            fontSize: 20,
                                            fontWeight: FontWeight.bold,
                                          )),
                                    ])),
                                    const SizedBox(height: 5),
                                    RichText(
                                        text: TextSpan(children: [
                                      TextSpan(
                                          text:
                                              "Volume: ${planet[index].volValue.toString()}",
                                          style: const TextStyle(
                                            color: Colors.white,
                                            fontSize: 20,
                                            fontWeight: FontWeight.bold,
                                          )),
                                      WidgetSpan(
                                          child: Transform.translate(
                                        offset: const Offset(2, -4),
                                        child: Text(
                                            planet[index]
                                                .volExponent
                                                .toString(),
                                            textScaleFactor: 1.5,
                                            style: const TextStyle(
                                              color: Colors.white,
                                              fontSize: 10,
                                              fontWeight: FontWeight.bold,
                                            )),
                                      )),
                                      const TextSpan(
                                          text: " km³",
                                          style: TextStyle(
                                            color: Colors.white,
                                            fontSize: 20,
                                            fontWeight: FontWeight.bold,
                                          )),
                                    ])),
                                    const SizedBox(height: 5),
                                    Text(
                                        "Density: ${planet[index].density} g/cm³",
                                        style: const TextStyle(
                                          color: Colors.white,
                                          fontSize: 20,
                                          fontWeight: FontWeight.bold,
                                        )),
                                    const SizedBox(height: 5),
                                    Text(
                                        "Gravity: ${planet[index].gravity} m/sn²",
                                        style: const TextStyle(
                                          color: Colors.white,
                                          fontSize: 20,
                                          fontWeight: FontWeight.bold,
                                        )),
                                    const SizedBox(height: 5),
                                    Text("Radius: ${planet[index].radius} km",
                                        style: const TextStyle(
                                          color: Colors.white,
                                          fontSize: 20,
                                          fontWeight: FontWeight.bold,
                                        )),
                                    const SizedBox(height: 5),
                                    Text(
                                        "Temp(avg): ${planet[index].temperature} K",
                                        style: const TextStyle(
                                          color: Colors.white,
                                          fontSize: 20,
                                          fontWeight: FontWeight.bold,
                                        )),
                                    const SizedBox(height: 5),
                                    const Text("Discoverer:",
                                        style: TextStyle(
                                          color: Colors.white,
                                          fontSize: 20,
                                          fontWeight: FontWeight.bold,
                                        )),
                                    Text(planet[index].discoveredBy!,
                                        style: const TextStyle(
                                          color: Colors.white,
                                          fontSize: 20,
                                          fontWeight: FontWeight.bold,
                                        )),
                                    const SizedBox(height: 5),
                                    const Text("Discovery Date:",
                                        style: TextStyle(
                                          color: Colors.white,
                                          fontSize: 20,
                                          fontWeight: FontWeight.bold,
                                        )),
                                    Text(planet[index].discoveryDate!,
                                        style: const TextStyle(
                                          color: Colors.white,
                                          fontSize: 20,
                                          fontWeight: FontWeight.bold,
                                        )),
                                  ],
                                );
                              },
                            );
                          } else if (snapshot.hasError) {
                            return Center(
                              child: Text(snapshot.error.toString()),
                            );
                          } else {
                            return const Center(
                              child: CircularProgressIndicator(),
                            );
                          }
                        },
                      )),
                  Container(
                      padding: const EdgeInsets.all(5),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(height),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black.withOpacity(0.2),
                            spreadRadius: 1,
                            blurRadius: 1,
                          ),
                        ],
                      ),
                      height: height * 0.3,
                      width: height * 0.3,
                      child: PlanetRotation(key, args.planetImage)),
                ],
              ),
            ],
          )),
    );
  }
}
