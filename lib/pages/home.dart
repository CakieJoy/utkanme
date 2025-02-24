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
                  onTap: () {},
                  child: Text(
                    "Ana Sayfa",
                    style: GoogleFonts.poppins(fontSize: 20),
                  ),
                ),
                SizedBox(
                  width: 10,
                ),
                InkWell(
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => ProjectsPage()));
                  },
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
                    await launch("https://blog.utkan.net");
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
            Column(
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 10.0),
                  child: Column(
                    children: [
                      Text(
                        "Merhabalar ben Utkan Aydın Junior Flutter Android Developer'ım.",
                        style: GoogleFonts.poppins(fontSize: 25),
                      ),
                      SizedBox(
                        height: 15,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Text("Github Projelerim için"),
                          SizedBox(
                            width: 5,
                          ),
                          InkWell(
                              onTap: () async {
                                await launch(
                                    "https://github.com/CakieJoy?tab=repositories");
                              },
                              child: Image.network(
                                "https://ouch-cdn2.icons8.com/_qv0GZ-TvUNz7L6kTDY6jQTK0ZL8PBgeSRketqzOyB0/rs:fit:456:456/czM6Ly9pY29uczgu/b3VjaC1wcm9kLmFz/c2V0cy9wbmcvNDEw/LzY2ZThhYzc1LTJh/ZjAtNDk4MC1hNThl/LWMwOWY0NWIyM2Mz/NS5wbmc.png",
                                width: 20,
                                height: 20,
                              ))
                        ],
                      ),
                    ],
                  ),
                )
              ],
            )
          ],
        ));
  }
}
