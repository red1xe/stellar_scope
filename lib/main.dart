import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

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
      },
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        fontFamily: GoogleFonts.nunitoSans().fontFamily,
        colorScheme: ColorScheme.fromSwatch().copyWith(
            primary: const Color(0xff0b3d91),
            secondary: const Color(0xffffa07a),
            background: const Color(0xff3d3d3d),
            error: const Color(0xffffc300),
            outline: const Color(0xff9b59b6)),
        appBarTheme: const AppBarTheme(
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
      drawer: Drawer(
        child: ListView(
          children: [
            Text("Drawer"),
          ],
        ),
      ),
      appBar: AppBar(
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.search),
          ),
          IconButton(
            onPressed: () {
              Navigator.pushNamed(context, Apod.routeName);
            },
            icon: const Icon(Icons.image),
          ),
        ],
        centerTitle: true,
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
