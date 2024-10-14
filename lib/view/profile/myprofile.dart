import 'package:flutter/material.dart';
import 'package:wargaku/view/profile/editprofile.dart';
import 'package:wargaku/view/utils/media.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../utils/colornotifire.dart';
import '../utils/profiletextfield.dart';
import '../utils/string.dart';

class MyProfile extends StatefulWidget {
  const MyProfile({super.key});

  @override
  State<MyProfile> createState() => _MyProfileState();
}

class _MyProfileState extends State<MyProfile> {
  late ColorNotifire notifire;

  getdarkmodepreviousstate() async {
    final prefs = await SharedPreferences.getInstance();
    bool? previusstate = prefs.getBool("setIsDark");
    notifire.setIsDark = previusstate;
    }

  @override
  void initState() {
    super.initState();
    getdarkmodepreviousstate();
  }

  @override
  Widget build(BuildContext context) {
    notifire = Provider.of<ColorNotifire>(context, listen: true);
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: notifire.getprimerycolor,
        elevation: 0,
        iconTheme: IconThemeData(color: notifire.getdarkscolor),
        title: Text(
          CustomStrings.myprofile,
          style: TextStyle(
              color: notifire.getdarkscolor,
              fontSize: height / 40,
              fontFamily: 'Gilroy Bold'),
        ),
        actions: [
          GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const EditProfile(),
                ),
              );
            },
            child: Image.asset(
              "images/editprofile.png",
              scale: 3.5,
            ),
          ),
          const SizedBox(
            width: 8,
          )
        ],
      ),
      backgroundColor: notifire.getprimerycolor,
      body: SingleChildScrollView(
        child: Stack(
          children: [
            Container(
              height: height * 0.9,
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
                  height: height / 40,
                ),
                Container(
                  height: height / 8,
                  width: width / 4,
                  decoration: const BoxDecoration(
                    color: Colors.transparent,
                    shape: BoxShape.circle,
                  ),
                  child: Image.asset("images/man4.png"),
                ),
                SizedBox(
                  height: height / 30,
                ),
                Row(
                  children: [
                    SizedBox(
                      width: width / 20,
                    ),
                    Text(
                      CustomStrings.fullnamee,
                      style: TextStyle(
                          color: Colors.grey,
                          fontSize: height / 50,
                          fontFamily: 'Gilroy Medium'),
                    ),
                  ],
                ),
                SizedBox(
                  height: height / 50,
                ),
                Profiletextfilds.textField(
                    notifire.getdarkscolor,
                    notifire.getdarkgreycolor,
                    notifire.getbluecolor,
                    CustomStrings.fullnames,
                    notifire.getdarkwhitecolor),
                SizedBox(
                  height: height / 50,
                ),
                Row(
                  children: [
                    SizedBox(
                      width: width / 20,
                    ),
                    Text(
                      CustomStrings.email,
                      style: TextStyle(
                          color: Colors.grey,
                          fontSize: height / 50,
                          fontFamily: 'Gilroy Medium'),
                    ),
                  ],
                ),
                SizedBox(
                  height: height / 50,
                ),
                Profiletextfilds.textField(
                    notifire.getdarkscolor,
                    notifire.getdarkgreycolor,
                    notifire.getbluecolor,
                    CustomStrings.email,
                    notifire.getdarkwhitecolor),
                SizedBox(
                  height: height / 50,
                ),
                Row(
                  children: [
                    SizedBox(
                      width: width / 20,
                    ),
                    Text(
                      CustomStrings.phonenumber,
                      style: TextStyle(
                          color: Colors.grey,
                          fontSize: height / 50,
                          fontFamily: 'Gilroy Medium'),
                    ),
                  ],
                ),
                SizedBox(
                  height: height / 50,
                ),
                Profiletextfilds.textField(
                    notifire.getdarkscolor,
                    notifire.getdarkgreycolor,
                    notifire.getbluecolor,
                    CustomStrings.phonenumbers,
                    notifire.getdarkwhitecolor),
                SizedBox(
                  height: height / 50,
                ),
                Row(
                  children: [
                    SizedBox(
                      width: width / 20,
                    ),
                    Text(
                      CustomStrings.address,
                      style: TextStyle(
                          color: Colors.grey,
                          fontSize: height / 50,
                          fontFamily: 'Gilroy Medium'),
                    ),
                  ],
                ),
                SizedBox(
                  height: height / 50,
                ),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: width / 18),
                  child: Container(
                    color: Colors.transparent,
                    height: height / 4,
                    child: TextField(
                      maxLines: 3,
                      autofocus: false,
                      style: TextStyle(
                        fontSize: height / 50,
                        color: notifire.getdarkscolor,
                      ),
                      decoration: InputDecoration(
                        contentPadding: EdgeInsets.all(height / 100),
                        filled: true,
                        fillColor: notifire.getprimerydarkcolor,
                        hintText: CustomStrings.address,
                        hintStyle: TextStyle(
                            color: notifire.getdarkgreycolor,
                            fontSize: height / 60),
                        focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                            color: notifire.getbluecolor,
                          ),
                          borderRadius: BorderRadius.circular(10),
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderSide: const BorderSide(
                            color: Color(0xffd3d3d3),
                          ),
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
