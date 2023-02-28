// ignore_for_file: use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_speed_dial/flutter_speed_dial.dart';
import 'package:stellar_scope/pages/blue_marble_page.dart';
import 'package:stellar_scope/pages/pic_video_lib_page.dart';
import 'package:stellar_scope/pages/search_page.dart';
import 'package:stellar_scope/services/search_api.dart';
import 'pages/picture_of_day_page.dart';
import 'pages/planets_info_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      routes: {
        InfoPage.routeName: (context) => const InfoPage(),
        Apod.routeName: (context) => const Apod(),
        BlueMarble.routeName: (context) => const BlueMarble(),
        NasaLibPage.routeName: (context) => const NasaLibPage(),
      },
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        textTheme: TextTheme(
          displayLarge: GoogleFonts.nunitoSans(
            fontSize: 96,
            fontWeight: FontWeight.w300,
            letterSpacing: -1.5,
            color: Colors.white,
          ),
          displayMedium: GoogleFonts.nunitoSans(
            fontSize: 60,
            fontWeight: FontWeight.w300,
            letterSpacing: -0.5,
            color: Colors.white,
          ),
          displaySmall: GoogleFonts.nunitoSans(
            fontSize: 48,
            fontWeight: FontWeight.w400,
            color: Colors.white,
          ),
          headlineMedium: GoogleFonts.nunitoSans(
            fontSize: 34,
            fontWeight: FontWeight.w400,
            letterSpacing: 0.25,
            color: Colors.white,
          ),
          headlineSmall: GoogleFonts.nunitoSans(
            fontSize: 24,
            fontWeight: FontWeight.w400,
            color: Colors.white,
          ),
          titleLarge: GoogleFonts.nunitoSans(
            fontSize: 20,
            fontWeight: FontWeight.w500,
            letterSpacing: 0.15,
            color: Colors.white,
          ),
          titleMedium: GoogleFonts.nunitoSans(
            fontSize: 16,
            fontWeight: FontWeight.w400,
            letterSpacing: 0.15,
            color: Colors.white,
          ),
          titleSmall: GoogleFonts.nunitoSans(
            fontSize: 14,
            fontWeight: FontWeight.w500,
            letterSpacing: 0.1,
            color: Colors.white,
          ),
          bodyLarge: GoogleFonts.nunitoSans(
            fontSize: 16,
            fontWeight: FontWeight.w400,
            letterSpacing: 0.5,
            color: Colors.white,
          ),
          bodyMedium: GoogleFonts.nunitoSans(
            fontSize: 14,
            fontWeight: FontWeight.w400,
            letterSpacing: 0.25,
            color: Colors.white,
          ),
          labelLarge: GoogleFonts.nunitoSans(
            fontSize: 14,
            fontWeight: FontWeight.w500,
            letterSpacing: 1.25,
          ),
          bodySmall: GoogleFonts.nunitoSans(
            fontSize: 12,
            fontWeight: FontWeight.w400,
            letterSpacing: 0.4,
          ),
          labelSmall: GoogleFonts.nunitoSans(
            fontSize: 10,
            fontWeight: FontWeight.w400,
            letterSpacing: 1.5,
          ),
        ),
        useMaterial3: true,
        fontFamily: GoogleFonts.nunitoSans().fontFamily,
        colorScheme: ColorScheme.fromSwatch().copyWith(
            primary: const Color(0xff0b3d91),
            secondary: const Color(0xffffa07a),
            background: const Color(0xff3d3d3d),
            error: const Color(0xffffc300),
            outline: const Color(0xff9b59b6)),
        appBarTheme: const AppBarTheme(
          foregroundColor: Colors.white,
          centerTitle: true,
          iconTheme: IconThemeData(color: Color(0xff9b59b6)),
          color: Color(0xff0b3d91),
        ),
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: SpeedDial(
        spaceBetweenChildren: 5,
        animatedIcon: AnimatedIcons.menu_close,
        animatedIconTheme: const IconThemeData(color: Colors.black),
        backgroundColor: Theme.of(context).colorScheme.secondary,
        overlayColor: Colors.black,
        overlayOpacity: 0.3,
        visible: true,
        curve: Curves.bounceIn,
        children: [
          SpeedDialChild(
            child: const Icon(Icons.search),
            backgroundColor: Theme.of(context).colorScheme.secondary,
            label: 'Search',
            labelStyle: const TextStyle(fontSize: 18.0, color: Colors.black),
            onTap: () async {
              List<dynamic> apidata = await SearchApi.getAllData();
              List<String> planetnames =
                  apidata.map((item) => item['name'].toString()).toList();
              List<String> planetids =
                  apidata.map((item) => item['id'].toString()).toList();
              showSearch(
                  context: context,
                  delegate: SearchPlanet(planetnames, planetids));
            },
          ),
          SpeedDialChild(
            child: const Icon(Icons.image),
            backgroundColor: Theme.of(context).colorScheme.secondary,
            label: 'Picture of the Day',
            labelStyle: const TextStyle(fontSize: 18.0, color: Colors.black),
            onTap: () {
              Navigator.pushNamed(context, Apod.routeName);
            },
          ),
          SpeedDialChild(
            child: const Icon(Icons.adjust),
            backgroundColor: Theme.of(context).colorScheme.secondary,
            label: 'Blue Marble',
            labelStyle: const TextStyle(fontSize: 18.0, color: Colors.black),
            onTap: () {
              Navigator.pushNamed(context, BlueMarble.routeName);
            },
          ),
          SpeedDialChild(
            child: const Icon(Icons.library_books),
            backgroundColor: Theme.of(context).colorScheme.secondary,
            label: 'Nasa Image and Video Library',
            labelStyle: const TextStyle(fontSize: 18.0, color: Colors.black),
            onTap: () {
              Navigator.pushNamed(context, NasaLibPage.routeName);
            },
          ),
        ],
      ),
      appBar: AppBar(
        title: const Text(
          "Solar System",
        ),
      ),
      backgroundColor: Theme.of(context).colorScheme.background,
      body: SingleChildScrollView(
        child: Center(
            child: Column(children: [
          ListView.builder(
            itemBuilder: (context, index) {
              return Column(
                children: [
                  const SizedBox(height: 20),
                  GestureDetector(
                      onTap: () {
                        Navigator.pushNamed(
                          context,
                          InfoPage.routeName,
                          arguments: Arguments(
                              planets.keys.toList()[index].keys.toList()[0],
                              planets.keys.toList()[index].values.toList()[0],
                              planets.values.toList()[index]),
                        );
                      },
                      child: Image.network(
                          planets.keys.toList()[index].values.toList()[0],
                          height: 100)),
                  Container(
                    margin: const EdgeInsets.all(5),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    width: 100,
                    child: Text(
                      planets.keys.toList()[index].keys.toList()[0],
                      textAlign: TextAlign.center,
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ],
              );
            },
            itemCount: planets.length,
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
          )
        ])),
      ),
    );
  }
}

Map<Map<String, String>, Color> planets = {
  {"Sun": "https://cdn-icons-png.flaticon.com/512/979/979585.png"}:
      const Color(0xffFFCC33),
  {"Mercury": "https://cdn-icons-png.flaticon.com/512/2739/2739612.png"}:
      const Color(0xff9B7E62),
  {"Venus": "https://cdn-icons-png.flaticon.com/512/2739/2739616.png"}:
      const Color(0xffFFCBA4),
  {"Earth": "https://cdn-icons-png.flaticon.com/512/4238/4238090.png"}:
      const Color(0xff339966),
  {"Mars": "https://cdn-icons-png.flaticon.com/512/2739/2739625.png"}:
      const Color(0xffA55E3B),
  {"Jupiter": "https://cdn-icons-png.flaticon.com/512/9463/9463510.png"}:
      const Color(0xffE0A458),
  {"Saturn": "https://cdn-icons-png.flaticon.com/512/755/755947.png"}:
      const Color(0xffA0A0A0),
  {"Uranus": "https://cdn-icons-png.flaticon.com/512/6989/6989438.png"}:
      const Color(0xff66CCFF),
  {"Neptune": "https://cdn-icons-png.flaticon.com/512/4658/4658378.png"}:
      const Color(0xff0066CC),
  {"Pluto": "https://cdn-icons-png.flaticon.com/512/6699/6699864.png"}:
      const Color(0xff8B7D7B),
};

class Arguments {
  final String planetName;
  final String planetImage;
  final Color planetColor;
  Arguments(this.planetName, this.planetImage, this.planetColor);
}
