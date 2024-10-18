import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:searchfield/searchfield.dart';
import 'package:wargaku/model/kategori_models.dart';
import 'package:wargaku/model/kecamatan.dart';
import 'package:wargaku/provider/auth/kecamatan_provider.dart';
import 'package:wargaku/view/login/login.dart';
import 'package:wargaku/view/login/verify.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../utils/button.dart';
import '../utils/colornotifire.dart';
import '../utils/media.dart';
import '../utils/string.dart';
import '../utils/textfeilds.dart';
import 'package:dropdown_search/dropdown_search.dart';

class Register extends StatefulWidget {
  const Register({super.key});

  @override
  State<Register> createState() => _RegisterState();

// _SearchFieldExampleState createState() => _SearchFieldExampleState();
}

class _RegisterState extends State<Register> {
  final TextEditingController textEditingControllerNama =
      TextEditingController();
  final TextEditingController textEditingControllerNIK =
      TextEditingController();
  final TextEditingController textEditingControllerNoTelp =
      TextEditingController();
  final TextEditingController textEditingControllerAlamat =
      TextEditingController();
  final TextEditingController textEditingControllerPassword =
      TextEditingController();
  final TextEditingController textEditingControllerKonfirmasiPassword =
      TextEditingController();
  final TextEditingController _dateController = TextEditingController();
  final TextEditingController _kecamatanController = TextEditingController();
  final TextEditingController _kelurahanController = TextEditingController();
  final TextEditingController _genderController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _confirmPasswordController =
      TextEditingController();

  late ColorNotifire notifire;

  getdarkmodepreviousstate() async {
    final prefs = await SharedPreferences.getInstance();
    bool? previusstate = prefs.getBool("setIsDark");
    notifire.setIsDark = previusstate;
  }

  @override
  void initState() {
    super.initState();
    // WidgetsBinding.instance.addPostFrameCallback((_) {
    //   Provider.of<KecamatanProvider>(context, listen: false).loadKecamatan();
    // });
    // final provider = Provider.of<KecamatanProvider>(context, listen: false);
    // provider.loadKecamatan();
  }


  @override
  Widget build(BuildContext context) {
    final kecamatanProvider = Provider.of<KecamatanProvider>(context);
    // kecamatanProvider.loadKecamatan;

    notifire = Provider.of<ColorNotifire>(context, listen: true);
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        centerTitle: true,
        elevation: 0,
        backgroundColor: notifire.getprimerycolor,
        title: Text(
          CustomStrings.register,
          style: TextStyle(
              color: notifire.getdarkscolor,
              fontFamily: 'Gilroy Bold',
              fontSize: height / 35),
        ),
      ),
      backgroundColor: notifire.getprimerycolor,
      body: SingleChildScrollView(
        child: Column(
          children: [
            Stack(
              children: [
                Container(
                  height: height * 1.85,
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
                      height: height / 13,
                    ),
                    Stack(
                      children: [
                        Center(
                          child: Container(
                            height: height * 1.69,
                            width: width / 1.1,
                            decoration: BoxDecoration(
                              color: notifire.gettabwhitecolor,
                              borderRadius:
                                  const BorderRadius.all(Radius.circular(40)),
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
                                      "Email",
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
                                  "images/fullname.png",
                                  "Masukkan Email",
                                  notifire.getdarkwhitecolor,
                                  textEditingControllerNama,
                                ),
                                SizedBox(
                                  height: height / 35,
                                ),
                                // NIK
                                Row(
                                  children: [
                                    SizedBox(width: width / 18),
                                    Text(
                                      "NIK",
                                      style: TextStyle(
                                        color: notifire.getdarkscolor,
                                        fontSize: height / 50,
                                      ),
                                    ),
                                  ],
                                ),
                                SizedBox(height: height / 70),
                                Customtextfilds.textField(
                                  notifire.getdarkscolor,
                                  notifire.getdarkgreycolor,
                                  notifire.getbluecolor,
                                  "images/fullname.png",
                                  "Masukkan NIK Anda",
                                  notifire.getdarkwhitecolor,
                                  textEditingControllerNIK,
                                ),
                                SizedBox(height: height / 35),
                                //nama
                                Row(
                                  children: [
                                    SizedBox(width: width / 18),
                                    Text(
                                      "Nama",
                                      style: TextStyle(
                                        color: notifire.getdarkscolor,
                                        fontSize: height / 50,
                                      ),
                                    ),
                                  ],
                                ),
                                SizedBox(height: height / 70),
                                Customtextfilds.textField(
                                  notifire.getdarkscolor,
                                  notifire.getdarkgreycolor,
                                  notifire.getbluecolor,
                                  "images/fullname.png",
                                  "Masukkan nama Anda",
                                  notifire.getdarkwhitecolor,
                                  textEditingControllerNIK,
                                ),
                                SizedBox(height: height / 35),

                                // No Tlp
                                Row(
                                  children: [
                                    SizedBox(width: width / 18),
                                    Text(
                                      "No Tlp",
                                      style: TextStyle(
                                        color: notifire.getdarkscolor,
                                        fontSize: height / 50,
                                      ),
                                    ),
                                  ],
                                ),
                                SizedBox(height: height / 70),
                                Customtextfilds.numericTextField(
                                  notifire.getdarkscolor,
                                  notifire.getdarkgreycolor,
                                  notifire.getbluecolor,
                                  "images/fullname.png",
                                  "Masukkan No Telepon",
                                  notifire.getdarkwhitecolor,
                                  textEditingControllerNoTelp,
                                ),

                                SizedBox(height: height / 35),
                                // Tanggal Lahir
                                Row(
                                  children: [
                                    SizedBox(width: width / 18),
                                    Text(
                                      "Tanggal Lahir",
                                      style: TextStyle(
                                        color: notifire.getdarkscolor,
                                        fontSize: height / 50,
                                      ),
                                    ),
                                  ],
                                ),
                                SizedBox(height: height / 70),
                                GestureDetector(
                                  onTap: () async {
                                    // debugPrint("okeoke");
                                  },
                                  child: Customtextfilds.dateInputField(
                                    notifire.getdarkscolor,
                                    notifire.getdarkgreycolor,
                                    notifire.getbluecolor,
                                    "images/fullname.png",
                                    'Pilih tanggal Lahir',
                                    Colors.white,
                                    _dateController,
                                    context,
                                  ),
                                ),
                                SizedBox(height: height / 35),

                                // kecamatan
                                Row(
                                  children: [
                                    SizedBox(width: width / 18),
                                    Text(
                                      "Kecamatan",
                                      style: TextStyle(
                                        color: notifire.getdarkscolor,
                                        fontSize: height / 50,
                                      ),
                                    ),
                                  ],
                                ),
                                SizedBox(height: height / 70),
                                GestureDetector(
                                  onTap: () async {
                                    // debugPrint("okeoke");
                                  },
                                  child: Customtextfilds.dateInputField(
                                    notifire.getdarkscolor,
                                    notifire.getdarkgreycolor,
                                    notifire.getbluecolor,
                                    "images/fullname.png",
                                    'Pilih tanggal Lahir',
                                    Colors.white,
                                    _dateController,
                                    context,
                                  ),
                                ),
                                SizedBox(height: height / 35),

                                //kelurahan
                                Row(
                                  children: [
                                    SizedBox(width: width / 18),
                                    Text(
                                      "Kelurahan",
                                      style: TextStyle(
                                        color: notifire.getdarkscolor,
                                        fontSize: height / 50,
                                      ),
                                    ),
                                  ],
                                ),
                                SizedBox(height: height / 70),
                                Customtextfilds.textField(
                                  notifire.getdarkscolor,
                                  notifire.getdarkgreycolor,
                                  notifire.getbluecolor,
                                  "images/fullname.png",
                                  "Masukkan Kelurahan Anda",
                                  notifire.getdarkwhitecolor,
                                  textEditingControllerNIK,
                                ),
                                SizedBox(height: height / 35),

                                // Alamat
                                Row(
                                  children: [
                                    SizedBox(width: width / 18),
                                    Text(
                                      "Alamat",
                                      style: TextStyle(
                                        color: notifire.getdarkscolor,
                                        fontSize: height / 50,
                                      ),
                                    ),
                                  ],
                                ),
                                SizedBox(height: height / 70),
                                Customtextfilds.textField(
                                  notifire.getdarkscolor,
                                  notifire.getdarkgreycolor,
                                  notifire.getbluecolor,
                                  "images/fullname.png",
                                  "Masukkan Alamat",
                                  notifire.getdarkwhitecolor,
                                  textEditingControllerAlamat,
                                ),
                                SizedBox(height: height / 35),

                                // Gender
                                Row(
                                  children: [
                                    SizedBox(width: width / 18),
                                    Text(
                                      "Jenis Kelamin",
                                      style: TextStyle(
                                        color: notifire.getdarkscolor,
                                        fontSize: height / 50,
                                      ),
                                    ),
                                  ],
                                ),
                                SizedBox(height: height / 70),
                                Customtextfilds.textField(
                                  notifire.getdarkscolor,
                                  notifire.getdarkgreycolor,
                                  notifire.getbluecolor,
                                  "images/fullname.png",
                                  "Masukkan Jenis Kelamin",
                                  notifire.getdarkwhitecolor,
                                  null, // Tambahkan dropdown atau widget lain untuk memilih jenis kelamin
                                ),
                                SizedBox(height: height / 35),

                                // Password
                                Row(
                                  children: [
                                    SizedBox(width: width / 18),
                                    Text(
                                      "Kata Sandi",
                                      style: TextStyle(
                                        color: notifire.getdarkscolor,
                                        fontSize: height / 50,
                                      ),
                                    ),
                                  ],
                                ),
                                SizedBox(height: height / 70),
                                Customtextfilds.textField(
                                  notifire.getdarkscolor,
                                  notifire.getdarkgreycolor,
                                  notifire.getbluecolor,
                                  "images/password.png",
                                  "Masukkan Kata Sandi",
                                  notifire.getdarkwhitecolor,
                                  textEditingControllerPassword,
                                ),
                                SizedBox(height: height / 35),

                                // Konfirmasi Kata Sandi
                                Row(
                                  children: [
                                    SizedBox(width: width / 18),
                                    Text(
                                      "Konfirmasi Kata Sandi",
                                      style: TextStyle(
                                        color: notifire.getdarkscolor,
                                        fontSize: height / 50,
                                      ),
                                    ),
                                  ],
                                ),
                                SizedBox(height: height / 70),
                                Customtextfilds.textField(
                                  notifire.getdarkscolor,
                                  notifire.getdarkgreycolor,
                                  notifire.getbluecolor,
                                  "images/password.png",
                                  "Masukkan Ulang Kata Sandi",
                                  notifire.getdarkwhitecolor,
                                  textEditingControllerKonfirmasiPassword,
                                ),
                                SizedBox(height: height / 35),

                                GestureDetector(
                                  onTap: () {
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (context) => const Verify(),
                                      ),
                                    );
                                  },
                                  child: Custombutton.button(
                                    notifire.getbluecolor,
                                    "Daftar Akun",
                                    width / 2,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          CustomStrings.accounts,
                          style: TextStyle(
                            color: notifire.getdarkgreycolor.withOpacity(0.6),
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
                                  builder: (context) => const Login(),
                                ));
                          },
                          child: Text(
                            CustomStrings.loginhear,
                            style: TextStyle(
                              color: notifire.getdarkscolor,
                              fontSize: height / 50,
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
                      height: height / 60,
                    ),
                    Center(
                      child: Image.asset(
                        "images/icon/ssw.png",
                        height: height / 8,
                      ),
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
