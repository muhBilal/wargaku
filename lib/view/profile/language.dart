import 'package:flutter/material.dart';
import 'package:wargaku/view/utils/colornotifire.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../utils/media.dart';
import '../utils/string.dart';

class Language extends StatefulWidget {
  const Language({super.key});

  @override
  State<Language> createState() => _LanguageState();
}

class _LanguageState extends State<Language> {
  int _groupValue = 0;
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
        backgroundColor: notifire.getprimerycolor,
        elevation: 0,
        centerTitle: true,
        iconTheme: IconThemeData(color: notifire.getdarkscolor),
        title: Text(
          CustomStrings.language,
          style: TextStyle(
              color: notifire.getdarkscolor,
              fontSize: height / 40,
              fontFamily: 'Gilroy Bold'),
        ),
      ),
      backgroundColor: notifire.getprimerycolor,
      body: SingleChildScrollView(
        child: Stack(
          children: [
            Container(
              height: height * 0.89,
              width: width,
              color: Colors.transparent,
              child: Image.asset(
                "images/background.png",
                fit: BoxFit.cover,
              ),
            ),
            Column(
              children: [
                SizedBox(height: height / 50),
                Row(
                  children: [
                    SizedBox(width: width / 20),
                    Text(
                      CustomStrings.suggestedlanguages,
                      style: TextStyle(
                        color: notifire.getdarkscolor,
                        fontFamily: 'Gilroy Bold',
                        fontSize: height / 50,
                      ),
                    )
                  ],
                ),
                SizedBox(height: height / 40),
                sugesttype(CustomStrings.englishuk, 0),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: width / 20),
                  child: Divider(
                    thickness: 1,
                    color: Colors.grey.withOpacity(0.4),
                  ),
                ),
                sugesttype(CustomStrings.english, 1),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: width / 20),
                  child: Divider(
                    thickness: 1,
                    color: Colors.grey.withOpacity(0.4),
                  ),
                ),
                sugesttype(CustomStrings.bahasaindonesia, 2),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: width / 20),
                  child: Divider(
                    thickness: 1,
                    color: Colors.grey.withOpacity(0.4),
                  ),
                ),
                SizedBox(height: height / 50),
                Row(
                  children: [
                    SizedBox(width: width / 20),
                    Text(
                      CustomStrings.otherlanguages,
                      style: TextStyle(
                        fontFamily: 'Gilroy Bold',
                        color: notifire.getdarkscolor,
                        fontSize: height / 50,
                      ),
                    )
                  ],
                ),
                SizedBox(height: height / 40),
                sugesttype(CustomStrings.chineses, 2),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: width / 20),
                  child: Divider(
                    thickness: 1,
                    color: Colors.grey.withOpacity(0.4),
                  ),
                ),
                sugesttype(CustomStrings.croatian, 3),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: width / 20),
                  child: Divider(
                    thickness: 1,
                    color: Colors.grey.withOpacity(0.4),
                  ),
                ),
                sugesttype(CustomStrings.czech, 4),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: width / 20),
                  child: Divider(
                    thickness: 1,
                    color: Colors.grey.withOpacity(0.4),
                  ),
                ),
                sugesttype(CustomStrings.danish, 5),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: width / 20),
                  child: Divider(
                    thickness: 1,
                    color: Colors.grey.withOpacity(0.4),
                  ),
                ),
                sugesttype(CustomStrings.filipino, 6),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: width / 20),
                  child: Divider(
                    thickness: 1,
                    color: Colors.grey.withOpacity(0.4),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget sugesttype(title, val) {
    return GestureDetector(
      onTap: () {
        setState(
          () {
            _groupValue = val;
          },
        );
      },
      child: Container(
        color: Colors.transparent,
        child: Row(
          children: [
            SizedBox(width: width / 20),
            Text(
              title,
              style: TextStyle(
                  color: notifire.getdarkscolor,
                  fontSize: height / 45,
                  fontFamily: 'Gilroy Medium'),
            ),
            const Spacer(),
            Radio(
              activeColor: notifire.getbluecolor,
              value: val as int,
              groupValue: _groupValue,
              onChanged: (value) {
                setState(() {
                  _groupValue = value as int;
                });
              },
            ),
          ],
        ),
      ),
    );
  }
}
