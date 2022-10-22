import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Homepage extends StatefulWidget {
  const Homepage({Key? key}) : super(key: key);

  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.black,
        body: Container(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          decoration: const BoxDecoration(
            image: DecorationImage(
              image: AssetImage('media/img/grass.png'),
              fit: BoxFit.cover,
            )
          ),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                const SizedBox(height: 30,),
                CarouselSlider(
                  options: CarouselOptions(
                    autoPlayInterval: const Duration(seconds: 5),
                    autoPlayAnimationDuration: const Duration(milliseconds: 1500),
                    autoPlayCurve: Curves.fastOutSlowIn,
                    height: 200.0,
                    autoPlay: true,
                    enlargeCenterPage: true,
                  ),
                  items: [1, 2, 3].map((i) {
                    return Builder(
                      builder: (BuildContext context) {
                        return Container(
                          width: MediaQuery.of(context).size.width,
                          margin: const EdgeInsets.all(0.0),
                          padding: const EdgeInsets.all(0.0),
                          decoration: const BoxDecoration(
                            color: Colors.transparent,
                          ),
                          child: Image.asset('media/img/homepage$i.png'),
                        );
                      },
                    );
                  }).toList(),
                ),
                const SizedBox(height: 5,),
                Text("Tel: 010/84.08.94", style: GoogleFonts.oswald(
                  textStyle: const TextStyle(fontSize:40,color: Colors.white, letterSpacing: .5),
                ),),
                Text("Info: info@doublebogey.be", style: GoogleFonts.oswald(
                  textStyle: const TextStyle(fontSize:30,color: Colors.white, letterSpacing: .5),
                ),),
                const SizedBox(height: 10,),
                Text("Lundi & Mardi: Fermé", style: GoogleFonts.oswald(
                  textStyle: const TextStyle(fontSize:30,color: Colors.white, letterSpacing: .5),
                ),),
                Text("Mercredi à Samedi: 10h - 22h", style: GoogleFonts.oswald(
                  textStyle: const TextStyle(fontSize:30,color: Colors.white, letterSpacing: .5),
                ),),
                Text("Dimanche: 12h - 18h", style: GoogleFonts.oswald(
                  textStyle: const TextStyle(fontSize:30,color: Colors.white, letterSpacing: .5),
                ),),
                const SizedBox(height: 15,),
                Text("Chaussée de Louvain 507", style: GoogleFonts.oswald(
                  textStyle: const TextStyle(fontSize:25,color: Colors.white, letterSpacing: .5),
                ),),
                Text("1300 Wavre", style: GoogleFonts.oswald(
                  textStyle: const TextStyle(fontSize:25,color: Colors.white, letterSpacing: .5),
                ),),
              ],
            ),
          ),
        ));
  }
}
