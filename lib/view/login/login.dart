import 'package:flutter/material.dart';
import 'package:wargaku/provider/auth/auth_provider.dart';
import 'package:wargaku/view/bottombar/navbottom.dart';
import 'package:wargaku/view/login/register.dart';
import 'package:wargaku/view/profile/forgotpassword.dart';
import 'package:wargaku/view/utils/button.dart';
import 'package:wargaku/view/utils/media.dart';
import 'package:wargaku/view/utils/string.dart';
import 'package:wargaku/view/utils/textfeilds.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../utils/colornotifire.dart';
import 'package:quickalert/quickalert.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final TextEditingController _userController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  late ColorNotifire notifire;

  getdarkmodepreviousstate() async {
    final prefs = await SharedPreferences.getInstance();
    bool? previusstate = prefs.getBool("setIsDark");
    notifire.setIsDark = previusstate;
  }

  @override
  Widget build(BuildContext context) {
    final authProvider = Provider.of<AuthProvider>(context);

    notifire = Provider.of<ColorNotifire>(context, listen: true);
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        elevation: 0,
        backgroundColor: notifire.getprimerycolor,
        title: Text(
          CustomStrings.login,
          style: TextStyle(
              color: notifire.getdarkscolor,
              fontFamily: 'Gilroy Bold',
              fontSize: height / 35),
        ),
        centerTitle: true,
      ),
      backgroundColor: notifire.getprimerycolor,
      body: SingleChildScrollView(
        physics: const NeverScrollableScrollPhysics(),
        child: Column(
          children: [
            Stack(
              children: [
                Container(
                  height: height,
                  width: width,
                  color: Colors.transparent,
                  child:
                      Image.asset("images/background.png", fit: BoxFit.cover),
                ),
                Column(
                  children: [
                    SizedBox(
                      height: height / 12.2,
                    ),
                    Stack(
                      clipBehavior: Clip.none,
                      children: [
                        Center(
                          child: Container(
                            height: height / 1.2,
                            width: width / 1.1,
                            decoration: BoxDecoration(
                              color: notifire.gettabwhitecolor,
                              borderRadius: const BorderRadius.only(
                                topRight: Radius.circular(40),
                                topLeft: Radius.circular(40),
                              ),
                            ),
                            child: Column(
                              children: [
                                SizedBox(
                                  height: height / 15,
                                ),
                                Row(
                                  children: [
                                    SizedBox(
                                      width: width / 18,
                                    ),
                                    Text(
                                      CustomStrings.email,
                                      style: TextStyle(
                                        color: notifire.getdarkscolor,
                                        fontSize: height / 50,
                                      ),
                                    ),
                                  ],
                                ),
                                SizedBox(
                                  height: height / 70,
                                ),
                                Customtextfilds.textField(
                                  notifire.getdarkscolor,
                                  notifire.getdarkgreycolor,
                                  notifire.getbluecolor,
                                  "images/email.png",
                                  CustomStrings.emailhint,
                                  notifire.getdarkwhitecolor,
                                  _userController,
                                ),
                                SizedBox(
                                  height: height / 35,
                                ),
                                Row(
                                  children: [
                                    SizedBox(
                                      width: width / 18,
                                    ),
                                    Text(
                                      CustomStrings.password,
                                      style: TextStyle(
                                        color: notifire.getdarkscolor,
                                        fontSize: height / 50,
                                      ),
                                    ),
                                  ],
                                ),
                                SizedBox(
                                  height: height / 70,
                                ),
                                Customtextfilds.textField(
                                  notifire.getdarkscolor,
                                  notifire.getdarkgreycolor,
                                  notifire.getbluecolor,
                                  "images/password.png",
                                  CustomStrings.passwordhint,
                                  notifire.getdarkwhitecolor,
                                  _passwordController,
                                  true,
                                ),
                                SizedBox(
                                  height: height / 35,
                                ),
                                Row(
                                  children: [
                                    const Spacer(),
                                    GestureDetector(
                                      onTap: () {
                                        Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                            builder: (context) =>
                                                const ForgotPassword(),
                                          ),
                                        );
                                      },
                                      child: Container(
                                        height: height / 40,
                                        color: Colors.transparent,
                                        child: Text(
                                          CustomStrings.forgotpassword,
                                          style: TextStyle(
                                              color: notifire.getdarkscolor,
                                              fontSize: height / 60,
                                              fontFamily: 'Gilroy Medium'),
                                        ),
                                      ),
                                    ),
                                    SizedBox(
                                      width: width / 18,
                                    ),
                                  ],
                                ),
                                SizedBox(
                                  height: height / 20,
                                ),
                                GestureDetector(
                                  onTap: () async {
                                    FocusScope.of(context).unfocus();
                                    bool success = await authProvider.login(
                                        _userController.text,
                                        _passwordController.text);
                                    
                                    if (success) {
                                      if (!mounted) return;
                                      QuickAlert.show(
                                        context: context,
                                        type: QuickAlertType.success,
                                        text: 'Login Berhasil!',
                                      );
                                      await Future.delayed(
                                          const Duration(seconds: 2));
                                      if (!mounted) return;
                                      Navigator.pushReplacement(
                                        context,
                                        MaterialPageRoute(
                                          builder: (context) =>
                                              const Navbottom(),
                                        ),
                                      );
                                    } else {
                                      QuickAlert.show(
                                        context: context,
                                        type: QuickAlertType.error,
                                        title: 'Oops...',
                                        text:
                                            'Login gagal, Silahkan cek username / password anda!',
                                      );
                                    }
                                  },
                                  child: Custombutton.button(
                                    notifire.getbluecolor,
                                    CustomStrings.login,
                                    width / 2,
                                  ),
                                ),
                                SizedBox(
                                  height: height / 50,
                                ),
                                Padding(
                                  padding: EdgeInsets.symmetric(
                                      horizontal: width / 18),
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceAround,
                                    children: [
                                      Container(
                                        height: height / 700,
                                        width: width / 3,
                                        color: Colors.grey.withOpacity(0.4),
                                      ),
                                      Text(
                                        "or",
                                        style: TextStyle(
                                          color: notifire.getdarkgreycolor,
                                          fontSize: height / 50,
                                        ),
                                      ),
                                      Container(
                                        height: height / 700,
                                        width: width / 3,
                                        color: Colors.grey.withOpacity(0.4),
                                      ),
                                    ],
                                  ),
                                ),
                                SizedBox(
                                  height: height / 20,
                                ),
                                Row(
                                  children: [
                                    const Spacer(),
                                    Container(
                                      height: height / 10,
                                      width: width / 5.1,
                                      decoration: BoxDecoration(
                                        color: notifire.getprimerycolor,
                                        borderRadius: BorderRadius.circular(19),
                                        boxShadow: [
                                          BoxShadow(
                                            color: const Color(0xff6C56F9)
                                                .withOpacity(0.11),
                                            blurRadius: 10.0,
                                          ),
                                        ],
                                      ),
                                      child: Center(
                                        child: Image.asset(
                                          "images/facebook.png",
                                          height: height / 20,
                                        ),
                                      ),
                                    ),
                                    SizedBox(
                                      width: width / 12,
                                    ),
                                    Container(
                                      height: height / 10,
                                      width: width / 5.1,
                                      decoration: BoxDecoration(
                                        color: notifire.getprimerycolor,
                                        borderRadius: BorderRadius.circular(19),
                                        boxShadow: [
                                          BoxShadow(
                                            color: const Color(0xff6C56F9)
                                                .withOpacity(0.11),
                                            blurRadius: 10.0,
                                          ),
                                        ],
                                      ),
                                      child: Center(
                                        child: Image.asset(
                                          "images/google.png",
                                          height: height / 20,
                                        ),
                                      ),
                                    ),
                                    const Spacer(),
                                  ],
                                ),
                                const Spacer(),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Text(
                                      CustomStrings.account,
                                      style: TextStyle(
                                        color: notifire.getdarkgreycolor
                                            .withOpacity(0.6),
                                        fontSize: height / 50,
                                      ),
                                    ),
                                    SizedBox(
                                      width: width / 100,
                                    ),
                                    GestureDetector(
                                      onTap: () {
                                        Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                            builder: (context) =>
                                                const Register(),
                                          ),
                                        );
                                      },
                                      child: Text(
                                        CustomStrings.registerhere,
                                        style: TextStyle(
                                          color: notifire.getdarkscolor,
                                          fontSize: height / 50,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                                const SizedBox(height: 50),
                              ],
                            ),
                          ),
                        ),
                        Positioned(
                          left: 0,
                          right: 0,
                          top: -60,
                          child: Center(
                            child: Image.asset(
                              "images/icon/ssw.png",
                              height: height / 7,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
                Column(
                  children: [
                    SizedBox(
                      height: height / 15,
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
}
