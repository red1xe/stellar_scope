import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'pages/planets_info_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        fontFamily: GoogleFonts.nunitoSans().fontFamily,
        colorScheme: ColorScheme.fromSwatch().copyWith(
          primary: const Color(0xff0b3d91),
          secondary: const Color(0xffffa07a),
          background: const Color(0xff3d3d3d),
          error: const Color(0xffffc300),
        ),
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
      appBar: AppBar(
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
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => InfoPage(),
                          ),
                        );
                      },
                      child: Image.network(planets.values.elementAt(index),
                          height: 100)),
                  Container(
                    margin: const EdgeInsets.all(5),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    width: 100,
                    child: Text(
                      planets.keys.elementAt(index),
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

Map<String, String> planets = {
  "Sun": "https://cdn-icons-png.flaticon.com/512/979/979585.png",
  "Mercury": "https://cdn-icons-png.flaticon.com/512/1795/1795220.png",
  "Venus": "https://cdn-icons-png.flaticon.com/512/2739/2739616.png",
  "Earth": "https://cdn-icons-png.flaticon.com/512/4238/4238090.png",
  "Mars": "https://cdn-icons-png.flaticon.com/512/2739/2739625.png",
  "Jupiter": "https://cdn-icons-png.flaticon.com/512/9463/9463510.png",
  "Saturn": "https://cdn-icons-png.flaticon.com/512/3336/3336008.png",
  "Uranus": "https://cdn-icons-png.flaticon.com/512/6989/6989438.png",
  "Neptune": "https://cdn-icons-png.flaticon.com/512/4658/4658378.png",
  "Pluto": "https://cdn-icons-png.flaticon.com/512/6699/6699864.png",
};
