import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:quickalert/quickalert.dart';
import 'package:wargaku/provider/auth/auth_provider.dart';
import 'package:wargaku/view/login/login.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../card/inoutpayment.dart';
import '../utils/colornotifire.dart';
import '../utils/media.dart';
import '../utils/string.dart';
import 'changepassword.dart';
import 'forgotpassword.dart';
import 'helpsupport.dart';
import 'language.dart';
import 'legalandpolicy.dart';
import 'myprofile.dart';
import 'notification.dart';

class Profile extends StatefulWidget {
  const Profile({super.key});

  @override
  State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  late ColorNotifire notifire;
  // init notifire
  bool _switchValue = false;

  getdarkmodepreviousstate() async {
    final prefs = await SharedPreferences.getInstance();
    bool? previusstate = prefs.getBool("setIsDark");
    notifire.setIsDark = previusstate;
  }

  @override
  void initState() {
    super.initState();
    notifire = Provider.of<ColorNotifire>(context, listen: false);
    getdarkmodepreviousstate();
  }

  @override
  Widget build(BuildContext context) {
    final authProvider = Provider.of<AuthProvider>(context);
    notifire = Provider.of<ColorNotifire>(context, listen: true);
    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(color: notifire.getdarkscolor),
        elevation: 0,
        backgroundColor: notifire.getprimerycolor,
        title: Text(
          CustomStrings.profile,
          style: TextStyle(
              color: notifire.getdarkscolor,
              fontFamily: 'Gilroy Bold',
              fontSize: height / 40),
        ),
        centerTitle: true,
      ),
      backgroundColor: notifire.getprimerycolor,
      body: Container(
        height: height,
        width: width,
        decoration: const BoxDecoration(
          color: Colors.transparent,
          image: DecorationImage(
            image: AssetImage(
              "images/background.png",
            ),
            fit: BoxFit.cover,
          ),
        ),
        child: Column(
          children: [
            Expanded(
              child: SingleChildScrollView(
                child: Column(
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
                    Text(
                      CustomStrings.brooklynsimmons,
                      style: TextStyle(
                          fontSize: height / 50,
                          fontFamily: 'Gilroy Bold',
                          color: notifire.getdarkscolor),
                    ),
                    SizedBox(height: height / 100),
                    Text(
                      CustomStrings.broklyn,
                      style: TextStyle(
                        fontSize: height / 55,
                        fontFamily: 'Gilroy Medium',
                        color: Colors.grey,
                      ),
                    ),
                    SizedBox(height: height / 50),
                    Row(
                      children: [
                        SizedBox(
                          width: width / 20,
                        ),
                        const Text(
                          CustomStrings.personalinfo,
                          style: TextStyle(
                            color: Colors.grey,
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: height / 50,
                    ),
                    GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const MyProfile(),
                          ),
                        );
                      },
                      child: settingtype(
                          "images/profile.png", CustomStrings.yourprofile),
                    ),
                    SizedBox(
                      height: height / 80,
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: width / 20),
                      child: Divider(
                        thickness: 0.8,
                        color: Colors.grey.withOpacity(0.4),
                      ),
                    ),
                    SizedBox(height: height / 80),
                    GestureDetector(
                     onTap: () async {
  QuickAlert.show(
    context: context,
    type: QuickAlertType.confirm,
    text: 'Kamu yakin ingin keluar?',
    confirmBtnText: 'Yes',
    cancelBtnText: 'No',
    confirmBtnColor: Colors.green,
    onConfirmBtnTap: () async {
      await authProvider.logout();

      Navigator.of(context).pushAndRemoveUntil(
        MaterialPageRoute(builder: (context) => Login()),
        (route) => false,
      );
    },
  );
},

                      child: Padding(
                        padding: EdgeInsets.symmetric(horizontal: width / 20),
                        child: Row(
                          children: [
                            Icon(
                              Icons.logout,
                              color: const Color(0xffEB5757),
                              size: height / 34,
                            ),
                            SizedBox(width: width / 30),
                            Text(
                              CustomStrings.logout,
                              style: TextStyle(
                                color: const Color(0xffEB5757),
                                fontSize: height / 50,
                                fontFamily: 'Gilroy Bold',
                              ),
                            ),
                            const Spacer(),
                          ],
                        ),
                      ),
                    ),
                    SizedBox(
                      height: height / 80,
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: width / 20),
                      child: Divider(
                        thickness: 0.6,
                        color: Colors.grey.withOpacity(0.4),
                      ),
                    ),
                    // SizedBox(height: height / 50),
                    // Row(
                    //   children: [
                    //     SizedBox(
                    //       width: width / 20,
                    //     ),
                    //     const Text(
                    //       CustomStrings.security,
                    //       style: TextStyle(
                    //         color: Colors.grey,
                    //       ),
                    //     ),
                    //   ],
                    // ),
                    // SizedBox(
                    //   height: height / 50,
                    // ),
                    // faceid("images/faceid.png", CustomStrings.search),
                    // Padding(
                    //   padding: EdgeInsets.symmetric(horizontal: width / 20),
                    //   child: Divider(
                    //     thickness: 0.6,
                    //     color: Colors.grey.withOpacity(0.4),
                    //   ),
                    // ),
                    // darkmode("images/darkmode.png", CustomStrings.darkmode),
                    // SizedBox(height: height / 100,),
                    // Padding(
                    //   padding: EdgeInsets.symmetric(horizontal: width / 20),
                    //   child: Divider(
                    //     thickness: 0.7,
                    //     color: Colors.grey.withOpacity(0.4),
                    //   ),
                    // ),
                    // SizedBox(height: height / 80),
                    // GestureDetector(
                    //   onTap: () {
                    //     Navigator.push(
                    //       context,
                    //       MaterialPageRoute(
                    //         builder: (context) => const ChangePassword(),
                    //       ),
                    //     );
                    //   },
                    //   child: settingtype("images/profilepassword.png",
                    //       CustomStrings.changepassword),
                    // ),
                    // SizedBox(height: height / 80),
                    // Padding(
                    //   padding: EdgeInsets.symmetric(horizontal: width / 20),
                    //   child: Divider(
                    //     thickness: 0.6,
                    //     color: Colors.grey.withOpacity(0.4),
                    //   ),
                    // ),
                    // SizedBox(height: height / 80),
                    // GestureDetector(
                    //   onTap: () {
                    //     Navigator.push(
                    //       context,
                    //       MaterialPageRoute(
                    //         builder: (context) => const ForgotPassword(),
                    //       ),
                    //     );
                    //   },
                    //   child: settingtype("images/forgotpassword.png",
                    //       CustomStrings.forgotpasswords),
                    // ),
                    // SizedBox(
                    //   height: height / 80,
                    // ),
                    // Padding(
                    //   padding: EdgeInsets.symmetric(horizontal: width / 20),
                    //   child: Divider(
                    //     thickness: 0.6,
                    //     color: Colors.grey.withOpacity(0.4),
                    //   ),
                    // ),
                    // SizedBox(height: height / 50),
                    // Row(
                    //   children: [
                    //     SizedBox(
                    //       width: width / 20,
                    //     ),
                    //     const Text(
                    //       CustomStrings.general,
                    //       style: TextStyle(
                    //         color: Colors.grey,
                    //       ),
                    //     ),
                    //   ],
                    // ),
                    // SizedBox(
                    //   height: height / 50,
                    // ),
                    // GestureDetector(
                    //   onTap: () {
                    //     Navigator.push(
                    //       context,
                    //       MaterialPageRoute(
                    //         builder: (context) => const Notifications(),
                    //       ),
                    //     );
                    //   },
                    //   child: settingtype("images/notification.png",
                    //       CustomStrings.notification),
                    // ),
                    // SizedBox(height: height / 80),
                    // Padding(
                    //   padding: EdgeInsets.symmetric(horizontal: width / 20),
                    //   child: Divider(
                    //     thickness: 0.6,
                    //     color: Colors.grey.withOpacity(0.4),
                    //   ),
                    // ),
                    // SizedBox(height: height / 80),
                    // GestureDetector(
                    //   onTap: () {
                    //     Navigator.push(
                    //       context,
                    //       MaterialPageRoute(
                    //         builder: (context) => const Language(),
                    //       ),
                    //     );
                    //   },
                    //   child: settingtype(
                    //       "images/languages.png", CustomStrings.languages),
                    // ),
                    // SizedBox(height: height / 80),
                    // Padding(
                    //   padding: EdgeInsets.symmetric(horizontal: width / 20),
                    //   child: Divider(
                    //     thickness: 0.6,
                    //     color: Colors.grey.withOpacity(0.4),
                    //   ),
                    // ),
                    // SizedBox(height: height / 80),
                    // GestureDetector(
                    //   onTap: () {
                    //     Navigator.push(
                    //       context,
                    //       MaterialPageRoute(
                    //         builder: (context) => const HelpSupport(
                    //           CustomStrings.helpandsupports,
                    //         ),
                    //       ),
                    //     );
                    //   },
                    //   child: settingtype(
                    //       "images/helps.png", CustomStrings.helpandsupport),
                    // ),
                    // SizedBox(
                    //   height: height / 80,
                    // ),
                    // Padding(
                    //   padding: EdgeInsets.symmetric(horizontal: width / 20),
                    //   child: Divider(
                    //     thickness: 0.6,
                    //     color: Colors.grey.withOpacity(0.4),
                    //   ),
                    // ),
                    // SizedBox(height: height / 80),
                    // GestureDetector(
                    //   onTap: () {
                    //     Navigator.push(
                    //       context,
                    //       MaterialPageRoute(
                    //         builder: (context) =>
                    //             const LegalPolicy(CustomStrings.legalandpolicy),
                    //       ),
                    //     );
                    //   },
                    //   child: settingtype(
                    //       "images/policy.png", CustomStrings.legalandpolicy),
                    // ),
                    // SizedBox(
                    //   height: height / 80,
                    // ),
                    // Padding(
                    //   padding: EdgeInsets.symmetric(horizontal: width / 20),
                    //   child: Divider(
                    //     thickness: 0.6,
                    //     color: Colors.grey.withOpacity(0.4),
                    //   ),
                    // ),
                    // GestureDetector(
                    //   onTap: () {
                    //     _showMyDialog();
                    //   },
                    //   child: Container(
                    //     width: width / 2,
                    //     height: height / 20,
                    //     color: Colors.transparent,
                    //     child: Center(
                    //       child: Text(
                    //         CustomStrings.logout,
                    //         style: TextStyle(
                    //             color: const Color(0xffEB5757),
                    //             fontFamily: 'Gilroy Bold',
                    //             fontSize: height / 50),
                    //       ),
                    //     ),
                    //   ),
                    // ),

                    SizedBox(
                      height: height / 20,
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Future<void> _showMyDialog() async {
    return showDialog<void>(
      context: context,
      builder: (BuildContext context) {
        return Dialog(
          shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.all(
              Radius.circular(32.0),
            ),
          ),
          child: Container(
            decoration: BoxDecoration(
              color: notifire.getprimerycolor,
              borderRadius: const BorderRadius.all(
                Radius.circular(20),
              ),
            ),
            height: height / 3,
            child: Column(
              children: [
                SizedBox(
                  height: height / 40,
                ),
                GestureDetector(
                  onTap: () {
                    Navigator.pop(context);
                  },
                  child: Row(
                    children: [
                      const Spacer(),
                      Icon(
                        Icons.clear,
                        color: notifire.getdarkscolor,
                      ),
                      SizedBox(
                        width: width / 20,
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: height / 40,
                ),
                Text(
                  CustomStrings.sure,
                  style: TextStyle(
                    color: notifire.getdarkscolor,
                    fontFamily: 'Gilroy Bold',
                    fontSize: height / 40,
                  ),
                ),
                Text(
                  CustomStrings.log,
                  style: TextStyle(
                    color: notifire.getdarkscolor,
                    fontFamily: 'Gilroy Bold',
                    fontSize: height / 40,
                  ),
                ),
                SizedBox(
                  height: height / 20,
                ),
                GestureDetector(
                  onTap: () {
                    Navigator.pop(context);
                  },
                  child: Container(
                    height: height / 18,
                    width: width / 2.5,
                    decoration: BoxDecoration(
                      color: notifire.getbluecolor,
                      borderRadius: const BorderRadius.all(
                        Radius.circular(20),
                      ),
                    ),
                    child: Center(
                      child: Text(
                        CustomStrings.cancel,
                        style: TextStyle(
                            color: Colors.white,
                            fontFamily: 'Gilroy Bold',
                            fontSize: height / 55),
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: height / 100,
                ),
                GestureDetector(
                  onTap: () {
                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const Login(),
                      ),
                    );
                  },
                  child: Container(
                    height: height / 18,
                    width: width / 2.5,
                    decoration: const BoxDecoration(
                      color: Colors.transparent,
                      borderRadius: BorderRadius.all(
                        Radius.circular(20),
                      ),
                    ),
                    child: Center(
                      child: Text(
                        CustomStrings.logout,
                        style: TextStyle(
                            color: const Color(0xffEB5757),
                            fontFamily: 'Gilroy Bold',
                            fontSize: height / 55),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  Widget faceid(image, title) {
    return Row(
      children: [
        SizedBox(width: width / 20),
        Image.asset(
          image,
          height: height / 34,
          color: notifire.getdarkscolor,
        ),
        SizedBox(width: width / 30),
        Text(
          title,
          style: TextStyle(
            color: notifire.getdarkscolor,
            fontSize: height / 50,
            fontFamily: 'Gilroy Bold',
          ),
        ),
        const Spacer(),
        Transform.scale(
          scale: 0.7,
          child: CupertinoSwitch(
            trackColor: notifire.getdarkgreycolor,
            thumbColor: Colors.white,
            activeColor: notifire.getbluecolor,
            value: _switchValue,
            onChanged: (value) {
              setState(
                () {
                  _switchValue = value;
                },
              );
            },
          ),
        ),
        SizedBox(width: width / 20)
      ],
    );
  }

  Widget darkmode(image, title) {
    return Row(
      children: [
        SizedBox(width: width / 20),
        Image.asset(
          image,
          height: height / 34,
          color: notifire.getdarkscolor,
        ),
        SizedBox(width: width / 30),
        Text(
          title,
          style: TextStyle(
            color: notifire.getdarkscolor,
            fontSize: height / 50,
            fontFamily: 'Gilroy Bold',
          ),
        ),
        const Spacer(),
        Transform.scale(
          scale: 0.7,
          child: CupertinoSwitch(
            trackColor: notifire.getdarkgreycolor,
            thumbColor: Colors.white,
            activeColor: notifire.getbluecolor,
            value: notifire.getIsDark,
            onChanged: (val) async {
              final prefs = await SharedPreferences.getInstance();
              setState(
                () {
                  notifire.setIsDark = val;
                  prefs.setBool("setIsDark", val);
                },
              );
            },
          ),
        ),
        SizedBox(width: width / 20)
      ],
    );
  }

  Widget settingtype(image, title) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: width / 20),
      child: Container(
        color: Colors.transparent,
        child: Row(
          children: [
            Image.asset(
              image,
              height: height / 34,
              color: notifire.getdarkscolor,
            ),
            SizedBox(width: width / 30),
            Text(
              title,
              style: TextStyle(
                color: notifire.getdarkscolor,
                fontSize: height / 50,
                fontFamily: 'Gilroy Bold',
              ),
            ),
            const Spacer(),
          ],
        ),
      ),
    );
  }

  Widget logout(image, title) {
    return Row(
      children: [
        SizedBox(width: width / 20),
        Image.asset(image, height: height / 27),
        SizedBox(width: width / 30),
        Text(
          title,
          style: TextStyle(
            color: const Color(0xffF75555),
            fontSize: height / 50,
            fontFamily: 'Gilroy Bold',
          ),
        ),
      ],
    );
  }
}
