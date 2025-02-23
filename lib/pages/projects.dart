import 'package:cosmos/cosmos.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:utkan_me/pages/home.dart';

class ProjectsPage extends StatelessWidget {
  const ProjectsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: SafeArea(
          child: Row(
            children: [
              Text(
                "Utkan Aydın",
                style: GoogleFonts.rubik(
                    fontWeight: FontWeight.bold,
                    color: const Color.fromARGB(255, 255, 86, 34)),
              ),
              SizedBox(
                width: 25,
              ),
              InkWell(
                onTap: () {
                  Get.off(HomePage());
                },
                child: Text(
                  "Ana Sayfa",
                  style: GoogleFonts.poppins(fontSize: 20),
                ),
              ),
              SizedBox(
                width: 10,
              ),
              InkWell(
                onTap: () {},
                child: Text(
                  "Projelerim",
                  style: GoogleFonts.poppins(fontSize: 20),
                ),
              ),
            ],
          ),
        ),
      ),
      body: CosmosBody(
        scrollable: true,
        scrollDirection: Axis.vertical,
        children: [
          Center(
            child: Column(
              children: [
                Card(
                  color: Colors.black26,
                  child: Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Center(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Text("TodoTap"),
                          SizedBox(
                            height: 15,
                          ),
                          Text(
                              "TodoTap basit arayüzlü bir Günlük yapılacaklar uygulamasıdır."),
                          SizedBox(
                            height: 20,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              InkWell(
                                  onTap: () {
                                    CosmosAlert.showAnimatedDialog(
                                      context,
                                      "Yakında..",
                                      "Yakında bir blog sistemi kurucağız. Ama şimdilik beklemen gerekiyor",
                                    );
                                  },
                                  child: Icon(Icons.notes_rounded)),
                              SizedBox(
                                width: 10,
                              ),
                              InkWell(
                                  onTap: () {
                                    CosmosAlert.showAnimatedDialog(
                                        context,
                                        "Yakında..",
                                        "Yakında Google Play Store üzerinden yayındayız!");
                                  },
                                  child: Icon(Icons.store_mall_directory))
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
