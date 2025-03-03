import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:cosmos/cosmos.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:utkan_me/pages/projects.dart';
import 'package:utkan_me/theme/color.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: false,
          title: SafeArea(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Center(
                  child: InkWell(
                    onTap: () {
                      Get.to(() => HomePage());
                    },
                    child: Text(
                      "Utkan Aydın",
                      style: GoogleFonts.rubik(
                          fontWeight: FontWeight.bold, color: title_color),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
        body: CosmosBody(
          scrollable: false,
          scrollDirection: Axis.vertical,
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Center(
              child: Container(
                width: 500,
                height: 300,
                decoration: BoxDecoration(
                    color: const Color.fromARGB(49, 158, 158, 158),
                    borderRadius: BorderRadius.circular(25)),

                padding:
                    EdgeInsets.all(20), // Padding'i Container'a uyguluyoruz
                child: Column(
                  // CosmosBody yerine Column kullanıyoruz
                  crossAxisAlignment:
                      CrossAxisAlignment.start, // Metni sola yaslamak için
                  children: [
                    SizedBox(height: 10), // SizedBox'ı Column'un içine alıyoruz
                    Text("Utkan Aydın",
                        style: GoogleFonts.poppins(
                            fontSize: 30, fontWeight: FontWeight.bold)),
                    Text("CakieJoy olarakda bilinir.",
                        style: GoogleFonts.poppins(
                            fontSize: 10, fontWeight: FontWeight.w100)),
                    Text("Flutter Android Developer",
                        style: GoogleFonts.montserrat(
                            fontSize: 22, fontWeight: FontWeight.w400)),
                    SizedBox(
                      height: 5,
                    ),

                    Center(
                      child: Row(
                        children: [
                          InkWell(
                            onTap: () async {
                              await launch(
                                  "https://github.com/cakiejoy/utkanme");
                            },
                            child: Text("Bu Site GitHub'da bulunuyor!",
                                style: GoogleFonts.montserrat(
                                    fontSize: 20, fontWeight: FontWeight.w800)),
                          ),
                          SizedBox(
                            width: 10,
                          ),
                          InkWell(
                            onTap: () async {
                              await launch("mailto:utkan@utkan.net");
                            },
                            child: Icon(
                              Icons.email,
                              color: Colors.deepOrange,
                            ),
                          ),
                        ],
                      ),
                    ),
                    InkWell(
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => ProjectsPage()));
                      },
                      child: Text("Projelerim",
                          style: GoogleFonts.montserrat(
                              fontSize: 18, fontWeight: FontWeight.w500)),
                    ),
                  ],
                ),
              ),
            )
          ],
        ));
  }
}
