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
        scrollable: true,
        scrollDirection: Axis.vertical,
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Center(
            child: Container(
              width: 550,
              height: 160,
              decoration: BoxDecoration(
                  color: const Color.fromARGB(49, 158, 158, 158),
                  borderRadius: BorderRadius.circular(25)),
              child: Padding(
                padding: const EdgeInsets.only(left: 20.0, top: 15.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "CakieJoy adlı GitHub kullanıcısı tarafından",
                      style:
                          GoogleFonts.montserrat(fontWeight: FontWeight.w100),
                    ),
                    Text(
                      "utkanme",
                      style: GoogleFonts.montserrat(
                          fontSize: 20, fontWeight: FontWeight.w900),
                    ),
                    SizedBox(
                      height: 2,
                    ),
                    Text(
                      "utkan.me source code",
                      style:
                          GoogleFonts.montserrat(fontWeight: FontWeight.w100),
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    Row(
                      children: [
                        Text("Dart |", style: GoogleFonts.montserrat()),
                        SizedBox(
                          width: 5,
                        ),
                        Text("MIT Lisansı |", style: GoogleFonts.montserrat()),
                        SizedBox(width: 5),
                        Text("13 Commit", style: GoogleFonts.montserrat())
                      ],
                    ),
                    Center(
                      child: InkWell(
                        onTap: () async {
                          await launchUrl(
                              Uri.parse("https://github.com/CakieJoy/utkanme"));
                        },
                        child: Text("Depoya git!",
                            style: GoogleFonts.montserrat(
                                fontSize: 15, fontWeight: FontWeight.bold)),
                      ),
                    )
                  ],
                ),
              ),
            ),
          ),
          SizedBox(
            height: 20,
          ),
          Container(
            width: 300,
            height: 50,
            decoration: BoxDecoration(
                color: const Color.fromARGB(49, 158, 158, 158),
                borderRadius: BorderRadius.circular(125)),
            child: Center(
              child: InkWell(
                onTap: () {
                  Navigator.pushNamed(context, '/');
                },
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text("Hakkımda",
                      style: GoogleFonts.montserrat(
                          fontSize: 20, fontWeight: FontWeight.w700)),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
