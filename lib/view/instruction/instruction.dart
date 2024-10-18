import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../utils/colornotifire.dart';
import '../utils/media.dart';

class Instruction extends StatefulWidget {
  const Instruction({super.key});

  @override
  State<Instruction> createState() => _InstructionState();
}

class _InstructionState extends State<Instruction> {
  late ColorNotifire notifire;

  getdarkmodepreviousstate() async {
    final prefs = await SharedPreferences.getInstance();
    bool? previusstate = prefs.getBool("setIsDark");
    notifire.setIsDark = previusstate;
    }

  @override
  Widget build(BuildContext context) {
    notifire = Provider.of<ColorNotifire>(context, listen: true);
    return Scaffold(
      appBar: AppBar(
        leading: GestureDetector(
          onTap: () {
            Navigator.pop(context);
          },
          child: Container(
            height: 40,
            width: 40,
            margin: const EdgeInsets.all(8),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              border: Border.all(color: Colors.grey.withOpacity(0.4)),
            ),
            child: Icon(Icons.arrow_back, color: notifire.getdarkscolor),
          ),
        ),
        backgroundColor: notifire.getprimerycolor,
        elevation: 0,
      ),
      backgroundColor: notifire.getprimerycolor,
      body: SingleChildScrollView(
        child: Column(
          children: [
            Stack(
              children: [
                Container(
                  height: height,
                  width: width,
                  color: Colors.transparent,
                  child: Image.asset(
                    "images/background.png",
                    fit: BoxFit.cover,
                  ),
                ),
                Column(
                  children: [
                    SizedBox(
                      height: height / 20,
                    ),
                    Padding(
                      padding: const EdgeInsets.all(40.0),
                      child: Image.asset("images/illustration/information-1.png"),
                    ),
                    SizedBox(
                      height: height / 30,
                    ),
                    Text(
                      "Petunjuk Penggunaan Aplikasi",
                      style: TextStyle(
                          color: notifire.getdarkscolor,
                          fontSize: height / 35,
                          fontFamily: 'Gilroy Bold'),
                    ),
                    SizedBox(
                      height: height / 30,
                    ),
                    Text(
                      "Silahkan unduh dokumen di bawah ini untuk",
                      style: TextStyle(
                          color: notifire.getdarkgreycolor,
                          fontSize: height / 60,
                          fontFamily: 'Gilroy Medium'),
                    ),
                    SizedBox(
                      height: height / 200,
                    ),
                    Text(
                      "melihat petunjuk penggunaan aplikasi",
                      style: TextStyle(
                          color: notifire.getdarkgreycolor,
                          fontSize: height / 60,
                          fontFamily: 'Gilroy Medium'),
                    ),
                    SizedBox(
                      height: height / 20,
                    ),
                    GestureDetector(
                        onTap: () async {
                          const url = 'https://api-mc.surabaya.go.id/panduan/Panduan_WargaKu_MC_Warga_20032021.pdf';
                          if (await canLaunchUrl(Uri.parse(url))) {
                            await launchUrl(Uri.parse(url));
                          } else {
                            throw 'Could not launch $url';
                          }
                        },
                        child: scannerbutton(
                          notifire.getbluecolor,
                          "Petunjuk Penggunaan",
                          Colors.white,
                        )),
                    SizedBox(
                      height: height / 50,
                    ),
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget scannerbutton(clr, txt, clr2) {
    return Container(
      height: height / 18,
      width: width / 2,
      decoration: BoxDecoration(
          color: clr,
          borderRadius: const BorderRadius.all(
            Radius.circular(30),
          ),
          border: Border.all(color: notifire.getbluecolor)),
      child: Center(
        child: Text(
          txt,
          style: TextStyle(
              color: clr2, fontSize: height / 55, fontFamily: 'Gilroy Bold'),
        ),
      ),
    );
  }
}
