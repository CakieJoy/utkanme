import 'package:cosmos/cosmos.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:utkan_me/pages/home.dart';
import 'package:utkan_me/theme/color.dart';

class ProjectsPage extends StatelessWidget {
  const ProjectsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: SafeArea(
          child: Row(
            children: [
              Text(
                "Utkan Aydın",
                style: GoogleFonts.rubik(
                    fontWeight: FontWeight.bold, color: title_color),
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
              SizedBox(
                width: 10,
              ),
              InkWell(
                onTap: () async {
                  await launchUrl(Uri.parse("https://blog.utkan.net"));
                },
                child: Text(
                  "Blog",
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
                                      "Yakında TodoTap için Blog yazısı yayınlanacak!",
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
