import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:cosmos/cosmos.dart';
import 'package:url_launcher/url_launcher.dart';
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
              child: Column(
                children: [
                  Container(
                    width: 500,
                    height: 400,
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
                        SizedBox(
                            height: 10), // SizedBox'ı Column'un içine alıyoruz
                        Row(
                          children: [
                            Text("Utkan Aydın",
                                style: GoogleFonts.poppins(
                                    fontSize: 30, fontWeight: FontWeight.bold)),
                            SizedBox(
                              width: 10,
                            ),
                            InkWell(
                              onTap: () {
                                try {
                                  Get.snackbar("Kopyalandı!",
                                      "Mobil için özel sayfamın linki kopyalandı.",
                                      snackPosition: SnackPosition.BOTTOM,
                                      icon: Icon(Icons.done_rounded));
                                  //throw Exception("Bu bir test hatası");
                                  Clipboard.setData(ClipboardData(
                                      text: "https://utkan.me/#/mobile-page"));
                                } catch (e) {
                                  CosmosAlert.showAnimatedDialog(
                                      context,
                                      "Hata!",
                                      "Bir sorun var gibi daha fazla detay için tarayıcı konsoluna bakın.");
                                  print(e);
                                }
                              },
                              child: SvgPicture.asset(
                                "../../assets/copy.svg", // SVG dosyasının yolu
                                width: 50, // İkon genişliği
                                height: 18, // İkon yüksekliği
                                colorFilter: const ColorFilter.mode(
                                  Colors.deepOrange, // SVG rengini beyaz yap
                                  BlendMode.srcIn,
                                ),
                              ),
                            ),
                          ],
                        ),
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
                                        fontSize: 20,
                                        fontWeight: FontWeight.w800)),
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
                        SizedBox(
                          height: 20,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            InkWell(
                              onTap: () async {
                                await launch("https://github.com/cakiejoy");
                              },
                              child: SvgPicture.asset(
                                "../../assets/github-brands.svg", // SVG dosyasının yolu
                                width: 50, // İkon genişliği
                                height: 30, // İkon yüksekliği
                                colorFilter: const ColorFilter.mode(
                                  Colors.deepOrange, // SVG rengini beyaz yap
                                  BlendMode.srcIn,
                                ),
                              ),
                            ),
                            SizedBox(
                              width: 10,
                            ),
                            InkWell(
                              onTap: () async {
                                await launch(
                                    "https://instagram.com/utkuaydnnnns");
                              },
                              child: SvgPicture.asset(
                                "../../assets/insta.svg", // SVG dosyasının yolu
                                width: 50, // İkon genişliği
                                height: 30, // İkon yüksekliği
                                colorFilter: const ColorFilter.mode(
                                  Colors.deepOrange, // SVG rengini beyaz yap
                                  BlendMode.srcIn,
                                ),
                              ),
                            ),
                            SizedBox(
                              width: 10,
                            ),
                            InkWell(
                              onTap: () async {
                                await launch("https://mastodon.social/@utkan");
                              },
                              child: SvgPicture.asset(
                                "../../assets/mastodon-brands.svg", // SVG dosyasının yolu
                                width: 50, // İkon genişliği
                                height: 30, // İkon yüksekliği
                                colorFilter: const ColorFilter.mode(
                                  Colors.deepOrange, // SVG rengini beyaz yap
                                  BlendMode.srcIn,
                                ),
                              ),
                            ),
                          ],
                        ),
                        Text("Etiketler",
                            style: GoogleFonts.montserrat(
                                fontSize: 30, fontWeight: FontWeight.w400)),
                        Row(
                          children: [
                            Card(
                              color: Colors.lightBlue.shade400,
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Text("#flutter",
                                    style: GoogleFonts.montserrat(
                                        fontSize: 20,
                                        fontWeight: FontWeight.w700,
                                        color: Colors.black)),
                              ),
                            ),
                            Card(
                              color: Colors.lightBlue.shade400,
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Text("#dart",
                                    style: GoogleFonts.montserrat(
                                        fontSize: 20,
                                        fontWeight: FontWeight.w700,
                                        color: Colors.black)),
                              ),
                            ),
                            Card(
                              color: Colors.lightBlue.shade400,
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Text("#opensource",
                                    style: GoogleFonts.montserrat(
                                        fontSize: 20,
                                        fontWeight: FontWeight.w700,
                                        color: Colors.black)),
                              ),
                            ),
                          ],
                        ),
                        Row(
                          children: [
                            Card(
                              color: Colors.lightBlue.shade400,
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Text("#firebase",
                                    style: GoogleFonts.montserrat(
                                        fontSize: 20,
                                        fontWeight: FontWeight.w700,
                                        color: Colors.black)),
                              ),
                            ),
                            Card(
                              color: Colors.lightBlue.shade400,
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Text("#github",
                                    style: GoogleFonts.montserrat(
                                        fontSize: 20,
                                        fontWeight: FontWeight.w700,
                                        color: Colors.black)),
                              ),
                            ),
                          ],
                        )
                      ],
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
                          Navigator.pushNamed(context, '/projects');
                        },
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text("Projelerim",
                              style: GoogleFonts.montserrat(
                                  fontSize: 20, fontWeight: FontWeight.w700)),
                        ),
                      ),
                    ),
                  )
                ],
              ),
            )
          ],
        ));
  }
}
