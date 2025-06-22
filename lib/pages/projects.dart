import 'dart:convert';
import 'package:cosmos/cosmos.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:utkan_me/pages/home.dart';
import 'package:utkan_me/theme/color.dart';
import 'package:http/http.dart' as http;

final String githubApi = "https://api.github.com/users/CakieJoy/repos";

class ProjectsPage extends StatelessWidget {
  const ProjectsPage({super.key});

  Future<List<dynamic>> fetchRepos() async {
    final response = await http.get(Uri.parse(githubApi));
    if (response.statusCode == 200) {
      return json.decode(response.body);
    } else {
      throw Exception('Failed to load repositories');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: SafeArea(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Center(
                child: InkWell(
                  onTap: () {
                    Get.to(() => const HomePage());
                  },
                  child: Text(
                    "Utkan Aydın",
                    style: GoogleFonts.rubik(
                      fontWeight: FontWeight.bold,
                      color: title_color,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
      body: FutureBuilder<List<dynamic>>(
        future: fetchRepos(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text('Hata: ${snapshot.error}'));
          } else if (snapshot.hasData) {
            final repos = snapshot.data!;
            return CosmosBody(
              scrollable: true,
              scrollDirection: Axis.vertical,
              children: repos.map((repo) {
                return Center(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(vertical: 10.0),
                    child: Container(
                      width: 550,
                      decoration: BoxDecoration(
                        color: const Color.fromARGB(49, 158, 158, 158),
                        borderRadius: BorderRadius.circular(25),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "CakieJoy adlı GitHub kullanıcısı tarafından",
                              style: GoogleFonts.montserrat(
                                fontWeight: FontWeight.w100,
                              ),
                            ),
                            Text(
                              repo["name"] ?? "İsim bulunamadı.",
                              style: GoogleFonts.montserrat(
                                fontSize: 20,
                                fontWeight: FontWeight.w900,
                              ),
                            ),
                            const SizedBox(height: 4),
                            Text(
                              repo["description"] ?? "Açıklama bulunamadı.",
                              style: GoogleFonts.montserrat(
                                fontWeight: FontWeight.w100,
                              ),
                            ),
                            const SizedBox(height: 6),
                            Text(
                              "${repo["forks_count"] ?? 0} Fork",
                              style: GoogleFonts.montserrat(),
                            ),
                            const SizedBox(height: 10),
                            Center(
                              child: InkWell(
                                onTap: () async {
                                  final url = repo["html_url"];
                                  if (await canLaunchUrl(Uri.parse(url))) {
                                    await launchUrl(Uri.parse(url));
                                  }
                                },
                                child: Text(
                                  "Depoya git!",
                                  style: GoogleFonts.montserrat(
                                    fontSize: 15,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                  ),
                );
              }).toList(),
            );
          } else {
            return const Center(child: Text('Veri bulunamadı.'));
          }
        },
      ),
    );
  }
}
